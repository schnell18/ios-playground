//
//  Created by justin on 2017/11/19.
//  Copyright (c) 2017 and beyond Justin Zhang. All rights reserved.
//
// GitHub:
// https://github.com/schnell18
//


#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self redeal];
    }
    return self;
}

- (void)redeal
{
    [super redeal];
    for (int i = 1; i <= [PlayingCard maxRank]; i ++) {
        for (NSString *suit in [PlayingCard validSuits]) {
            PlayingCard * card = [[PlayingCard alloc] init];
            card.rank = i;
            card.suit = suit;
            [self addCard :card];
        }
    }
}

@end
