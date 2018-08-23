//
//  JHBtnListView.h
//  JinHuaCitizen
//
//  Created by 朱书峰 on 2017/9/2.
//  Copyright © 2017年 Frank-Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^actionBlock)(UIButton *btn);
@interface JHBtnListView : UIView
#define KJHBtnH 50
#define KJHBtnAmount 3

/**
 初始化布局按钮，可以是固定的，和自适应宽度的
 @param frame frame
 @param isAdaptive 是否自适应
 @param btnCount 每行的个数
 @param titleArr 数据
 @param handler 点击回调
 @return 实例
 固定宽度---计算试图的高度
 CGFloat acount =  array.count % KJHBtnAmount == 0 ? (array.count /KJHBtnAmount) : (array.count /KJHBtnAmount + 1);
 CGFloat btnH = KJHBtnH * acount + 20 + (acount - 1)*10;
 动态宽度---计算试图的高度
 NSArray *array = @[@"大钱包充值",@"NFC充值",@"华数业务开通",@"双龙年卡开通",@"双龙年卡续费"];
 CGFloat H = 10;
 CGFloat W = 10;
 for (int i = 0; i < array.count; i++) {
 //取出标题
 NSString *title = [array objectAtIndexCheck:i];
 //title的宽度
 CGFloat length = [CJTool sizeWithString:title font:kFontSize16 maxSize:CGSizeMake(KScreenWidth - 20, 30)].width;
 //动态配置
 if(10 + W + length +15 > KScreenWidth - 20){
 W = 10;
 H = H + KJHBtnH +10;//距离父视图也变化
 
 }
 W = length +15 + W +10;
 }

 */
- (instancetype)initWithFrame:(CGRect)frame isAdaptive:(BOOL )isAdaptive btnCount:(NSInteger )btnCount titleArr:(NSArray *)titleArr action:(actionBlock )handler;

/**
 获取视图高度

 @param titleArr 数组
 @param isAdaptive 是否动态配置
 @return 高度
 */
+ (CGFloat )heightBtnViewTitleArr:(NSArray *)titleArr isAdaptive:(BOOL )isAdaptive ;
@end
