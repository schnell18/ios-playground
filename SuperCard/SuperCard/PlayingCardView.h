//
//  Created by justin on 2017/11/28.
//  Copyright (c) 2017 and beyond Justin Zhang. All rights reserved.
//
// GitHub:
// https://github.com/schnell18
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView
@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) BOOL faceUp;
@end
