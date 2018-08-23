//
//  CJChooseRootVCTool.h
//  WenLingCitizenCard
//
//  Created by 创建zzh on 2017/3/8.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJChooseRootVCTool : NSObject

/****
 *  作用: 返回根控制器,分为 首次安装或者更新操作 展示新功能 引导页面 和 主页面
 *  在appDelegate里使用
 **/
+ (UIViewController *)chooseRootViewController;

@end
