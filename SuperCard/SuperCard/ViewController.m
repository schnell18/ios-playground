//
//  Created by justin on 2017/11/28.
//  Copyright (c) 2017 and beyond Justin Zhang. All rights reserved.
//
// GitHub:
// https://github.com/schnell18
//


#import "ViewController.h"
#import "PlayingCardView.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(PlayingCardView) NSArray *cards;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *suits = @[@"♠", @"♥", @"♣", @"♦"];
    NSUInteger idx = 0;
    for (id card in self.cards) {
        PlayingCardView *pc = (PlayingCardView*)card;
        pc.suit = suits[idx++ % [suits count]];
        //pc.suit = @"♥";
        pc.rank = 11;
        pc.faceUp = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
