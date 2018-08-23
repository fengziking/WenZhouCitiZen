//
//  CJBaseWKWebViewController.h
//  CitizensTreasure2
//
//  Created by zhusf on 2017/5/12.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import "CJBaseViewController.h"
#import <WebKit/WebKit.h>
//注入JS中的方法
//static NSString *const KJSversion = @"version";//版本号
//static NSString *const KJSjumpApplication = @"jumpApplication";//跳转到应用市场
//static NSString *const KJSjumpCardPackage = @"jumpCardPackage";//跳转到卡包

//**********自定义开关************
static NSString *const KJSCloseJSBack = @"closeJSBack";//关闭JS bsckPage()
static NSString *const KJSopenJSBack = @"openJSBack";//开启JS bsckPage()
static NSString *const KJSCloseJSCache = @"CloseJSCache";//关闭清除缓存
static NSString *const KJSopenJSCache = @"openJSCache";//开启清除缓存

@interface CJBaseWKWebViewController : CJBaseViewController
@property (nonatomic,strong)WKWebView *webView;
@property (nonatomic,strong)UIProgressView *progressView;


@end
