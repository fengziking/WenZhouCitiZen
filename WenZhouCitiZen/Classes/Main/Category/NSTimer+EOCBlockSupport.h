//
//  NSTimer+EOCBlockSupport.h
//  Effective_Objective-C_2.0
//
//  Created by 朱书峰 on 2017/6/6.
//  Copyright © 2017年 朱书峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (EOCBlockSupport)

/**
 NSTimer-用块来打破保留环
 用法：
 __weak typeof(self)weakSelf = self;
 pollTimer = [NSTimer eoc_scheduledTimerWithTimerInterval:2 block:^{
 [weakSelf p_doPoll];
 } repeats:YES];
 @param interval 循环时间
 @param block 每次循环做的操作
 @param repeats 是否重复执行
 @return 返回NSTimer对象
 */
+ (NSTimer *)eoc_scheduledTimerWithTimerInterval:(NSTimeInterval )interval
                                          block:(void(^)())block
                                        repeats:(BOOL)repeats;


@end
