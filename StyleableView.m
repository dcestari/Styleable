//
//  StyleableView.m
//  Styleable
//
//  Created by Daniel Cestari on 12/2/15.
//  Copyright © 2015 Daniel Cestari. All rights reserved.
//

#import "StyleableView.h"

@interface StyleableView ()

@property (nonatomic, strong) CAShapeLayer *maskLayer;

@end

@implementation StyleableView

+ (instancetype)styleableViewWithView:(StyleableView *)view {
    StyleableView *newView = [StyleableView new];
    newView.backgroundColor = view.backgroundColor;
    newView.cornerRadius = view.cornerRadius;
    newView.shadowColor = view.shadowColor;
    newView.shadowOffset = view.shadowOffset;
    newView.shadowOpacity = view.shadowOpacity;
    newView.shadowRadius = view.shadowRadius;

    return newView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUpHelperLayers];
    [self updateUI];
}

- (void)setUpHelperLayers {
    _maskLayer = [CAShapeLayer layer];
    self.layer.mask = _maskLayer;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateUI];
}

- (void)updateUI {
    if (_chooseCornersToRound) {
        NSInteger roundingCorners = 0;

        if (_roundCornerTopLeft) {
            roundingCorners |= UIRectCornerTopLeft;
        }

        if (_roundCornerTopRight) {
            roundingCorners |= UIRectCornerTopRight;
        }

        if (_roundCornerBottomRight) {
            roundingCorners |= UIRectCornerBottomRight;
        }

        if (_roundCornerBottomLeft) {
            roundingCorners |= UIRectCornerBottomLeft;
        }

        _maskLayer.frame = self.bounds;
        _maskLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                byRoundingCorners:roundingCorners
                                                      cornerRadii:CGSizeMake(_cornerRadius, _cornerRadius)].CGPath;
    } else if (_shadowOnly && _shadowColor) {
        UIBezierPath *shadowPath = [UIBezierPath new];

        if (_roundCornerTopLeft && _roundCornerTopRight) {
            [shadowPath moveToPoint:CGPointMake(0, CGRectGetHeight(self.bounds))];
            [shadowPath addLineToPoint:CGPointMake(0, _cornerRadius)];
            [shadowPath addArcWithCenter:CGPointMake(_cornerRadius, _cornerRadius)
                                  radius:_cornerRadius
                              startAngle:M_PI
                                endAngle:3*M_PI/2
                               clockwise:YES];
            [shadowPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds) - _cornerRadius, 0)];
            [shadowPath addArcWithCenter:CGPointMake(CGRectGetWidth(self.bounds) - _cornerRadius, _cornerRadius)
                                  radius:_cornerRadius
                              startAngle:3*M_PI/2
                                endAngle:2*M_PI
                               clockwise:YES];
            [shadowPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];

            [shadowPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds) / 2, 2)];
            [shadowPath closePath];
        } else if (_roundCornerBottomLeft && _roundCornerBottomRight) {
            [shadowPath moveToPoint:CGPointMake(0, 0)];
            [shadowPath addLineToPoint:CGPointMake(0, CGRectGetHeight(self.bounds) - _cornerRadius)];
            [shadowPath addArcWithCenter:CGPointMake(_cornerRadius, CGRectGetHeight(self.bounds) - _cornerRadius)
                                  radius:_cornerRadius
                              startAngle:M_PI
                                endAngle:M_PI/2
                               clockwise:NO];
            [shadowPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds) - _cornerRadius, CGRectGetHeight(self.bounds))];
            [shadowPath addArcWithCenter:CGPointMake(CGRectGetWidth(self.bounds) - _cornerRadius, CGRectGetHeight(self.bounds) -_cornerRadius)
                                  radius:_cornerRadius
                              startAngle:M_PI/2
                                endAngle:2*M_PI
                               clockwise:NO];
            [shadowPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds), 0)];

            [shadowPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds) / 2, CGRectGetHeight(self.bounds) - 2)];
            [shadowPath closePath];
        } else {
            [shadowPath moveToPoint:CGPointMake(0, CGRectGetHeight(self.bounds))];
            [shadowPath addLineToPoint:CGPointMake(0, 0)];
            [shadowPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
            [shadowPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds), 0)];
            [shadowPath closePath];
        }

        self.layer.mask = nil;
        self.layer.shadowOffset = _shadowOffset;
        self.layer.shadowOpacity = _shadowOpacity;
        self.layer.shadowColor = _shadowColor.CGColor;
        self.layer.shadowRadius = _shadowRadius;
        self.layer.shadowPath = shadowPath.CGPath;
    } else {
        self.layer.cornerRadius = _cornerRadius;
        self.layer.mask = nil;

        if (_shadowColor) {
            self.layer.shadowOffset = _shadowOffset;
            self.layer.shadowOpacity = _shadowOpacity;
            self.layer.shadowColor = _shadowColor.CGColor;
            self.layer.shadowRadius = _shadowRadius;
        }

        if (_borderColor) {
            self.layer.borderWidth = _borderWidth;
            self.layer.borderColor = _borderColor.CGColor;
        }
    }
}

- (void)prepareForInterfaceBuilder {
    [self setUpHelperLayers];
    [self updateUI];
}

@end
