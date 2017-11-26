//
//  Created by justin on 2017/11/19.
//  Copyright (c) 2017 and beyond Justin Zhang. All rights reserved.
//
// GitHub:
// https://github.com/schnell18
//


#import <Foundation/Foundation.h>
#import "Deck.h"
#import "SetGame.h"

@interface SetGame()
@property (nonatomic, readwrite) int score;
@property (nonatomic, strong) NSMutableArray *cards; //of card
@property (nonatomic) NSUInteger cardCount;
@property (nonatomic, strong) Deck *deck;
@end

@implementation SetGame


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

- (void)redrawWithCard:(NSUInteger)index1 Card2:(NSUInteger)index2 Card3:(NSUInteger)index3
{
    self.cards[index1] = [_deck drawRandomCard];
    self.cards[index2] = [_deck drawRandomCard];
    self.cards[index3] = [_deck drawRandomCard];
}

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *picked = [self cardAtIndex:index];
    
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
            if (otherCard1.chosen && otherCard2.chosen) {
                int score = [picked matchAny:@[otherCard1, otherCard2]];
                if (score > 0) {
                    self.score += score;
                    [self redrawWithCard:index Card2:i Card3:j];
                }
                else {
                    otherCard1.chosen = NO;
                    otherCard2.chosen = NO;
                    picked.chosen = NO;
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
