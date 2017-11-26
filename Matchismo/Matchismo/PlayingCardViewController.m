//
//  Created by justin on 2017/11/19.
//  Copyright (c) 2017 and beyond Justin Zhang. All rights reserved.
//
// GitHub:
// https://github.com/schnell18
//


#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCardGame.h"

@interface PlayingCardViewController ()
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) PlayingCardGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *pcvcCardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation PlayingCardViewController

- (PlayingCardGame *)game
{
    if (!_game) {
        _game = [[PlayingCardGame alloc] initWithCardCount: 16
                                                 usingDeck:self.deck];
    }
    return _game;
}

- (Deck *)deck
{
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}

- (IBAction)touchMatchModeSwitch:(UISegmentedControl *)sender {
    self.game.matchingCardCount = [sender selectedSegmentIndex] + 2;
}

- (IBAction)touchRedeal:(UIButton *)sender {
    [self.game redeal];
    [self updateUI];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    [self.game chooseCardAtIndex:[self.pcvcCardButtons indexOfObject:sender]];
    [self updateUI];
}

- (void)updateUI
{
    for (int i = 0; i < [self.pcvcCardButtons count]; i ++) {
        UIButton *button = self.pcvcCardButtons[i];
        Card *card = [self.game cardAtIndex:i];
        if (card.chosen) {
            [button setTitle:card.contents
                    forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
        }
        else {
            [button setTitle:@""
                    forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"cardback"]
                              forState:UIControlStateNormal];
        }
        [button setEnabled:!card.matched];
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Scores: %d", self.game.score];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
