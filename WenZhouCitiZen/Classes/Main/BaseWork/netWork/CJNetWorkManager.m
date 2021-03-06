//
//  CJNetWorkManager.m
//  WenLingCitizenCard
//
//  Created by 创建zzh on 2017/3/9.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import "CJNetWorkManager.h"
#import "LoginController.h"
#import "CJNavigationViewController.h"
#import "CJRootViewController.h"
@implementation CJNetWorkManager

/**
 取消指定reqCode的HTTP请求
 */
+ (void)CJCancelRequestTaskWithReqCode:(NSString *)reqCode {
    
    if (!reqCode) { return; }
    @synchronized (self)
    {
        [[self allTaskDicArr] enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([dic[@"reqCode"] isEqualToString:reqCode]) {
                NSURLSessionTask *task = dic[@"task"];
                KNSLog(@"取消了异步请求任务%@",dic[@"reqCode"]);
                [task cancel];
                [[self allTaskDicArr] removeObject:dic];
                *stop = YES;
            }
        }];
    }
}
/**
 取消所有请求
 */
+ (void)CJCancelAllRequestTask {
    // 锁操作
    @synchronized(self)
    {
        
        [[PPNetworkHelper allTaskDicArr] enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
            NSURLSessionTask *task = dic[@"task"];
            [task cancel];
        }];
        [[PPNetworkHelper allTaskDicArr] removeAllObjects];
    }
}

/**
 * 验证异步是否正在进行某个请求
 */
+ (BOOL)CJCheckRequestTaskWithReqCode:(NSString *)reqCode {
    if (!reqCode) return NO;
    
    @synchronized (self) {
        __block BOOL ifHave;
        [[self allTaskDicArr] enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([dic[kReqCode] isEqualToString:reqCode]) {
                KNSLog(@"异步正在请求该%@链接",reqCode);
                ifHave = YES;
                *stop = YES;
            }
        }];
        return ifHave;
    }
    
    return NO;
}

+ (__kindof NSURLSessionTask *)CJPOSTCode:(NSString *)reqCode
                               parameters:(NSMutableDictionary *)parameters
                                  success:(HttpRequestSuccess)success
                                  failure:(HttpRequestFailed)failure {
  //  parameters[@"reqCode"] = reqCode;
    NSString *urlStr  = [NSString stringWithFormat:@"%@%@",KBaseUrl,reqCode];
    //调用父类
   return  [super POST:urlStr parameters:[self assembleNetBodys:parameters] success:^(id responseObject) {       
       dispatch_async(dispatch_get_main_queue(), ^{
           success(responseObject);
           
           dispatch_async(dispatch_get_main_queue(), ^{
               // 当前顶层窗口
               UIViewController *viewC = [[[UIApplication sharedApplication] keyWindow] rootViewController];
               KNSLog(@"viewC====%@",viewC);
               NSString *message = [NSString stringWithFormat:@"%@",responseObject[@"result"]];
               KNSLog(@"rsult----%@",message);
               if ([message isEqualToString:@"999996"]) {
             
                   UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您的账号在另一台设备登录，如果不是您本人操作，请及时修改密码" preferredStyle:UIAlertControllerStyleAlert];
                   [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                       
                       [kCJBasicDataManager logOutSuccessBlock:^{
                           
                           [[UIApplication sharedApplication].delegate window].rootViewController = [[CJRootViewController alloc] init];
                           
                       } fail:^{
                           
                       }];
                       
                   }]];
                   [[CJTool getCurrentVC]  presentViewController:alert animated:YES completion:^{

                   }];
               }
               
           });
  
       });
    } failure:^(NSError *error) {

        dispatch_async(dispatch_get_main_queue(), ^{
            failure(error);
        });
    }];
    
}

/**
 *  POST请求,自动缓存
 *
 *  @param URL           请求地址
 *  @param parameters    请求参数
 *  @param responseCache 缓存数据的回调
 *  @param success       请求成功的回调
 *  @param failure       请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用CJancel方法
 */
+ (__kindof NSURLSessionTask *)CJPOSTCode:(NSString *)reqCode
                               parameters:(NSMutableDictionary *)parameters
                            responseCache:(HttpRequestCache)cache
                                  success:(HttpRequestSuccess)success
                                  failure:(HttpRequestFailed)failure {
    //调用父类
    ///parameters[@"reqCode"] = reqCode;
    
    return [super POST:KBaseUrl parameters:[self assembleNetBodys:parameters] responseCache:^(id responseCache) {
        dispatch_async(dispatch_get_main_queue(), ^{
            cache(responseCache);
        });
        
    } success:^(id responseObject) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            success(responseObject);
        });
        
    } failure:^(NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            failure(error);
        });

    }];
    
    
}

+ (__kindof NSURLSessionTask *)CJUploadWithreqCode:(NSString *)reqCode
                                        parameters:(NSMutableDictionary *)parameters
                                            images:(NSArray<UIImage *> *)images
                                              name:(NSString *)name
                                          fileName:(NSString *)fileName
                                          mimeType:(NSString *)mimeType
                                          progress:(HttpProgress)progress
                                           success:(HttpRequestSuccess)success
                                           failure:(HttpRequestFailed)failure {
    //调用父类
   // parameters[@"reqCode"] = reqCode;
    return [super uploadWithURL:KBaseUrl parameters:[self assembleNetBodys:parameters] images:images name:name fileName:fileName mimeType:mimeType progress:^(NSProgress *progress) {
        KNSLog(@"当前大小:%lld",progress.completedUnitCount);
    } success:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark -- 重组参数 后台硬需求
+ (NSDictionary *)assembleNetBodys:(NSMutableDictionary *)bodys {
    
    bodys[@"key1"] = K3DES;
    bodys[@"channel"] = @"03";
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:bodys];
    //签名认证封装
    //1,取出key并拼接 取出value并 拼接
    NSString *keyStr = nil;
    NSString *valueStr = nil ;
    for (NSString *key in [bodys allKeys]) {
        
        if ([[bodys objectForKey:key] isKindOfClass:[NSMutableArray class]]) {//当value时数组的时候，拼接后替换掉当前的数组
            NSArray *arr = [bodys objectForKey:key];
            NSMutableDictionary *listDic = [NSMutableDictionary dictionary];
            NSMutableArray *listArr = [NSMutableArray array];
            for (NSDictionary *tempDic in arr) {
                NSString *listKey;
                NSString *listValue;
                for (NSString *tempKey in [tempDic allKeys]) {
                    listKey = [NSString stringWithFormat:@"%@,%@",listKey,tempKey];
                    NSString *tempValue = [tempDic objectForKey:tempKey];
                    listValue = [NSString stringWithFormat:@"%@%@",listValue,tempValue];
                    listDic[tempKey] = tempValue;
                    listDic[@"key"] = [listKey substringFromIndex:7];
                    NSString *listValueStr = [NSString stringWithFormat:@"%@qhkiG9w0",listValue];
                    listDic[@"sign"] = [[[[listValueStr md5] uppercaseString] sha1] uppercaseString];
                }
                [listArr addObject:listDic];
            }
            bodys[key] = listArr;
            
        } else {
            if (keyStr==nil||valueStr==nil) {
                keyStr = key;
                NSString *value1 = [bodys objectForKey:key];
                valueStr = value1;
            }else{
                keyStr = [NSString stringWithFormat:@"%@,%@",keyStr,key];
                NSString *value = [bodys objectForKey:key];
                valueStr = [NSString stringWithFormat:@"%@%@",valueStr,value];
            }
          
        }
    }
   // NSLog(@"valueStr===%@",valueStr);

    NSString *valueStr2 = [NSString stringWithFormat:@"%@qhkiG9w0",valueStr];

    NSString *md5 = [[valueStr2 md5] uppercaseString];
    NSString *sh1 = [[md5 sha1] uppercaseString];

    mDic[@"key"] = keyStr;
    mDic[@"sign"] = sh1;
    
    //将传入的参数转换成json字符串格式
    NSData *dataParams = [NSJSONSerialization dataWithJSONObject:mDic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:dataParams encoding:NSUTF8StringEncoding];
   // [DES3 encryptUseDES:jsonString key:key];
    
    return [NSDictionary dictionaryWithJsonString:jsonString];
}
@end



