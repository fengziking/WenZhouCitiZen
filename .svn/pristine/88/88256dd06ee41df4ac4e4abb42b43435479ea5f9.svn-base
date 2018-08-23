//
//  CJBaseViewController.m
//  JinHuaCitizen
//
//  Created by 朱书峰 on 2017/8/28.
//  Copyright © 2017年 Frank-Lee. All rights reserved.
//

#import "CJBaseViewController.h"
#import "CJNavigationViewController.h"
#import "CJRootViewController.h"
#import "LoginController.h"
@interface CJBaseViewController ()

/**电池条颜色*/
@property (nonatomic, assign)BOOL isLight;
@end

@implementation CJBaseViewController
- (void)dealloc {
    if (self.mainReqCode) {
     //  [CJNetWorkManager CJCancelRequestTaskWithReqCode:self.mainReqCode];
    }
}
#pragma mark -- 生命周期
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self resignCurrentFirstResponder];
    if ([self isNavRoot])
    {
        self.hidesBottomBarWhenPushed = NO;
    }
    else
    {
        self.hidesBottomBarWhenPushed = YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  = KColorWhite;
    //    [self hiddenNavBlackLine];
}
#pragma mark -- 内部方法
//隐藏navigationBar底部黑线
- (void)hiddenNavBlackLine{
    
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]){
        NSArray *list=self.navigationController.navigationBar.subviews;
        for (id obj in list) {
            if (kSystermVersion >= 10.0){
                //10.0的系统字段不一样
                UIView *view =   (UIView*)obj;
                for (id obj2 in view.subviews) {
                    if ([obj2 isKindOfClass:[UIImageView class]]){
                        UIImageView *image =  (UIImageView*)obj2;
                        image.hidden = YES;
                    }
                }
            }else{
                //NavigationBar底部的黑线是一个UIImageView上的UIImageView。
                if ([obj isKindOfClass:[UIImageView class]]) {
                    UIImageView *imageView=(UIImageView *)obj;
                    NSArray *list2=imageView.subviews;
                    for (id obj2 in list2) {
                        if ([obj2 isKindOfClass:[UIImageView class]]) {
                            UIImageView *imageView2=(UIImageView *)obj2;
                            imageView2.hidden=YES;
                        }
                    }
                }
            }
        }
    }
    [self.navigationController.navigationBar setBarTintColor:KColorWhite];
}
// 当前视图是否是根视图
- (BOOL)isNavRoot
{
    return self.navigationController.viewControllers.firstObject == self;
}

#pragma mark - Action
//收起键盘
- (void)resignCurrentFirstResponder
{
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow endEditing:YES];
    
}
//判断是否有网络
- (BOOL)checkNetBeforeDataError {
    //有网
  //  if (kIsNetwork) return NO;
    //没有网络
  //  kMBShowInVC(@"请检查网络设置", 1);
    return YES;
    
}
// 判断登录
- (void)loginVerifySuccess:(dispatch_block_t)success
{
    
    if (WZ_IsLoinState)
    {
        if (success)
        {
            success();
        }
    }
    else
    {
        LoginController *login = [[LoginController alloc] init];
        //登陆成功之后回调执行操作
        login.completionBack = ^(){
            //            if (success) {
            //                success();
            //            }
        };
        CJNavigationViewController *loginNav = [[CJNavigationViewController alloc] initWithRootViewController:login];
        [self presentViewController:loginNav animated:YES completion:nil];
    }
}

//设置状态栏
- (void)setStatusBarStyleLight:(BOOL)light {
    
    if (light) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    } else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
    }
}

//控制器自定义返回按钮，调用返回 可 直接调用该方法
- (void)backToSuperView
{
    
    if (self.mainReqCode) {
        //取消正在执行的请求
       // [CJNetWorkManager CJCancelRequestTaskWithReqCode:self.mainReqCode];
    }
    
    
    if (self.navigationController.viewControllers.firstObject == self)
    {
        //针对自持有导航控制器所弹出的模态页面
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        if (self.presentedViewController)
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
