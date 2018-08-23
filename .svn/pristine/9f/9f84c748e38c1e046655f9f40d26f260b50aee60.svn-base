//
//  WeakScriptMessageDelegate.m
//  CitizensTreasure2
//
//  Created by 朱书峰 on 2017/3/13.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import "WeakScriptMessageDelegate.h"

@implementation WeakScriptMessageDelegate
- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate {
    
    if (self = [super init]) {
        _scriptDelegate = scriptDelegate;
    }
    return self;
}
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
    [self.scriptDelegate userContentController:userContentController didReceiveScriptMessage:message];
    
}

@end
