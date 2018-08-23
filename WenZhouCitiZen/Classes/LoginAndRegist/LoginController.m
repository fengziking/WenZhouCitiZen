//
//  LoginController.m
//  WenZhouCitiZen
//
//  Created by 刘建明 on 2018/3/1.
//  Copyright © 2018年 刘建明. All rights reserved.
//

#import "LoginController.h"
#import "LoginScrollView.h"

@interface LoginController ()

@property (nonatomic,strong)LoginScrollView *scrollView ;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KColorWhite ;
    self.navigationItem.title = @"登录";
    [self.view addSubview:self.scrollView];
    self.automaticallyAdjustsScrollViewInsets = NO;

}
-(LoginScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[LoginScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    }
    return _scrollView ;
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