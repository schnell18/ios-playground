//
//  Created by justin on 2017/11/24.
//  Copyright (c) 2017 and beyond Justin Zhang. All rights reserved.
//
// GitHub:
// https://github.com/schnell18
//


#import "TextStatusViewController.h"

@interface TextStatusViewController()
@property (weak, nonatomic) IBOutlet UILabel *colorfulCharacters;
@property (weak, nonatomic) IBOutlet UILabel *outlinedCharacters;
@end

@implementation TextStatusViewController
- (void)setTextToAnalyze:(NSAttributedString *)textToAnalyze
{
    _textToAnalyze = textToAnalyze;
    if (self.view.window) [self updateUI];
}

// - (void)viewDidLoad
// {
//     self.textToAnalyze = [[NSAttributedString alloc] initWithString:@"Test" attributes:@{ NSForegroundColorAttributeName: [UIColor greenColor], NSStrokeWidthAttributeName: @-3 }];
// }

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (NSAttributedString *)charactersWithAttribute:(NSString *)attributeName
{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc] init];
    NSUInteger index = 0;
    while (index < [self.textToAnalyze length]) {
        NSRange range;
        id value = [self.textToAnalyze attribute: attributeName atIndex:index effectiveRange:&range];
        if (value) {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        }
        else {
            index ++;
        }
    }
    return characters;
}

- (void)updateUI
{
    _colorfulCharacters.text = [NSString stringWithFormat:@"%lu colorful characters", [[self charactersWithAttribute: NSForegroundColorAttributeName] length]];
    
    _outlinedCharacters.text = [NSString stringWithFormat:@"%lu outlined characters", [[self charactersWithAttribute: NSStrokeWidthAttributeName] length]];
}

@end
