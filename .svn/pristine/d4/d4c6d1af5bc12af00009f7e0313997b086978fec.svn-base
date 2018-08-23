//
//  IntroViewController.m
//  WenLingCitizenCard
//
//  Created by 刘建明 on 17/3/30.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import "IntroViewController.h"
#import "CJRootViewController.h"

#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define UIColorFromRGB(rgbValue) ([UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0])
@interface IntroViewController ()

/** 引导页内容 */
@property (strong, nonatomic) NSMutableArray *introImageArray;

@property (strong, nonatomic) UIScrollView *pageScrollView;

- (void)initControls;

- (void)btnPressEnterAction:(id)sender;

@end

@implementation IntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initControls];
}
#pragma mark - Private Method

- (void)initControls {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.introImageArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 3; i++) {
        [self.introImageArray addObject:[NSString stringWithFormat:@"%i%iyindao_%d.png", (int)[UIScreen mainScreen].currentMode.size.width, (int)[UIScreen mainScreen].currentMode.size.height, i]];
    }
    
    _pageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    _pageScrollView.pagingEnabled = YES;
    [_pageScrollView setShowsHorizontalScrollIndicator:NO];
    _pageScrollView.contentSize = CGSizeMake(KScreenWidth * _introImageArray.count, KScreenHeight);
    [self.view addSubview:_pageScrollView];
    
    NSString *imgName = nil;
    for (int i = 0; i < _introImageArray.count; i++) {
        imgName = [_introImageArray objectAtIndex:i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"yindao_%d",i]]];
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.frame = CGRectMake((KScreenWidth * i), 0.f, KScreenWidth, KScreenHeight);
        imageView.contentMode = UIViewContentModeScaleToFill;
        [_pageScrollView addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        if (i == _introImageArray.count - 1) {
            UIButton *enterButton = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth/2-150/2*H_Bili, KScreenHeight-150*H_Bili, 150*H_Bili, 80*H_Bili)];
            [enterButton addTarget:self action:@selector(btnPressEnterAction:) forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:enterButton];
     
        }
    }
}
- (void)btnPressEnterAction:(id)sender {
    
    
    [UIApplication sharedApplication].keyWindow.rootViewController = [[CJRootViewController alloc] init];
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
