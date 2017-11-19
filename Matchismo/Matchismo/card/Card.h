//
//  Created by justin on 2017/11/19.
//  Copyright (c) 2017 and beyond Justin Zhang. All rights reserved.
//
// GitHub:
// https://github.com/schnell18
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (nonatomic, strong) NSString* contents;
@property (nonatomic) int scorePerMatch;
@property (nonatomic) BOOL matched;
@property (nonatomic) BOOL chosen;

- (int) match:(Card *)card;
- (int) matchAny:(NSArray *)otherCards;
@end
