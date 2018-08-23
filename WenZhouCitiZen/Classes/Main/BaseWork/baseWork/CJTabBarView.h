//
//  CJTabBarView.h
//  WenLingCitizenCard
//
//  Created by 创建zzh on 2017/3/9.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CJTabBarView;

@protocol CJTabBarDelegate <NSObject>

- (void)CJTabBarViewClick:(CJTabBarView *)tabBarView didClickTabBarIndex:(NSInteger)selectIndex;

@end

@interface CJTabBarView : UIView

@property (nonatomic,weak) id<CJTabBarDelegate>tabBarDelegate;

@property (nonatomic,assign)NSInteger selectIndex;

@end
