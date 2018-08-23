//
//  CJBaseTbView.m
//  XJCardPro
//
//  Created by 创建zzh on 2017/4/27.
//  Copyright © 2017年 cjzzh. All rights reserved.
//

#import "CJBaseTbView.h"
#import "CJRefreshHeader.h"
#import "CJRefreshFooter.h"


@implementation CJBaseTbView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        // Remove touch delay (since iOS 8)
        UIView *wrapView = self.subviews.firstObject;
        // UITableViewWrapperView
        if (wrapView && [NSStringFromClass(wrapView.class) hasSuffix:@"WrapperView"]) {
            for (UIGestureRecognizer *gesture in wrapView.gestureRecognizers) {
                // UIScrollViewDelayedTouchesBeganGestureRecognizer
                if ([NSStringFromClass(gesture.class) containsString:@"DelayedTouchesBegan"] ) {
                    gesture.enabled = NO;
                    break;
                }
            }
        }
        [self creatViews];
    }
    return self;
}

#pragma mark -- 创建和赋值
- (void)creatViews {
    _sourceDatas    = [NSMutableArray array];
    self.refreshDataNum = 0;
    self.refreshSection = 0;
    self.delegate   = self;
    self.dataSource = self;
    
    [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"baseTbCell"];
    //初始化morebutton
    
    [self setAnimations];
}

- (void)setAnimations {
    self.pageSize = 10;
    self.pageNumber  = 1;
    _isLastPage = NO;
    
    WS(weakSelf);
    self.mj_header = [CJRefreshHeader headerWithRefreshingBlock:^{
        if (weakSelf.mj_footer.isRefreshing) {
            [weakSelf.mj_footer endRefreshing];
        }
        [weakSelf resetSourceAction];
        if (weakSelf.headRefreshBlock) {
            weakSelf.headRefreshBlock(weakSelf);
        }
    }];
    
    
}
- (void)creatFoot {
    WS(weakSelf);
    self.mj_footer = [CJRefreshFooter footerWithRefreshingBlock:^{
        if (weakSelf.isLastPage) {
            [weakSelf stopRefreshState];
            [weakSelf.mj_footer endRefreshingWithNoMoreData];
            return ;
        }
        if (weakSelf.mj_header.isRefreshing) {
            [weakSelf.mj_header endRefreshing];
        }
        weakSelf.pageNumber = weakSelf.sourceDatas.count/weakSelf.pageSize + 1;
        if (weakSelf.footerRefrehBlock) {
            weakSelf.footerRefrehBlock(weakSelf);
        }
    }];
}
- (void)setNewPageSize:(NSInteger)newPageSize {
    _newPageSize = newPageSize;
    _pageSize = newPageSize;
}

- (void)setSourceDatas:(NSMutableArray *)sourceDatas {
    _sourceDatas = sourceDatas;
}
- (void)setIsLastPage:(BOOL)isLastPage {
    _isLastPage = isLastPage;
    if (_isLastPage) {
        [self.mj_footer endRefreshingWithNoMoreData];
    } else {
        [self.mj_footer resetNoMoreData];
    }
}
#pragma mark － tbDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _sourceDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellId = @"baseTbCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

#pragma mark -- 可调用的逻辑方法
/**
 * 普通刷新
 */
- (void)refreshData {
    
    
    //刷新
    self.refreshDataNum = self.sourceDatas.count;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self reloadData];
    });
    
    //创建尾视图
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.pageNumber == 1 && !self.mj_footer&& !self.isLastPage && self.isProhibitFoot == NO) {
            [self creatFoot];
        }
    });
    //尾页设置
    if (self.sourceDatas.count < self.pageSize*self.pageNumber) {
        self.isLastPage = YES;
    }
    
}

/**
 * 防止翻页闪烁的刷新
 */
- (void)refreshPageData {
    
    self.mj_footer.hidden = NO;
    
    self.refreshDataNum = self.sourceDatas.count;
    
    if (self.refreshDataNum == 0) {
        //第一次刷新
        [self reloadData];
    } else {
        //解决刷新闪烁的问题
        NSMutableArray *indexPaths = [NSMutableArray new];
        for (int i = 0; i<self.sourceDatas.count-self.refreshDataNum; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.refreshDataNum+i inSection:self.refreshSection];
            [indexPaths addObject:indexPath];
        }
        if (indexPaths.count != 0) {
            [self insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
            [self reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
        }
        
    }
    //尾页设置
    if (self.sourceDatas.count < self.pageSize*self.pageNumber) {
        self.isLastPage = YES;
    }
}

//重置参数
- (void)resetSourceAction {
    [self.sourceDatas removeAllObjects];
    self.pageNumber = 1;
    self.isLastPage = NO;
    self.refreshDataNum = 0;
    [self.mj_footer resetNoMoreData];
    self.mj_footer = nil;
}

//停止刷新操作 这里还可以放入 HUD的移除方法
- (void)stopRefreshState {
    
//    kHudDissmiss;
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
    
}

@end
