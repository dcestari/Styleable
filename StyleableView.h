//
//  StyleableView.h
//  Styleable
//
//  Created by Daniel Cestari on 12/2/15.
//  Copyright © 2015 Daniel Cestari. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface StyleableView : UIView

@property (nonatomic) IBInspectable CGFloat cornerRadius;

@property (nonatomic) IBInspectable BOOL chooseCornersToRound;

@property (nonatomic) IBInspectable BOOL roundCornerTopLeft;
@property (nonatomic) IBInspectable BOOL roundCornerTopRight;
@property (nonatomic) IBInspectable BOOL roundCornerBottomRight;
@property (nonatomic) IBInspectable BOOL roundCornerBottomLeft;

@property (nonatomic) IBInspectable CGSize shadowOffset;
@property (nonatomic) IBInspectable float shadowOpacity;
@property (nonatomic, strong) IBInspectable UIColor *shadowColor;
@property (nonatomic) IBInspectable CGFloat shadowRadius;

@property (nonatomic) IBInspectable BOOL shadowOnly;

@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable UIColor *borderColor;

+ (instancetype)styleableViewWithView:(StyleableView*)view;

@end
