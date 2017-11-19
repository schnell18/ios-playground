//
//  Created by justin on 2017/11/19.
//  Copyright (c) 2017 and beyond Justin Zhang. All rights reserved.
//
// GitHub:
// https://github.com/schnell18
//


#import <Foundation/Foundation.h>
#import "Card.h"

@implementation Card

#define DEFAULT_SCORE_PER_MATCH 10

- (int)scorePerMatch
{
    if (!_scorePerMatch) {
        _scorePerMatch = DEFAULT_SCORE_PER_MATCH;
    }
    return _scorePerMatch;

}

- (int) match:(Card *)card
{
    int scores = 0;
    if (card && [self.contents isEqualToString:card.contents]) {
        scores += self.scorePerMatch;
    }
    return scores;
    
}

- (int) matchAny:(NSArray *)otherCards
{
    int scores = 0;
    if (otherCards) {
        for (int i = 0; i < [otherCards count]; i ++) {
            id oc = otherCards[i];
            if ([oc isKindOfClass: [Card class]]) {
                scores += [self match:oc];
            }
        }
    }
    return scores;
}
@end
