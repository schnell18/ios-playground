//
//  Created by justin on 2017/11/19.
//  Copyright (c) 2017 and beyond Justin Zhang. All rights reserved.
//
// GitHub:
// https://github.com/schnell18
//


#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCardGame.h"

@interface ViewController ()
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) PlayingCardGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *matchModeSwitch;
@end

@implementation ViewController

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
    _matchModeSwitch.enabled = YES;
}

- (IBAction)touchCardButton:(UIButton *)sender {
    [self.game chooseCardAtIndex:[_cardButtons indexOfObject:sender]];
    [self updateUI];
    _matchModeSwitch.enabled = NO;
}

- (void)updateUI
{
    for (int i = 0; i < [_cardButtons count]; i ++) {
        UIButton *button = _cardButtons[i];
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
