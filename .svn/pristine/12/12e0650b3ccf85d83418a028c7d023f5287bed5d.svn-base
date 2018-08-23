//
//  WeakScriptMessageDelegate.h
//  CitizensTreasure2
//
//  Created by 朱书峰 on 2017/3/13.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
#import <WebKit/WKScriptMessageHandler.h>
//#import <JavaScriptCore/JavaScriptCore.h>
@interface WeakScriptMessageDelegate : NSObject<WKScriptMessageHandler>
@property (nonatomic ,weak) id <WKScriptMessageHandler> scriptDelegate;
- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate;
@end
