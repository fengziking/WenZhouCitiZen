//
//  CJChooseRootVCTool.m
//  WenLingCitizenCard
//
//  Created by 创建zzh on 2017/3/8.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import "CJChooseRootVCTool.h"
#import "CJRootViewController.h"
#import "IntroViewController.h"

@implementation CJChooseRootVCTool

// 加载哪个控制器
+ (UIViewController *)chooseRootViewController
{
    UIViewController *rootVc = nil;
    
    NSDictionary *dict =  [NSBundle mainBundle].infoDictionary;
    
    // 获取最新的版本号
    NSString *curVersion = dict[@"CFBundleShortVersionString"];
    NSString *lastVersion = CJUserDefaultsGetObj(kCJVersionKey);
    
    if ([curVersion isEqualToString:lastVersion]) {
        // 版本号相等 设置标签控制器
        rootVc = [[CJRootViewController alloc] init];
    } else {
        // 判断为首次安装或者更新（可做请求判断是否需要展示引导功能）
        // 有最新的版本号 保存到偏好设置
        CJUserDefaultsSetObj(curVersion, kCJVersionKey);
        CJUserDefaultsSynchronize;
        rootVc = [[IntroViewController alloc] init];
    }
    return rootVc;
}

@end
