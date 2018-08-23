//
//  CJTabBarView.m
//  WenLingCitizenCard
//
//  Created by 创建zzh on 2017/3/9.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import "CJTabBarView.h"

#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"
@interface CJTabBarView ()

@property (nonatomic, strong)UIButton *selectedBtn;

@end

@implementation CJTabBarView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self creatViews];
    }
    return self;
}

- (void)creatViews {

    NSArray *childItemsArray = @[
                                 @{kTitleKey  : @"首页",
                                   kImgKey    : @"chengshi2",
                                   kSelImgKey : @"chengshi"},
                                 @{
                                     kTitleKey  : @"服务",
                                     kImgKey    : @"wangdian1",
                                     kSelImgKey : @"wangdian"},
                                 @{
                                   kTitleKey  : @"服务网点",
                                   kImgKey    : @"wangdian1",
                                   kSelImgKey : @"wangdian"},
                                 @{
                                   kTitleKey  : @"我的",
                                   kImgKey    : @"wo1",
                                   kSelImgKey : @"wo"},
                                 ];
    
    CGFloat itemW = self.width/childItemsArray.count;

    
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * stop) {

        //创建按钮
        UIButton *tabItem = [UIButton buttonWithType:UIButtonTypeCustom];
        
        tabItem.frame = CGRectMake(idx*itemW, 0, itemW, self.height);
        tabItem.tag = 100+idx;
        //设置图文
        [tabItem setTitle:dict[kTitleKey] forState:UIControlStateNormal];
        [tabItem setTitle:dict[kTitleKey] forState:UIControlStateHighlighted];
        [tabItem setTitle:dict[kTitleKey] forState:UIControlStateSelected];
        
        [tabItem setTitleColor:KColorHex(0x999999) forState:UIControlStateNormal];
        [tabItem setTitleColor:KColorHex(0x999999) forState:UIControlStateHighlighted];
        [tabItem setTitleColor:KColorHex(0x29a1f7) forState:UIControlStateSelected];
        
        [tabItem setImage:[UIImage imageNamed:dict[kImgKey]] forState:UIControlStateNormal];
        [tabItem setImage:[UIImage imageNamed:dict[kImgKey]] forState:UIControlStateHighlighted];
        [tabItem setImage:[UIImage imageNamed:dict[kSelImgKey]] forState:UIControlStateSelected];
        
        //设置图文位置(根据图片大小设置 位置根据UI来制定)
        tabItem.titleLabel.font = kFontSize11;
        tabItem.titleLabel.textAlignment = NSTextAlignmentCenter;
        UIImage *image = [UIImage imageNamed:dict[kImgKey]];
        tabItem.imageRect = CGRectMake((itemW-image.size.width)*0.5, 5, image.size.width, image.size.height);
        tabItem.titleRect = CGRectMake(0, 5+image.size.height, itemW, self.height-5-image.size.height);
        
        [self addSubview:tabItem];
        
        if (idx == 0) {
            tabItem.selected = YES;
            self.selectedBtn = tabItem;
        }
        //添加点击方法
        [tabItem addTarget:self action:@selector(tabBarItemClick:) forControlEvents:UIControlEventTouchUpInside];
    }];
    
}

#pragma mark -- Action
- (void)tabBarItemClick:(UIButton *)tabItem {
    if (self.tabBarDelegate && [self.tabBarDelegate respondsToSelector:@selector(CJTabBarViewClick:didClickTabBarIndex:)]) {
        [self.tabBarDelegate CJTabBarViewClick:self didClickTabBarIndex:tabItem.tag-100];
    }
}

- (void)setSelectIndex:(NSInteger)selectIndex {
    if (_selectIndex == selectIndex) {
        //可作为点击下导航刷新功能，在这个里面发送通知给相应传递 selectIndex
        KNSLog(@"继续点击该下导航");
    }
    
    _selectIndex = selectIndex;
    
    self.selectedBtn.selected = NO;
    
    UIButton *willSelectedButton = [self tabbarItemAtIndex:selectIndex];
    willSelectedButton.selected = YES;
    self.selectedBtn = willSelectedButton;
}

- (UIButton *)tabbarItemAtIndex:(NSInteger)index
{
    return [self viewWithTag:index + 100];
}

@end
