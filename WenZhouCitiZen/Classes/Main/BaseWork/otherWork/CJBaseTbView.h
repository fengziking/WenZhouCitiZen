//
//  CJBaseTbView.h
//  XJCardPro
//
//  Created by 创建zzh on 2017/4/27.
//  Copyright © 2017年 cjzzh. All rights reserved.
//

#import <UIKit/UIKit.h>


@class CJBaseTbView;

typedef void(^CJRefreshFooterBlock)(CJBaseTbView *tableView);

typedef void(^CJRefreshHeaderBlcok)(CJBaseTbView *tableView);


@interface CJBaseTbView : UITableView<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, copy)CJRefreshHeaderBlcok headRefreshBlock;
@property (nonatomic, copy)CJRefreshFooterBlock footerRefrehBlock;

#pragma mark -- 默认参数
/**
 *  请求页码 做参数
 */
@property (nonatomic, assign)NSInteger pageNumber;

/**
 *  页面数据容量 做参数
 */
@property (nonatomic, assign)NSInteger pageSize;

/**
 * 请求时间，首次刷新时候需要赋值
 */
@property (nonatomic, copy)NSString *pubDate;
/**
 * 接口返回总数据
 */
@property (assign, nonatomic) NSInteger totalCount;

//是否禁止尾视图
@property (nonatomic, assign)BOOL isProhibitFoot;

#pragma mark -- 可修改参数
/**
 *  页面数据容量 做参数 子类更改 部分页面根据需求重置页面容量
 */
@property (nonatomic, assign)NSInteger newPageSize;

/****************子类赋值*******************/
#pragma mark -- 子类赋值
/**
 *  必须赋值
 *  存储modl的arr
 */

@property (nonatomic, strong)NSMutableArray *sourceDatas;    //数据源

/**
 *  可选赋值 (在调用refreshData 或 refreshPageData 之后会判断赋值)
 *  控制器做数据源数量判断 如果没有增加了 则表示已经到达最后一页 去掉上拉刷新
 *  子类可读取用于业务需求
 */
@property (nonatomic, assign)BOOL isLastPage;





/****************子类读取*******************/
#pragma mark -- 子类读取
/**
 * 刷新之后的数据容量
 */
@property (nonatomic, assign)NSInteger refreshDataNum;


/********************可供子类调用的方法**********************/
#pragma mark -- 可供子类调用的方法
/**
 * 刷新数据
 */
- (void)refreshData;

/**
 * 防止翻页闪烁的刷新
 */
- (void)refreshPageData;

/**
 *  重置参数
 */
- (void)resetSourceAction;

/**
 *  停止加载
 */
- (void)stopRefreshState;

/**
 * 创建上拉加载
 */
- (void)creatFoot;

/***********************用处比较少****************************/
#pragma mark -- 慎用
/**
 * 是否之前请求数据成功过 如果成功过 再次刷新的时候数据请求失败 提示失败 不用出线加载失败的动画
 * （项目如果没有页面加载失败的预览图 则无需操作这个参数）
 */
@property (nonatomic,assign)BOOL ifBeforeDataSucceed;

/**
 * 需要刷新的section 默认是零 因为该父类默认是不分组的tbView,如果子类是分组的
 * 可以指定刷新tableView的某个小组 需要配合 调用刷新方法 refreshPageData
 */
@property (nonatomic, assign)NSInteger refreshSection;



@end
