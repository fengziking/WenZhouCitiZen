//
//  CJBaseWKWebViewController.m
//  CitizensTreasure2
//
//  Created by zhusf on 2017/5/12.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import "CJBaseWKWebViewController.h"
#import "WeakScriptMessageDelegate.h"
@interface CJBaseWKWebViewController ()<WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler>
//是否隐藏导航条
@property (nonatomic, copy)NSString *isHidNation;
/**分享的时候，如果用户未登录，提示用户登录，yes表示提示用户，N0表示不提示，默认状态是NO*/
@property (nonatomic, assign)BOOL isShareMarkedwords;

/**接受活动js传来的json字典*/
@property (nonatomic, strong)NSDictionary * jsDic;

/**隐藏活动*/
@property (nonatomic, assign)BOOL isHideIitem;

/**隐藏分享*/
@property (nonatomic, assign)BOOL isHideShareIitem;



@end


@implementation CJBaseWKWebViewController
- (void)dealloc {
    
    [_webView removeObserver:self forKeyPath:@"title"];
    [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [_webView setNavigationDelegate:nil];
    [_webView setUIDelegate:nil];
    
}

//清理web缓存
- (void)deleteWebViewCache {
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) {
        //清除部分缓存
        // NSSet *webSet = [NSSet setWithArray:@[WKWebsiteDataTypeDiskCache,WKWebsiteDataTypeMemoryCache]];
        //清除全部缓存
        NSSet *webSetType = [WKWebsiteDataStore allWebsiteDataTypes];
        NSDate *dateFrome = [NSDate dateWithTimeIntervalSince1970:0];
        [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:webSetType modifiedSince:dateFrome completionHandler:^{
            
        }];
    } else {
        NSString *libaryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *cookiesPath = [libaryPath stringByAppendingString:@"/Cookies"];
        NSError *error;
        [[NSFileManager defaultManager] removeItemAtPath:cookiesPath error:&error];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_interactivePopDisabled = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    //调用返回按钮，默认no
   // self.isOpenJSBack = KJSCloseJSBack;
    //清楚缓存默认NO
    //self.isOpenJSDeleCache = KJSCloseJSCache;
    //分享提示默认为NO
    self.isShareMarkedwords = NO;
    //初始化webview和配置
    [self initWKWebViewConfiguration];
    //初始化进度条
    [self initProgressview];

  
}

#pragma mark -加载配置项和wkwebview
- (void)initWKWebViewConfiguration {
    
    //创建配置类
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc]init];
   
    configuration.preferences.javaScriptCanOpenWindowsAutomatically = YES;//默认NO,表示不能通过窗口打开
    if (kSystermVersion >=9.0) {
        //允许视频播放
        configuration.allowsAirPlayForMediaPlayback = YES;
        // 允许在线播放
        configuration.allowsInlineMediaPlayback = YES;
    }
    
    // 允许可以与网页交互，选择视图
    configuration.selectionGranularity = YES;
    //创建更改数据源
    NSString * JS = [NSString stringWithFormat:@"loadDetail(\"%d\")",70];
    WKUserScript * script = [[WKUserScript alloc] initWithSource:JS injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];

    // 是否支持记忆读取
    configuration.suppressesIncrementalRendering = YES;
    // 允许用户更改网页的设置
    //WKWebView
    WKWebView *webview = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) configuration:configuration];
    webview.UIDelegate = self;
    webview.navigationDelegate = self;
    //适应你设定的尺寸
    [webview sizeToFit];
    //加载本地
    webview.allowsBackForwardNavigationGestures = YES;
    webview.scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    [self.view addSubview:webview];
    self.webView = webview;
   
    //侧滑返回上一页
    [_webView setAllowsBackForwardNavigationGestures:false];
   
    WKUserContentController *userCC = configuration.userContentController;
//    JS调用OC 添加处理脚本
//    [[WeakScriptMessageDelegate alloc]initWithDelegate:self] ;
    //防止白屏
    WKUserScript * cookieScript = [[WKUserScript alloc] initWithSource: @"document.cookie = 'skey=skeyValue';" injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
    [userCC addUserScript:cookieScript];
    
  //  [userCC addScriptMessageHandler:[[WeakScriptMessageDelegate alloc]initWithDelegate:self] name:KJSversion];//检测版本编号

  
}

#pragma mark -加载进度条
- (void)initProgressview {
    
    //进度条
    UIProgressView *progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 2)];
    //    progressView.backgroundColor = [UIColor blackColor];
    progressView.tintColor = KColorMainBlue;
    progressView.trackTintColor = [UIColor whiteColor];
    [self.view addSubview:progressView];
    self.progressView = progressView;
    //添加监听事件
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew  context:nil];
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];

    
}

//实现js调用iOS的handle委托，拦截js中带的交互
#pragma mark -WKScriptMessageHandler接受到js回传的参数
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    KNSLog(@"接受到的js调用oc的方法efew====消息：%@",message.body);
    //接受到传过来的消息，决定app调用的方式
    NSString *method = message.body;
//    if ([message.name isEqualToString:KJSgetJSLoginName]){
//        KNSLog(@"得到登录名：%@",method);
////        NSString *method = message.body;
//        [self getUserName:method];
//
//    }
}


//回到主页
- (void)backHome {
    dispatch_async(dispatch_get_main_queue(), ^{
        //if ([self.isOpenJSDeleCache isEqualToString:KJSopenJSCache]) {
            [self deleteWebViewCache];
       // }
        [self.navigationController popViewControllerAnimated:YES];
    });
    
}

//向JS发送用户手机号
//- (void)getJSUserMobile:(NSString *)method {
//    //methid，js传回来的方法名，appcurversion版本号，version注册名
//
//    NSString *js = [NSString stringWithFormat:@"%@('%@','%@')",method,loginStr,KJSgetJSUserMobile];
//    //向js发送数据
//    [self.webView evaluateJavaScript:js completionHandler:^(id _Nullable response, NSError * _Nullable error) {
//        KNSLog(@"getversion %@,%@",response,error);
//    }];
//
//}
//隐藏导航条
- (void)hideNagationBar {
    self.isHidNation = @"YES";
    [self viewWillLayoutSubviews];
}
- (void)showNagationBar {
     self.isHidNation = @"NO";
    [self viewWillLayoutSubviews];

    
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    if ([self.isHidNation isEqualToString:@"YES"]) {

        [UIView beginAnimations:@"Animation" context:nil];
        [UIView setAnimationDuration:0.2];
        [UIView setAnimationBeginsFromCurrentState:YES];
//        self.bgNaviView.hidden = YES;
        self.webView.frame = CGRectMake(0, 25, KScreenWidth, KScreenHeight-25);
        [UIView commitAnimations];
        
       
    } else if ([self.isHidNation isEqualToString:@"NO"]){

        [UIView beginAnimations:@"Animation" context:nil];
        [UIView setAnimationDuration:0.2];
        [UIView setAnimationBeginsFromCurrentState:YES];
//         self.bgNaviView.hidden = NO;
        self.webView.frame = CGRectMake(0, CJ_StatusBarAndNavigationBarHeight, KScreenWidth, KScreenHeight-CJ_StatusBarAndNavigationBarHeight-CJ_TabbarSafeBottomMargin);
        [UIView commitAnimations];
        
    }
}
//返回到首页
- (void)jumpToHomePage {
   // if ([self.isOpenJSDeleCache isEqualToString:KJSopenJSCache]) {
        [self deleteWebViewCache];
  //  }
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
//拨打电话
- (void)callPhone:(NSString *)phone {
    
    NSString *telStr = [NSString stringWithFormat:@"tel://%@",phone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telStr]];
    
}
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    KNSLog(@"打开网页时候调用   ====");
    
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation;{
      KNSLog(@"当内容开始返回时调用");

}
//加载完成的时候调用
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    KNSLog(@"加载完成时候调用");
    //拦截html
    NSString * str =  webView.URL.absoluteString;

    NSLog(@"加载完成当前网页：%@",str);
    
    
//    NSString *jsToGetHTMLSource = @"document.getElementsByTagName('html')[0].innerHTML";//获取整个页面的HTMLstring
//    [webView evaluateJavaScript:jsToGetHTMLSource completionHandler:^(id _Nullable HTMLsource, NSError * _Nullable error) {
//    }];

}
#pragma mark -kvo-
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqual:@"estimatedProgress"] && object == self.webView) {
        if ([change[@"new"] floatValue] < [change[@"old"] floatValue]) {
            return;
        }
        [self.progressView setAlpha:1.0f];
        [self.progressView setProgress:self.webView.estimatedProgress animated:YES];
        
        if (self.webView.estimatedProgress >= 1.0f) {
            [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self.progressView setAlpha:0.0f];
            } completion:^(BOOL finished) {
                [self.progressView setProgress:0.0f animated:YES];
                self.progressView.hidden = YES;
            }];
        }
    }
    else if ([keyPath isEqual:@"title"] && object == self.webView){
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([NSString isEqual:self.webView.title]) {
                [self.webView reload];
            }
          //  if ([self.isOpenJSBack isEqualToString:KJSopenJSBack]) {
                self.title = self.webView.title;
          //  }
            
        });
        
    }
    //加载完成
    
}

#pragma mark -WKUIDelegate
//在js端调用alert函数时，会调用此方法
//js端调用alert时所传的数据可以通过message拿到
//在原生得到结果后，需要回掉js，是通过completionHandler
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:message message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }]];
    
    [self presentViewController:alert animated:YES completion:NULL];
    KNSLog (@"%@", message);
}
// JS端调用confirm函数时，会触发此方法
// 通过message可以拿到JS端所传的数据
// 在iOS端显示原生alert得到YES/NO后
// 通过completionHandler回调给JS端
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler {
    KNSLog(@"%s", __FUNCTION__);
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:message message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }]];
    [self presentViewController:alert animated:YES completion:NULL];
    
    KNSLog(@"%@", message);
}
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:prompt message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        // textField.textColor = [UIColor redColor];
        textField.placeholder = defaultText;
    }];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler([[alert.textFields lastObject] text]);
    }]];
    
    [self presentViewController:alert animated:YES completion:NULL];
    
}

// 类型，在请求先判断能不能跳转（请求）
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSString *hostname = navigationAction.request.URL.host.lowercaseString;
    NSURL *url = navigationAction.request.URL;
    //    NSString *schem = [url scheme];
    KNSLog(@"=====2====%@,%@,%@",hostname,url,navigationAction.request.URL.host);
    //允许跳转到金华银行
    if (kSystermVersion >= 10) {
//        if ([[NSString stringWithFormat:@"%@",url] containsString:@"cn.com.jhccb.per.iphone"] || [[NSString stringWithFormat:@"%@",url] containsString:@"itunes.apple.com"]) {
//             [[UIApplication sharedApplication] openURL:url options:nil completionHandler:nil];
//        }
    } else {
//        if ([[NSString stringWithFormat:@"%@",url] containsString:@"cn.com.jhccb.per.iphone"] || [[NSString stringWithFormat:@"%@",url] containsString:@"itunes.apple.com"]) {
//            [[UIApplication sharedApplication] openURL:url];
//        }
    }
    WKNavigationActionPolicy actionPolicy = WKNavigationActionPolicyAllow;
    //允许跳转
    decisionHandler(actionPolicy);
    //
    KNSLog(@"%s", __FUNCTION__);


}
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler {
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        
        if ([challenge previousFailureCount] == 0) {
            
            NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
            
            completionHandler(NSURLSessionAuthChallengeUseCredential, credential);
            
        } else {
            
            completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge, nil);
            
        }
        
    } else {
        
        completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge, nil);
        
    }
}

// 在响应完成时，会回调此方法
// 如果设置为不允许响应，web内容就不会传过来
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    decisionHandler(WKNavigationResponsePolicyAllow);
    KNSLog(@"%s", __FUNCTION__);
  //  if (self.isPushShareOrCancel) {
      //  self.isPushShareOrCancel = NO;
//    }
    
}

// 9.0才能使用，web内容处理中断时会触发
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {
    [webView reload];
    KNSLog(@"%s", __FUNCTION__);
}
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    KNSLog(@"%s,%@", __FUNCTION__,error);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
