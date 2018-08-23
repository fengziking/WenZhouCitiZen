//
//  CJStatusModel.h
//  WenLingCitizenCard
//
//  Created by 创建zzh on 2017/3/16.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJStatusRecordListModel.h"

static  NSString *const kErrorNet = @"网络连接异常";
#define kErrorStateMsg [[CJStatusModel statusModelWithKeyValues:nil error:error] msg]

/// 加载成功
extern NSInteger  const kFlagSuccess;

/// 加载失败
extern NSInteger  const kFlagFailure;

//网络超时
extern NSInteger  const kFlagNetTimeOutFlag;

//网络异常
extern NSInteger  const kFlagNetDisconnectFlag;

//评论重复
extern NSInteger  const kFlagCommentRepeatFlag;

@interface CJStatusModel : NSObject

#pragma mark -- 后台返回数据
// 状态码，成功或失败
@property (nonatomic, copy, readonly) NSString *result;
// 状态信息，提示语
@property (nonatomic, copy, readonly) NSString *msg;
// 请求的编码
@property (nonatomic, copy, readonly) NSString *reqCode;

#pragma mark -- 开发读取读取数据 kFlagSuccess 为表示成功
//返回是否成功
@property (assign, nonatomic, readonly) NSInteger flag;

//返回数据中的data 均为Model存储
@property (nonatomic, strong) id data;


#pragma mark -- 初始化方法
/**
 *  @brief JSON映射模型,无data（当只要判断result和msg的时候使用）
 *
 *  @param keyValues JSON
 *  @param error     网络请求返回的error，根据此error判断超时或网络异常
 *
 *  @return Status对象
 */

+ (instancetype)statusModelWithKeyValues:(id)keyValues error:(NSError *)error;


/**
 *  @brief JSON映射模型，需要封装成Model，调用本类的data即为传入的model
 *
 *  @param keyValues JSON
 *  @param aclass    传入的model
 *  @param error     网络请求返回的error，根据此error判断超时或网络异常
 *
 *  @return Status对象
 */
+ (instancetype)statusModelWithKeyValues:(id)keyValues class:(Class)aclass error:(NSError *)error;



/**
 *  @brief JSON映射模型,当为列表时使用（data里为字典数组），data层对应CJStatusRecordListModel。
 *
 *  @param keyValues       JSON
 *  @param recordListClass RecordList对应的Model Class
 *  @param error           网络请求返回的error，根据此error判断超时或网络异常
 *
 *  @return Status对象
 */
+ (instancetype)statusModelRecorListWithKeyValues:(id)keyValues recordListClass:(Class)recordListClass error:(NSError *)error;
@end
