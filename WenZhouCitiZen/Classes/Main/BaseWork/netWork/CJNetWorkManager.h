//
//  CJNetWorkManager.h
//  WenLingCitizenCard
//
//  Created by 创建zzh on 2017/3/9.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import "PPNetworkHelper.h"

@interface CJNetWorkManager : PPNetworkHelper


/**
 *  POST请求,无缓存
 *
 *  @param reqCode    请求地址
 *  @param parameters 请求参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用CJCancel方法
 */
+ (__kindof NSURLSessionTask *)CJPOSTCode:(NSString *)reqCode
                               parameters:(NSMutableDictionary *)parameters
                                  success:(HttpRequestSuccess)success
                                  failure:(HttpRequestFailed)failure;

/**
 *  POST请求,自动缓存
 *
 *  @param reqCode       请求地址
 *  @param parameters    请求参数
 *  @param responseCache 缓存数据的回调
 *  @param success       请求成功的回调
 *  @param failure       请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用CJCancel方法
 */
+ (__kindof NSURLSessionTask *)CJPOSTCode:(NSString *)reqCode
                               parameters:(NSMutableDictionary *)parameters
                            responseCache:(HttpRequestCache)cache
                                  success:(HttpRequestSuccess)success
                                  failure:(HttpRequestFailed)failure;

/**
 *  上传图片文件
 *
 *  @param reqCode    请求地址
 *  @param parameters 请求参数
 *  @param images     图片数组
 *  @param name       文件对应服务器上的字段
 *  @param fileName   文件名
 *  @param mimeType   图片文件的类型,例:png、jpeg(默认类型)....
 *  @param progress   上传进度信息
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用CJancel方法
 */
+ (__kindof NSURLSessionTask *)CJUploadWithreqCode:(NSString *)reqCode
                                        parameters:(NSMutableDictionary *)parameters
                                            images:(NSArray<UIImage *> *)images
                                              name:(NSString *)name
                                          fileName:(NSString *)fileName
                                          mimeType:(NSString *)mimeType
                                          progress:(HttpProgress)progress
                                           success:(HttpRequestSuccess)success
                                           failure:(HttpRequestFailed)failure;


/**
 * 取消所有请求
 */
+ (void)CJCancelAllRequestTask;

/**
 * 取消指定reqCode的HTTP请求
 */
+ (void)CJCancelRequestTaskWithReqCode:(NSString *)reqCode;

/**
 * 验证异步是否正在进行某个请求
 */
+ (BOOL)CJCheckRequestTaskWithReqCode:(NSString *)reqCode;
@end
