//
//  UIButton+Easy.h
//  JinHuaCitizen
//
//  Created by 朱书峰 on 2017/9/4.
//  Copyright © 2017年 Frank-Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Easy)
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(NSString *)imageStr textFont:(CGFloat )font textColor:(UIColor *)color backgroundColor:(UIColor *)backgroundColor action:(void(^)(UIButton *btn))handler;
@end
