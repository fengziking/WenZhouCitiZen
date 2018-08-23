//
//  CJRefreshFooter.m
//  XJCardPro
//
//  Created by 创建zzh on 2017/4/27.
//  Copyright © 2017年 cjzzh. All rights reserved.
//

#import "CJRefreshFooter.h"

@interface CJRefreshFooter ()

@property (nonatomic, strong)NSArray *refreshImgs;

@property (nonatomic, strong)NSArray *normalImgs;

@property (nonatomic, strong)UIImageView *loadIngImg;

@end

@implementation CJRefreshFooter


#pragma mark -- 在这里做一些初始化配置（比如添加子控件）
- (void)prepare {
    [super prepare];
    
    self.stateLabel.font = kFontSize14;
    self.stateLabel.hidden = YES;
    self.gifView.hidden = YES;
    //加载中图片
    /*
    [self setImages:self.normalImgs forState:MJRefreshStateIdle];
    [self setImages:self.refreshImgs duration:self.refreshImgs.count*0.14 forState:MJRefreshStateRefreshing];
    [self setImages:self.normalImgs forState:MJRefreshStatePulling];
    */
}

#pragma mark -- 在这里设置子控件的位置和尺寸
- (void)placeSubviews  {
    [super placeSubviews];
    
    [self addSubview:self.loadIngImg];

}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            self.stateLabel.text = @"上拉加载更多";
            if (_loadIngImg) {
                [self.loadIngImg stopAnimating];
                self.loadIngImg.hidden = NO;
            }
            break;
        case MJRefreshStateRefreshing:
            self.stateLabel.text = @"正在努力加载...";
            
            self.loadIngImg.animationImages = self.refreshImgs;
            self.loadIngImg.animationDuration = self.refreshImgs.count*0.14;
            [self.loadIngImg startAnimating];
            self.loadIngImg.hidden = NO;
            break;
        case MJRefreshStateNoMoreData:
            self.stateLabel.text = @"没有数据了呀";
            
            [self.loadIngImg stopAnimating];
            self.loadIngImg.hidden = YES;
            break;
        default:
            break;
    }
}


- (void)endRefreshingWithNoMoreData {
    [super endRefreshingWithNoMoreData];
    
    self.hidden = YES;
}

//下拉恢复 尾部加载
- (void)resetNoMoreData {
    [super resetNoMoreData];
    
    self.hidden = NO;
}
- (NSArray *)refreshImgs {
    if (!_refreshImgs) {
        NSMutableArray *imgs1 = @[].mutableCopy;
        for (int i = 0; i<4; i++) {
            NSString *imgName = [NSString stringWithFormat:@"refresh_foot_icon%@",@(i)];
            [imgs1 addObject:[UIImage imageNamed:imgName]];
        }
        _refreshImgs = [NSArray arrayWithArray:imgs1];
    }
    return _refreshImgs;
}
- (NSArray *)normalImgs {
    if (!_normalImgs) {
        _normalImgs = @[[UIImage imageNamed:@"refresh_foot_icon0"]];
    }
    return _normalImgs;
}
- (UIImageView *)loadIngImg {
    if (!_loadIngImg) {
        _loadIngImg = [[UIImageView alloc] initWithFrame:self.bounds];
        _loadIngImg.contentMode = UIViewContentModeCenter;
    }
    return _loadIngImg;
}
@end
