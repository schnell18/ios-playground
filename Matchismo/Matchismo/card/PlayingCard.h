//
//  Created by justin on 2017/11/19.
//  Copyright (c) 2017 and beyond Justin Zhang. All rights reserved.
//
// GitHub:
// https://github.com/schnell18
//

#import "Card.h"

@interface PlayingCard : Card
@property (nonatomic) NSUInteger rank;
@property (nonatomic, strong) NSString* suit;

+ (NSArray *)validSuits;
+ (NSArray *)rankStrings;
+ (NSUInteger)maxRank;
@end
