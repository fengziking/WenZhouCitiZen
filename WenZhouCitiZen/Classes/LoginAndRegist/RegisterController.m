//
//  RegisterController.m
//  XJCardPro
//
//  Created by 张战宏 on 2017/4/29.
//  Copyright © 2017年 cjzzh. All rights reserved.
//

#import "RegisterController.h"
#import "CJLogTextFiled.h"


@interface RegisterController ()

@property (nonatomic, strong)CJLogTextFiled *phoneTfd;

@property (nonatomic, strong)CJLogTextFiled *codeTfd;

@property (nonatomic, strong)UIButton *nextBtn;


@end

@implementation RegisterController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"注册";
    
    [self creatView];
}
- (void)creatView {
    [self.view addSubview:self.phoneTfd];
    [self.view addSubview:self.codeTfd];
    [self.view addSubview:self.nextBtn];


    
}

#pragma mark -- LayyLoad
- (CJLogTextFiled *)phoneTfd {
    if (!_phoneTfd) {
        @weakify(self);
        _phoneTfd = [[CJLogTextFiled alloc] initWithFrame:CGRectMake(12, CJ_StatusBarAndNavigationBarHeight+kMargin-2, KScreenWidth-24, kCJTfdHeight) beginEdit:^(UITextField *tfd) {
            
        } didChanged:^(UITextField *tfd) {
            @strongify(self);
            //[self checkTfdAction];
        } endEdit:^(UITextField *tfd) {
            
        } toMaxEdit:^(UITextField *tfd) {
            
        }];
        _phoneTfd.placeholder = @"请输入手机号码";
        _phoneTfd.imgName = @"xj_gray_tel";
        _phoneTfd.tfd.keyboardType = UIKeyboardTypeNumberPad;
        _phoneTfd.maxLength = 11;
    }
    return _phoneTfd;
}

- (CJLogTextFiled *)codeTfd {
    if (!_codeTfd) {
        @weakify(self);
        _codeTfd = [[CJLogTextFiled alloc] initWithFrame:CGRectMake(_phoneTfd.left, _phoneTfd.bottom+14, _phoneTfd.width, _phoneTfd.height) beginEdit:^(UITextField *tfd) {
        } didChanged:^(UITextField *tfd) {
            @strongify(self);
            if (tfd.text.length == 11) {
                [self resignCurrentFirstResponder];
            }
           // [self checkTfdAction];
        } endEdit:^(UITextField *tfd) {
//            @strongify(self);
        } toMaxEdit:^(UITextField *tfd) {
            
        }];
        _codeTfd.placeholder = @"请输入验证码";
        _codeTfd.tfd.keyboardType = UIKeyboardTypeNumberPad;
        _codeTfd.imgName = @"xj_psd";
        _codeTfd.maxLength = 11;
        
        [_codeTfd configCountDownNormalTitle:@"获取验证码" changeingTitle:@"剩余" finishedTitle:@"重新获取" countDownTime:60];
        
        _codeTfd.beginCountDwon = ^(UIButton *btn) {
            @strongify(self);
            if (self.phoneTfd.text.length != 11) {
                kMBShowInVC(@"请输入完整手机号", 2);
                [self.codeTfd.countDownBtn stopCountDown];
            } else {
                //发送验证码
               // [self loadCodeData];
            }
        };
        _codeTfd.endingCountDown = ^(UIButton *btn){
        
        };
    }
    return _codeTfd;
}

-(UIButton *)nextBtn{
    if (!_nextBtn) {
    
        @weakify(self);
        _nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, _codeTfd.bottom+30, KScreenWidth-30, 45) title:@"下一步" image:nil textFont:15 textColor:[UIColor whiteColor] backgroundColor:KColorMainBlue action:^(UIButton *btn) {
            @strongify(self);
             [btn beginSubmitting:nil];
        }];
        _nextBtn.layer.cornerRadius = YES;
        _nextBtn.layer.cornerRadius = 5.0;
    }
    return _nextBtn;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
