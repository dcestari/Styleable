//
//  StyleableButton.m
//  Styleable
//
//  Created by Daniel Cestari on 12/2/15.
//  Copyright © 2015 Daniel Cestari. All rights reserved.
//

#import "StyleableButton.h"

@interface StyleableButton ()

@property (nonatomic, strong) CAShapeLayer *borderLayer;

@end

@implementation StyleableButton

+ (instancetype)styleableButtonWithButton:(StyleableButton*)button {
    StyleableButton *newButton = [StyleableButton new];
    newButton.cornerRadius = button.cornerRadius;
    newButton.borderWidth = button.borderWidth;
    newButton.borderColor = button.borderColor;
    newButton.dashedLine = button.dashedLine;
    newButton.shadowOffset = button.shadowOffset;
    newButton.shadowOpacity = button.shadowOpacity;
    newButton.shadowColor = button.shadowColor;
    newButton.shadowRadius = button.shadowRadius;
    newButton.underlineText = button.underlineText;

    return newButton;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUpHelperLayers];
    [self updateUI];
}

- (void)setUpHelperLayers {
    if (_dashedLine) {
        _borderLayer = [CAShapeLayer layer];
        [self.layer addSublayer:_borderLayer];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateUI];
}

- (void)updateUI {
    if (_dashedLine) {
        _borderLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:_cornerRadius].CGPath;
        _borderLayer.lineDashPattern = @[ @6, @2 ];
        _borderLayer.lineWidth = _borderWidth;
        _borderLayer.lineJoin = kCALineJoinRound;
        _borderLayer.fillColor = UIColor.clearColor.CGColor;

        if (_borderColor != nil) {
            _borderLayer.strokeColor = _borderColor.CGColor;
        }
    } else {
        if (_borderColor != nil) {
            self.layer.borderColor = _borderColor.CGColor;
            self.layer.borderWidth = _borderWidth;
        }

        self.layer.cornerRadius = _cornerRadius;
    }

    if (_shadowColor) {
        self.layer.shadowOffset = _shadowOffset;
        self.layer.shadowOpacity = _shadowOpacity;
        self.layer.shadowColor = _shadowColor.CGColor;
        self.layer.shadowRadius = _shadowRadius;
    }

#if !TARGET_INTERFACE_BUILDER
    if (_underlineText) {
        NSString *text = [self titleForState:UIControlStateNormal];
        NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:text attributes:@{
            NSForegroundColorAttributeName: self.titleLabel.textColor,
            NSUnderlineStyleAttributeName:  @(NSUnderlineStyleSingle)
        }];
        [self setAttributedTitle:attributedText forState:UIControlStateNormal];
    }
#endif
}

- (void)prepareForInterfaceBuilder {
    [self setUpHelperLayers];
    [self updateUI];
}

@end
