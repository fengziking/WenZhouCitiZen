//
//  UIButton+Easy.m
//  JinHuaCitizen
//
//  Created by 朱书峰 on 2017/9/4.
//  Copyright © 2017年 Frank-Lee. All rights reserved.
//

#import "UIButton+Easy.h"

@implementation UIButton (Easy)
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(NSString *)imageStr textFont:(CGFloat )font textColor:(UIColor *)color backgroundColor:(UIColor *)backgroundColor action:(void(^)(UIButton *btn))handler {
    //取消按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    
    [btn jh_clickActionBlock:^(UIButton *button) {
        handler(button);
    }];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    btn.backgroundColor = backgroundColor;
    return btn;
}
@end
