//
//  CJCountDownButton.h
//  XJCardPro
//
//  Created by 创建zzh on 2017/5/2.
//  Copyright © 2017年 cjzzh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CJCountDownButton;

typedef NSString* (^CountDownChanging)(CJCountDownButton *countDownButton,NSUInteger second);
typedef NSString* (^CountDownFinished)(CJCountDownButton *countDownButton,NSUInteger second);
typedef void (^TouchedCountDownButtonHandler)(CJCountDownButton *countDownButton,NSInteger tag);

@interface CJCountDownButton : UIButton

///倒计时按钮点击回调
- (void)countDownButtonHandler:(TouchedCountDownButtonHandler)touchedCountDownButtonHandler;

//倒计时时间改变回调
- (void)countDownChanging:(CountDownChanging)countDownChanging;

//倒计时结束回调
- (void)countDownFinished:(CountDownFinished)countDownFinished;

///开始倒计时
- (void)startCountDownWithSecond:(NSUInteger)second;

///停止倒计时
- (void)stopCountDown;

@end
