//
//  Created by justin on 2017/11/19.
//  Copyright (c) 2017 and beyond Justin Zhang. All rights reserved.
//
// GitHub:
// https://github.com/schnell18
//


#import <XCTest/XCTest.h>
#import "Deck.h"
#import "PlayingCard.h"
#import "PlayingCardGame.h"

@interface MatchismoTests : XCTestCase
@property (nonatomic, strong) PlayingCardGame *game;
@end

@implementation MatchismoTests

- (void)setUp {
    [super setUp];
    Deck *deck19 = [[Deck alloc] init];
    for (int i = 0; i < 19; i++) {
        PlayingCard *card = [[PlayingCard alloc] init];
        card.rank = 10;
        card.scorePerMatch = 20;
        card.suit = @"♡";
        [deck19 addCard:card];
    }
    _game = [[PlayingCardGame alloc] initWithCardCount: 12 usingDeck: deck19];
}

- (void)tearDown {
    [super tearDown];
    
}

- (void)testMatchingOnceUsingDeckWithIdenticalCards {
    [self.game chooseCardAtIndex:1];
    [self.game chooseCardAtIndex:2];
    XCTAssertEqual(self.game.score, 20);
    // choose same card again should not increase score
    [self.game chooseCardAtIndex:2];
    XCTAssertEqual(self.game.score, 20);
}

- (void)testMatchingTwiceUsingDeckWithIdenticalCards {
    [self.game chooseCardAtIndex:1];
    [self.game chooseCardAtIndex:2];
    [self.game chooseCardAtIndex:3];
    [self.game chooseCardAtIndex:4];
    XCTAssertEqual(self.game.score, 40);
    // choose same card combination again should not increase score
    [self.game chooseCardAtIndex:3];
    [self.game chooseCardAtIndex:4];
    XCTAssertEqual(self.game.score, 40);
    // one more match
    [self.game chooseCardAtIndex:5];
    [self.game chooseCardAtIndex:6];
    XCTAssertEqual(self.game.score, 60);
    // index out of bound
    [self.game chooseCardAtIndex:25];
    XCTAssertEqual(self.game.score, 60);
}

- (void)testPerformanceExample {
    [self measureBlock:^{
        for (int i = 0; i < 10000; i ++) {
            [self.game chooseCardAtIndex:1];
            [self.game chooseCardAtIndex:2];
            XCTAssertEqual(self.game.score, 20);
        }
    }];
}

@end
