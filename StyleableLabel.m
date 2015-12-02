//
//  StyleableLabel.m
//  Styleable
//
//  Created by Daniel Cestari on 12/2/15.
//  Copyright © 2015 Daniel Cestari. All rights reserved.
//

#import "StyleableLabel.h"

@implementation StyleableLabel

- (void)awakeFromNib {
    [super awakeFromNib];
    [self updateUI];
}

- (void)prepareForInterfaceBuilder {
    [self updateUI];
}

- (void)updateUI {
    if (_labelShadowColor) {
        self.layer.shadowOffset = _labelShadowOffset;
        self.layer.shadowOpacity = _shadowOpacity;
        self.layer.shadowColor = _labelShadowColor.CGColor;
        self.layer.shadowRadius = _shadowRadius;
    }
}

@end
