//
//  Created by justin on 2017/11/19.
//  Copyright (c) 2017 and beyond Justin Zhang. All rights reserved.
//
// GitHub:
// https://github.com/schnell18
//


#import "PlayingCard.h"


@implementation PlayingCard

- (NSString *)contents
{
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits]containsObject:suit]) {
        _suit = suit;
    }
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

+ (NSArray *)validSuits
{
    return @[@"♣️", @"♥️", @"♠️", @"♦", @"♤", @"♡", @"♢", @"♧"];
}

+ (NSArray *)rankStrings
{
    return @[
        @"?" , @"A" , @"2"  , @"3" ,
        @"4" , @"5" , @"6"  , @"7" ,
        @"8" , @"9" , @"10" , @"J" ,
        @"Q" , @"K"
    ];
}

+ (NSUInteger)maxRank
{
    return [[self rankStrings] count] - 1;
}
@end
