//
//  CJBaseViewController.h
//  JinHuaCitizen
//
//  Created by 朱书峰 on 2017/8/28.
//  Copyright © 2017年 Frank-Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJBaseViewController : UIViewController
//收起键盘
- (void)resignCurrentFirstResponder;

//返回事件
- (void)backToSuperView;

/**
 *  作用：判断登录
 *  适用于控制器部分操作需要用户登录条件 调用该 方法
 */
- (void)loginVerifySuccess:(dispatch_block_t)success;

/**
 * 作用：检查网络是否链接(适用于无缓存数据页面请求方法之前的判断)
 * 示例：
 *     if ([self checkNetBeforeDataError]) {
 return;
 }
 */
- (BOOL)checkNetBeforeDataError;

//状态栏颜色 （传入YES 为白色）
- (void)setStatusBarStyleLight:(BOOL)light;

/**
 * 如果控制器中需要在返回页面的时候取消某个请求，请设置该 属性(请求的reqCode)
 */
@property(nonatomic,copy)NSString *mainReqCode;

@end
