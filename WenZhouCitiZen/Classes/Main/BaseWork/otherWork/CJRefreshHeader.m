//
//  CJRefreshHeader.m
//  XJCardPro
//
//  Created by 创建zzh on 2017/4/27.
//  Copyright © 2017年 cjzzh. All rights reserved.
//

#import "CJRefreshHeader.h"

@interface CJRefreshHeader ()

@property (nonatomic, strong)NSArray *refreshImgs;

@property (nonatomic, strong)NSArray *normalImgs;

@end

@implementation CJRefreshHeader

#pragma mark -- 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    // 设置字体
    
    self.stateLabel.font = kFontSize14;
    self.lastUpdatedTimeLabel.font = kFontSize14;
    [self setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [self setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [self setTitle:@"正在为你刷新" forState:MJRefreshStateRefreshing];
    
//    self.lastUpdatedTimeLabel.hidden = YES;
//    self.stateLabel.hidden = YES;
    

//    [self setImages:self.normalImgs forState:MJRefreshStateIdle];
//    [self setImages:self.refreshImgs duration:self.refreshImgs.count*0.14 forState:MJRefreshStateRefreshing];
//    [self setImages:self.normalImgs forState:MJRefreshStatePulling];
    
    
}
#pragma mark -- 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            
            break;
        case MJRefreshStateRefreshing:
            
            break;
        case MJRefreshStateNoMoreData:
            
            break;
        case MJRefreshStatePulling:
            
            break;
        case MJRefreshStateWillRefresh:
            
            break;
        default:
            
            break;
    }
}

- (NSArray *)refreshImgs {
    if (!_refreshImgs) {
        NSMutableArray *imgs1 = @[].mutableCopy;
        for (int i = 0; i<7; i++) {
            NSString *imgName = [NSString stringWithFormat:@"refresh_head_icon%@",@(i)];
            [imgs1 addObject:[UIImage imageNamed:imgName]];
        }
        _refreshImgs = [NSArray arrayWithArray:imgs1];
    }
    return _refreshImgs;
}
- (NSArray *)normalImgs {
    if (!_normalImgs) {
        _normalImgs = @[[UIImage imageNamed:@"refresh_head_icon0"]];
    }
    return _normalImgs;
}
@end
