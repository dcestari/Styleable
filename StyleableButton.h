//
//  StyleableButton.h
//  Styleable
//
//  Created by Daniel Cestari on 12/2/15.
//  Copyright © 2015 Daniel Cestari. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface StyleableButton : UIButton

@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable UIColor  *borderColor;

@property (nonatomic) IBInspectable BOOL dashedLine;

@property (nonatomic) IBInspectable CGSize shadowOffset;
@property (nonatomic) IBInspectable float shadowOpacity;
@property (nonatomic, strong) IBInspectable UIColor *shadowColor;
@property (nonatomic) IBInspectable CGFloat shadowRadius;

@property (nonatomic) IBInspectable BOOL underlineText;

+ (instancetype)styleableButtonWithButton:(StyleableButton*)button;

@end
