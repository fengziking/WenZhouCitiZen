//
//  HttpTool.h
//  WXWorkPlatform
//
//  Created by zhusf on 16/5/3.
//  Copyright © 2016年 zhusf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTool : NSObject

/**
 *字典3des加密
 */
+ (NSString *)jsonStringWithDict:(NSDictionary *)dict;
/**
 *字典3des解密
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 *字符串3des加密
 */
+ (NSString *)jsonStringWithStr:(NSString *)string;
/**
 *字符串3des解密
 */
+ (NSString *)strWithJsonString3DES:(NSString *)jsonString;


//二维码解密
+ (NSString *)DecryptionWithStr:(NSString *)jsonString AndDecryptionKey:(NSString *)key;

@end
