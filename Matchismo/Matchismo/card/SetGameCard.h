//
//  Created by justin on 2017/11/26.
//  Copyright (c) 2017 and beyond Justin Zhang. All rights reserved.
//
// GitHub:
// https://github.com/schnell18
//

#import <Foundation/Foundation.h>
#import "Card.h"


@interface SetGameCard : Card
@property (nonatomic) NSUInteger number;
@property (nonatomic) NSUInteger shape;
@property (nonatomic) NSUInteger color;
@property (nonatomic) NSUInteger shading;

- (instancetype)initWithNumber:(NSUInteger)number shape:(NSUInteger)shape shading:(NSUInteger)shading color:(NSUInteger)color;

+ (NSArray *) validShapes;   //of NSString

@end
