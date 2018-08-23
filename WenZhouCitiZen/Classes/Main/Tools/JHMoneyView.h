//
//  JHMoneyView.h
//  JinHuaCitizen
//
//  Created by Frank-Lee on 17/10/20.
//  Copyright © 2017年 Frank-Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHMoneyView : UIView

@property(nonatomic,copy)void(^buttonBlock)(NSString *money) ;
-(instancetype)initWithFrame:(CGRect)frame WithTitle:(NSArray *)titleArr ;

//#pragma mark == 是否有选中 搜索类别的 button
-(BOOL)isSelect ;


@end
