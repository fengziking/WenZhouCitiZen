//
//  NSDictionary+encoding.h
//  WenLingCitizenCard
//
//  Created by 创建zzh on 2017/3/8.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (encoding)

-(NSString*) jsonEncodedKeyValueString;
-(NSString*) plistEncodedKeyValueString;
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

@end
