//
//  StyleableLabel.h
//  Styleable
//
//  Created by Daniel Cestari on 12/2/15.
//  Copyright © 2015 Daniel Cestari. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface StyleableLabel : UILabel

@property (nonatomic) IBInspectable CGSize labelShadowOffset;
@property (nonatomic) IBInspectable float shadowOpacity;
@property (nonatomic, strong) IBInspectable UIColor *labelShadowColor;
@property (nonatomic) IBInspectable CGFloat shadowRadius;

@end
