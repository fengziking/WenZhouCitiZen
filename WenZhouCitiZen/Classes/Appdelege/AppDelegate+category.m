//
//  AppDelegate+category.m
//  WenZhouCitiZen
//
//  Created by 刘建明 on 2018/3/1.
//  Copyright © 2018年 刘建明. All rights reserved.
//

#import "AppDelegate+category.h"

@implementation AppDelegate (category)

- (void)setupLibConfigWithOptions:(NSDictionary *)launchOptions {
    
    //设置键盘遮挡三方
    [self configIQKeyboardManager];
    //检查网络
    [self configCheckNet];
    
    //[self setNavigationBarStyle];

    
}
//统一设置导航栏
- (void)setNavigationBarStyle {
    //获取导航栏的代理对象
    UINavigationBar *bar = [UINavigationBar appearance];
    //    //背景图片
    [bar setBackgroundImage:[UIImage imageNamed:@"DH_750"] forBarMetrics:UIBarMetricsDefault];
    //    bar.barTintColor = [UIColor whiteColor];
    //设置字体颜色
    NSDictionary * dict = @{NSForegroundColorAttributeName:MyRGBColor(51, 51, 51),NSFontAttributeName:[UIFont systemFontOfSize:18]};
    [bar setTitleTextAttributes:dict];
    //统一设置返回按钮的文字颜色,修改barButtonItem的渲染颜色
    //    [bar setTintColor:[UIColor whiteColor]];
    
}
//设置键盘遮挡三方
- (void)configIQKeyboardManager {
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = YES;
    
}
  //检查网络
- (void)configCheckNet {
    [PPNetworkHelper networkStatusWithBlock:^(PPNetworkStatus status) {
        switch (status) {
            case PPNetworkStatusUnknown:
            case PPNetworkStatusNotReachable:
                [MBProgressHUD bwm_showTitle:@"请检查网络设置" toView:[UIApplication sharedApplication].keyWindow hideAfter:1];
                KNSLog(@"是否有网:%@",@(kIsWiFiNetwork));
                break;
            default:
                break;
        }
    }];
}
@end
