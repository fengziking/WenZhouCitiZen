//
//  WebsController.m
//  WenZhouCitiZen
//
//  Created by 刘建明 on 2018/3/15.
//  Copyright © 2018年 刘建明. All rights reserved.
//

#import "WebsController.h"

@interface WebsController ()

@end

@implementation WebsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"服务";
    self.webView.frame = CGRectMake(0, CJ_StatusBarAndNavigationBarHeight, KScreenWidth, KScreenHeight-CJ_StatusBarAndNavigationBarHeight-CJ_TabbarSafeBottomMargin);
    self.progressView.frame = CGRectMake(0, CJ_StatusBarAndNavigationBarHeight, KScreenHeight, 2);
    self.webView.allowsBackForwardNavigationGestures = NO;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.urlStr]]]];
    //   避免WebView最下方出现黑线
    self.webView.opaque = NO;
    // 去掉webView的滚动条
    for (UIView *subView in [self.webView subviews])
    {
        if ([subView isKindOfClass:[UIScrollView class]])
        {
            // 不显示竖直的滚动条
            [(UIScrollView *)subView setShowsVerticalScrollIndicator:NO];
        }
    }
    
   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
