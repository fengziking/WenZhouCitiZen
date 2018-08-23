//
//  DES3.h
//  MySDKTest
//
//  Created by zhusf on 16/7/7.
//  Copyright © 2016年 zhusf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>
#import "ConverUtil.h"
@interface DES3 : NSObject
//加密
+ (NSString *) encryptUseDES:(NSString *)plainText key:(NSString*)key;
//解密
+(NSString*) decryptUseDES:(NSString*)cipherText key:(NSString*)key;
@end
