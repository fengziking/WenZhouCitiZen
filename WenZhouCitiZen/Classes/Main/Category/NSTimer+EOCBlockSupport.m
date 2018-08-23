//
//  NSTimer+EOCBlockSupport.m
//  Effective_Objective-C_2.0
//
//  Created by 朱书峰 on 2017/6/6.
//  Copyright © 2017年 朱书峰. All rights reserved.
//

#import "NSTimer+EOCBlockSupport.h"

@implementation NSTimer (EOCBlockSupport)
+ (NSTimer *)eoc_scheduledTimerWithTimerInterval:(NSTimeInterval )interval
                                           block:(void(^)())block
                                         repeats:(BOOL)repeats{
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(eoc_blockInvoke:) userInfo:[block copy] repeats:repeats];
    
}
+ (void)eoc_blockInvoke:(NSTimer *)timer {
    void (^block)() = timer.userInfo;
    if (block) {
        block();
    }
    
}
@end
