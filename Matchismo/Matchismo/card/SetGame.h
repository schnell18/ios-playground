//
//  Created by justin on 2017/11/19.
//  Copyright (c) 2017 and beyond Justin Zhang. All rights reserved.
//
// GitHub:
// https://github.com/schnell18
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface SetGame : NSObject
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
- (void)redeal;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;
@property (nonatomic, readonly) int score;
@property (nonatomic) NSUInteger matchingCardCount;
@end
