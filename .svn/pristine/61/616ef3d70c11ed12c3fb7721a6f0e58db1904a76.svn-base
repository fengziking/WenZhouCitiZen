//
//  HttpTool.m
//  WXWorkPlatform
//
//  Created by zhusf on 16/5/3.
//  Copyright © 2016年 zhusf. All rights reserved.
//

#import "HttpTool.h"
#import "NSString+MD5.h"
@implementation HttpTool


//二维码解密
+ (NSString *)DecryptionWithStr:(NSString *)jsonString AndDecryptionKey:(NSString *)key{
    NSString *keystr = key;
    
    return [DES3 decryptUseDES:jsonString key:keystr];
}


+ (NSString *)jsonStringWithDict:(NSDictionary *)dict {
    
    NSData *dataParams = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    
    NSString *jsonString = [[NSString alloc]initWithData:dataParams encoding:NSUTF8StringEncoding];
    NSString *key = @"qbyFhMTpHg4m4DrS6xFIw9Vw";
    NSString *jstr = [DES3 encryptUseDES:jsonString key:key];
    return jstr;
}

+ (NSString *)jsonStringWithStr:(NSString *)string {
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [data base64EncodedStringWithOptions:0];
    NSString *key = @"qbyFhMTpHg4m4DrS6xFIw9Vw";
    NSString *jstr = [DES3 encryptUseDES:base64String key:key];
    return jstr;
}
+ (NSString *)strWithJsonString3DES:(NSString *)jsonString {
    
    return [DES3 decryptUseDES:jsonString key:@"qbyFhMTpHg4m4DrS6xFIw9Vw"];
    
}


@end
