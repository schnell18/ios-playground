//
//  Created by justin on 2017/11/19.
//  Copyright (c) 2017 and beyond Justin Zhang. All rights reserved.
//
// GitHub:
// https://github.com/schnell18
//


#import <Foundation/Foundation.h>
#import "Deck.h"
#import "PlayingCardGame.h"

@interface PlayingCardGame()
@property (nonatomic, readwrite) int score;
@property (nonatomic, strong) NSMutableArray *cards; //of card
@property (nonatomic) NSUInteger cardCount;
@property (nonatomic, strong) Deck *deck;
@end

@implementation PlayingCardGame

#define MISMATCH_PENALTY 1

- (NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        _cardCount = count;
        _deck = deck;
        [self redeal];
    }
    return self;
}

- (void)redeal
{
    if (_deck) {
        [_deck redeal];
        for (int i = 0; i < _cardCount; i++) {
            self.cards[i] = [_deck drawRandomCard];
        }
        self.score = 0;
    }
}

- (void)chooseCardAtIndex:(NSUInteger)index
{
    if (self.matchingCardCount == 3) {
        [self threeCardMatching:index];
    }
    else {
        [self twoCardMatching:index];
    }
}

- (void)twoCardMatching:(NSUInteger)index
{
    Card *picked = [self cardAtIndex:index];
    if (!picked.matched) {
        if (!picked.chosen) {
            picked.chosen = YES;
        }
        for (int i = 0; i < [self.cards count]; i ++) {
            // skip current picked card
            if (i == index) {
                continue;
            }
            Card *otherCard = [self cardAtIndex:i];
            if (otherCard.chosen && !otherCard.matched) {
                int score = [picked match:otherCard];
                if (score > 0) {
                    picked.matched = YES;
                    otherCard.matched = YES;
                    self.score += score;
                }
                else {
                    self.score -= MISMATCH_PENALTY;
                    otherCard.chosen = NO;
                }
                break;
            }
        }
    }
}

- (void)threeCardMatching:(NSUInteger)index
{
    Card *picked = [self cardAtIndex:index];
    if (!picked.matched) {
        if (!picked.chosen) {
            picked.chosen = YES;
        }
        for (int i = 0; i < [self.cards count]; i ++) {
            // skip current picked card
            if (i == index) {
                continue;
            }
            Card *otherCard1 = [self cardAtIndex:i];
            for (int j = 0; j < [self.cards count]; j ++) {
                // skip current picked card
                if (j == index || j == i) {
                    continue;
                }
                Card *otherCard2 = [self cardAtIndex:j];
                if (otherCard1.chosen
                    && !otherCard1.matched
                    && otherCard2.chosen
                    && !otherCard2.matched) {
                    int score = [picked matchAny:@[otherCard1, otherCard2]];
                    if (score <= 0) {
                        score = [otherCard1 matchAny:@[picked, otherCard2]];
                    }
                    if (score > 0) {
                        picked.matched = YES;
                        otherCard1.matched = YES;
                        otherCard2.matched = YES;
                        self.score += score;
                    }
                    else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard1.chosen = NO;
                        otherCard2.chosen = NO;
                    }
                    break;
                }
            }
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    if (index < [self.cards count]) {
        return self.cards[index];
    }
    return nil;
}

@end
