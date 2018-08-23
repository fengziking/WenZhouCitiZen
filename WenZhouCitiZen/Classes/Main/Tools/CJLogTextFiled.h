//
//  CJLogTextFiled.h
//  XJCardPro
//
//  Created by 创建zzh on 2017/4/28.
//  Copyright © 2017年 cjzzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJCountDownButton.h"

static CGFloat const kCJTfdHeight = 45.f;

typedef void(^CJTfdBlock)(UITextField *tfd);

typedef NS_ENUM(NSUInteger, kCJLogTfd) {
    kTfdTypeChinese,        //输入中文
    kTfdTypeNumber,         //输入数字
    kTfdTypeABCNumber,      //输入字母加数字
    kTfdCantInput           //禁止输入，出现arrow图片，变成按钮
};

@interface CJLogTextFiled : UIView

- (instancetype)initWithFrame:(CGRect)frame
                    beginEdit:(CJTfdBlock)beginEdit
                   didChanged:(CJTfdBlock)didChanged
                      endEdit:(CJTfdBlock)endEdit
                    toMaxEdit:(CJTfdBlock)toMax;

@property (nonatomic, copy)CJTfdBlock textEndEdit;

@property (nonatomic, copy)CJTfdBlock textBeginEdit;

@property (nonatomic, copy)CJTfdBlock textDidChangedEdit;

@property (nonatomic, copy)CJTfdBlock textToMaxEdit;

//开始倒计时
@property (nonatomic, copy)void(^beginCountDwon)(UIButton *btn);
//结束倒计时
@property (nonatomic, copy)void(^endingCountDown)(UIButton *btn);

/***各属性****/
//输入框
@property (nonatomic, strong)UITextField *tfd;
//默认字体
@property (nonatomic, copy)NSString *placeholder;
//最长输入限制
@property (nonatomic, assign)NSInteger maxLength;
//图片名字
@property (nonatomic, copy)NSString *imgName;
//输入的文字
@property (nonatomic, copy, readonly)NSString *text;
//输入类型
@property (nonatomic, assign)kCJLogTfd type;
//倒计时按钮
@property (nonatomic, strong)CJCountDownButton *countDownBtn;


//当赋值type为kTfdCantInput 之后，如果需要赋值当前控件，在操作完之后调用 该方法
- (void)showTfdText:(NSString *)text;

//添加通知
- (void)addNoti;
//移除通知
- (void)remoeNoti;

//是否需要倒计时按钮   设置倒计时所需要字段 需要实现 beginCountDwon和endingCountDown
- (void)configCountDownNormalTitle:(NSString *)normalTitle
                    changeingTitle:(NSString *)changeTitle
                     finishedTitle:(NSString *)finishTitle
                     countDownTime:(NSUInteger)time;
@end

