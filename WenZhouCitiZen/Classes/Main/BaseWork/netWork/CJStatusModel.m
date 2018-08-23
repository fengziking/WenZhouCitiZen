//
//  CJStatusModel.m
//  WenLingCitizenCard
//
//  Created by 创建zzh on 2017/3/16.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import "CJStatusModel.h"
#import "CJStatusRecordListModel.h"
/// 加载成功
NSInteger const kFlagSuccess = 0;

/// 加载失败
NSInteger const kFlagFailure = 9999;
//网络超时
NSInteger const kFlagNetTimeOutFlag = -1001;

//网络异常
NSInteger const kFlagNetDisconnectFlag = -404;


@implementation CJStatusModel

#pragma mark -- 开发 读取
- (NSInteger)flag {
    NSInteger flag = kFlagFailure;
    if ([self.result isEqualToString:@"990000"]) {
        flag = kFlagSuccess;
    } else {
        flag = [self.result integerValue];
    }
    return flag;
}

#pragma mark -- 类方法返回
//没有写model,想要读取status.result msg 而已（不如直接在返回block里解析json来得快）
+ (instancetype)statusModelWithKeyValues:(id)keyValues error:(NSError *)error
{
    return [CJStatusModel statusModelWithResponseJson:keyValues error:error];
}


//返回内容data里面是列表数组 传入后台返回的json 和 列表数据的模型
+ (instancetype)statusModelRecorListWithKeyValues:(id)keyValues recordListClass:(Class)recordListClass error:(NSError *)error
{
    
    //设置 CJStatusRecordListModel 里的 recordList 存储为传入的模型
//    [[CJStatusRecordListModel class] mj_setupObjectClassInArray:^NSDictionary *{
//        return @{@"recordList":recordListClass};
//    }];
    //设置CJStatusModel 里的 data 为 StatusRecordListModel
    [CJStatusModel mj_setupNewValueFromOldValue:^id(id object, id oldValue, MJProperty *property) {
        if ([property.name isEqualToString:@"data"]) {
            if ([oldValue isKindOfClass:[NSArray class]]) {
                NSDictionary *dataJson = (NSDictionary *)keyValues;
                CJStatusRecordListModel *listModel = [[CJStatusRecordListModel alloc] init];
                if ([[dataJson allKeys] containsObject:@"currPage"]) {
                    listModel.currPage = [dataJson[@"currPage"] integerValue];
                }
                if ([[dataJson allKeys] containsObject:@"totalPage"]) {
                    listModel.totalPage = [dataJson[@"totalPage"] integerValue];
                }
                if ([[dataJson allKeys] containsObject:@"totalCount"]) {
                    listModel.totalCount = [dataJson[@"totalCount"] integerValue];
                }
                listModel.recordList = [recordListClass mj_objectArrayWithKeyValuesArray:(NSArray *)oldValue];

                return listModel;
            }
        }
        return oldValue;
    }];
    
    return [self statusModelWithResponseJson:keyValues error:error];
}

//传入后台返回的json 返回内容又组装成了model，则传入 json和model class即可，
//读取方式为status.data 
+ (instancetype)statusModelWithKeyValues:(id)keyValues class:(Class)aclass error:(NSError *)error {
    
    if (error) {
        return [self statusModelWithResponseJson:keyValues error:error];
    } else {
        
        NSDictionary *dics = (NSDictionary *)keyValues;
        //调取statusModel.data 便是传入的aclass
        if ([dics.allKeys containsObject:@"data"]) {
            
            [CJStatusModel mj_setupNewValueFromOldValue:^id(id object, id oldValue, MJProperty *property) {
                if ([property.name isEqualToString:@"data"]) {
                    if ([oldValue isKindOfClass:[NSDictionary class]]) {
                        return [aclass mj_objectWithKeyValues:oldValue];
                    } else if ([oldValue isKindOfClass:[NSArray class]]){
                        return [aclass mj_objectArrayWithKeyValuesArray:oldValue];
                    } else if ([oldValue isKindOfClass:[NSString class]]) {
                        return oldValue;
                    }
                }
                return oldValue;
            }];
            
        } else {
            
            CJStatusModel *statusModel = [CJStatusModel mj_objectWithKeyValues:keyValues];
            statusModel.data = [aclass mj_objectWithKeyValues:keyValues];
            return statusModel;
        }
        
    }
    
    return [self statusModelWithResponseJson:keyValues error:error];
}



+ (instancetype)statusModelWithResponseJson:(id)Json error:(NSError *)error
{
    if (error.code == NSURLErrorCancelled) {//请求被取消
        return nil;
    }
    
    if (error) {
        return [CJStatusModel mj_objectWithKeyValues:[self getErrorDictionary:error json:Json] ];
    } else {
        return [CJStatusModel mj_objectWithKeyValues:Json];
    }
}

#pragma mark -- 请求出错，重组字典
+ (NSDictionary *)getErrorDictionary:(NSError *)error json:(id)json
{
    //判断超时的情况
    BOOL isTimeout = [[error.userInfo objectForKey:@"NSLocalizedDescription"] rangeOfString:@"超时"].location != NSNotFound;
    if (isTimeout) {
        NSDictionary *dic = @{
                              @"result":[NSString stringWithFormat:@"%@",@(kFlagNetTimeOutFlag)],
                              @"msg":@"请求超时，请检查网络"
//                              @"reqCode":json[@"reqCode"]
                              };
        return dic;
    } else {
        NSDictionary *dic = @{
                              @"result":[NSString stringWithFormat:@"%@",@(kFlagNetDisconnectFlag)],
                              @"msg":@"网络异常，请检查网络"
//                              @"reqCode":json[@"reqCode"]
                              };
        return dic;
    }
}
@end
