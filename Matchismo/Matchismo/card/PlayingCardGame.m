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

- (Card *)cardAtIndex:(NSUInteger)index
{
    if (index < [self.cards count]) {
        return self.cards[index];
    }
    return nil;
}

@end
