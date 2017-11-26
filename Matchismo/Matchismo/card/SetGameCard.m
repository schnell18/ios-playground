//
//  Created by justin on 2017/11/26.
//  Copyright (c) 2017 and beyond Justin Zhang. All rights reserved.
//
// GitHub:
// https://github.com/schnell18
//


#import "SetGameCard.h"

@interface SetGameCard()
@end

@implementation SetGameCard

- (instancetype)initWithNumber:(NSUInteger)number shape:(NSUInteger)shape shading:(NSUInteger)shading color:(NSUInteger)color
{
    self = [super init];
    if (self) {
        self.number = number;
        self.shading = shading;
        self.shape = shape;
        self.color = color;
    }
    return self;
}

- (NSString *)contents
{
    return [@"" stringByPaddingToLength:self.number withString:[SetGameCard validShapes][self.shape] startingAtIndex:0];
}

- (int) matchAny:(NSArray *)otherCards
{
    if ([otherCards count] == 2) {
        SetGameCard *card1 = otherCards[0];
        SetGameCard *card2 = otherCards[1];
        BOOL numberEquals = ((self.number == card1.number && self.number == card2.number) || (self.number != card1.number && self.number != card2.number));
        BOOL shapeEquals = ((self.shape == card1.shape && self.shape == card2.shape) || (self.shape != card1.shape && self.shape != card2.shape));
        BOOL shadingEquals = ((self.shading == card1.shading && self.shading == card2.shading) || (self.shading != card1.shading && self.shading != card2.shading));
        BOOL colorEquals = ((self.color == card1.color && self.color == card2.color) || (self.color != card1.color && self.color != card2.color));
        return numberEquals && shapeEquals && shadingEquals && colorEquals ? 3 : 0;
    }
    return 0;
}

+ (NSArray *) validShapes
{
    return @[@"▲", @"●", @"■"];
}

@end
