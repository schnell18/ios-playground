//
//  Created by justin on 2017/11/19.
//  Copyright (c) 2017 and beyond Justin Zhang. All rights reserved.
//
// GitHub:
// https://github.com/schnell18
//


#import "SetGameDeck.h"
#import "SetGameCard.h"

@implementation SetGameDeck

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
    for (int i = 1; i <= 3; i ++) {
        for (int j = 0; j < 3; j ++) {
            for (int k = 0; k < 3; k ++) {
                for (int l = 0; l < 3; l ++) {
                    SetGameCard *card = [[SetGameCard alloc] initWithNumber:i
                                                                      shape:j
                                                                    shading:k
                                                                      color:l];
                    [super addCard:card];
                }
            }
        }
    }
}

@end
