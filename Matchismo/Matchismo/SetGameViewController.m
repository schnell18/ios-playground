//
//  Created by justin on 2017/11/19.
//  Copyright (c) 2017 and beyond Justin Zhang. All rights reserved.
//
// GitHub:
// https://github.com/schnell18
//


#import "SetGameViewController.h"
#import "Deck.h"
#import "SetGame.h"
#import "SetGameDeck.h"
#import "SetGameCard.h"

@interface SetGameViewController ()
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) SetGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *sgvcCardButtons;
@end

@implementation SetGameViewController

+ (NSArray *) colors
{
    return @[[UIColor redColor], [UIColor greenColor], [UIColor purpleColor]];
}

+ (NSArray *) strokeWidths
{
    return @[@0, @0, @3];
}

- (IBAction)touchRedeal:(UIButton *)sender {
    [self.game redeal];
    [self updateUI];
}

- (SetGame *)game
{
    if (!_game) {
        _game = [[SetGame alloc] initWithCardCount: 12
                                        usingDeck:self.deck];
    }
    return _game;
}

- (Deck *)deck
{
    if (!_deck) {
        _deck = [[SetGameDeck alloc] init];
    }
    return _deck;
}

- (IBAction)touchButton:(UIButton *)sender {
    [self.game chooseCardAtIndex: [self.sgvcCardButtons indexOfObject:sender]];
    [self updateUI];
}

- (void)updateUI
{
    for (int i = 0; i < [self.sgvcCardButtons count]; i ++) {
        UIButton *button = self.sgvcCardButtons[i];
        SetGameCard *card = (SetGameCard *)[self.game cardAtIndex:i];
        NSDictionary *attributes = @{
                                     NSForegroundColorAttributeName: [SetGameViewController colors][card.color],
                                     NSStrokeWidthAttributeName: [SetGameViewController strokeWidths][card.shading]
        };
        NSLog(@"%@", card.contents);
        NSAttributedString *content = [[NSAttributedString alloc] initWithString:card.contents
                                                                      attributes:attributes];
        [button setAttributedTitle:content forState:UIControlStateNormal];
        [button setEnabled:!card.chosen];
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Scores: %d", self.game.score];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
