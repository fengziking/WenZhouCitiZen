//
//  JHBtnListView.m
//  JinHuaCitizen
//
//  Created by 朱书峰 on 2017/9/2.
//  Copyright © 2017年 Frank-Lee. All rights reserved.
//

#import "JHBtnListView.h"

@implementation JHBtnListView

- (instancetype)initWithFrame:(CGRect)frame isAdaptive:(BOOL )isAdaptive btnCount:(NSInteger )btnCount titleArr:(NSArray *)titleArr action:(actionBlock )handler {
    if (self = [super initWithFrame:frame]) {
        //固定宽度
        NSInteger kbtnCount = btnCount == 0 ? KJHBtnAmount: btnCount;
        CGFloat btnWidth = (KScreenWidth- 40) / kbtnCount;
        //动态配置
        CGFloat W = 0;
        CGFloat H = 10;
        for (int i = 0; i < titleArr.count; i ++) {
            UIButton *btn = [[UIButton alloc]init];
            if (!isAdaptive) {//固定宽度
                CGFloat btnX = (i % kbtnCount) * (btnWidth +10) +10;
                CGFloat btnY = (i / kbtnCount) * 60 + 10;
                CGFloat btnW = btnWidth;
                CGFloat btnH = KJHBtnH;
                btn.frame =  CGRectMake(btnX, btnY, btnW, btnH);
            } else {
                //取出标题
                NSString *title = [titleArr objectAtIndexCheck:i];
                //title的宽度
                CGFloat length = [CJTool sizeWithString:title font:kFontSize16 maxSize:CGSizeMake(KScreenWidth - 20, 30)].width;
                
                btn.frame = CGRectMake(10 + W, H, length +10, KJHBtnH);
                //动态配置
                if(10 + W + length +15 > KScreenWidth - 20){
                    W = 0;//换行时将w置为0
                    H = H + btn.frame.size.height+10;//距离父视图也变化
                    btn.frame = CGRectMake(10+ W, H, length +15,KJHBtnH);//重设button的frame
                }
                W = btn.frame.size.width+ btn.frame.origin.x;
                
                
            }
            
            
            btn.titleLabel.font = [UIFont systemFontOfSize:16];
            [btn setTitle:titleArr[i] forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor whiteColor];
            [btn setTitleColor:KColorHex(0x333333) forState:UIControlStateNormal];
            btn.layer.borderColor = MyRGBColor(229, 229, 229).CGColor;
            btn.layer.cornerRadius = 3;
            btn.layer.borderWidth = 0.5;
            
            [btn jh_clickActionBlock:^(UIButton *button) {
                handler(button);
            }];
            
            [self addSubview:btn];
        }
        
        
    }
    return self;
    
}
/**
 获取视图高度
 
 @param titleArr 数组
 @param isAdaptive 是否动态配置
 @return 高度
 */
+ (CGFloat )heightBtnViewTitleArr:(NSArray *)titleArr isAdaptive:(BOOL )isAdaptive  {
    if (isAdaptive) {
        CGFloat H = 10;
        CGFloat W = 10;
        for (int i = 0; i < titleArr.count; i++) {
            //取出标题
            NSString *title = [titleArr objectAtIndexCheck:i];
            //title的宽度
            CGFloat length = [CJTool sizeWithString:title font:kFontSize16 maxSize:CGSizeMake(KScreenWidth - 20, 30)].width;
            //动态配置
            if(10 + W + length +15 > KScreenWidth - 20){
                W = 10;
                H = H + KJHBtnH +10;//距离父视图也变化
                
            }
            W = length +15 + W +10;
        }
        return KJHBtnH + H;
    } else {
         CGFloat acount =  titleArr.count % KJHBtnAmount == 0 ? (titleArr.count /KJHBtnAmount) : (titleArr.count /KJHBtnAmount + 1);
         CGFloat btnH = KJHBtnH * acount + 20 + (acount - 1)*10;
        return btnH;
    }
    
}

@end
