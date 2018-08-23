//
//  NSArray+cate.m
//  WXWorkPlatform
//
//  Created by 何飞 on 16/8/4.
//  Copyright © 2016年 zhusf. All rights reserved.
//

#import "NSArray+cate.h"
#import "NSString+unicode.h"
#import <objc/runtime.h>
@implementation NSArray (cate)


- (id)objectAtIndexCheck:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}

#ifdef DEBUG
- (NSString *)descriptionWithLocale:(id)locale{
    return self.debugDescription;
}

- (NSString *)xy_debugDescription{
    return self.xy_debugDescription.unicodeString;
}

+ (void)load{
    [self swapMethod];
}

+ (void)swapMethod{
    Method method1 = class_getInstanceMethod(self, @selector(debugDescription));
    Method method2 = class_getInstanceMethod(self, @selector(xy_debugDescription));
    
    method_exchangeImplementations(method1, method2);
}
#endif
@end

