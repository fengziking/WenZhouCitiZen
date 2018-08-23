//
//  LoginScrollView.m
//  JinHuaCitizen
//
//  Created by Frank-Lee on 17/8/4.
//  Copyright © 2017年 Frank-Lee. All rights reserved.
//

#import "LoginScrollView.h"
#import "RegisterController.h"//注册

@interface LoginScrollView ()<UITextFieldDelegate>

@property (nonatomic,strong)UIImageView *logoImage ;

//账号输入框
@property (nonatomic,strong)UITextField *accountTF ;

//密码输入框
@property (nonatomic,strong)UITextField *pwdTextF ;

//登录－－按钮
@property (nonatomic,strong)UIButton *loginBtn ;

//忘记密码?
@property (nonatomic,strong)UIButton *forgetBtn ;

//注册
@property (nonatomic,strong)UIButton *registBtn ;

@end


@implementation LoginScrollView

-(void)senderString:(NSString *)registPhone {
    self.accountTF.text = registPhone ;
}
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = KColorWhite ;
        self.contentSize = CGSizeMake(KScreenWidth, KScreenHeight);
        self.showsVerticalScrollIndicator = NO;
        [self creatScrollViews];
    }
    return self ;
}

-(void)creatScrollViews {
    
    [self addSubview:self.logoImage];
    [self addSubview:self.accountTF];
    [self addSubview:self.pwdTextF];
    [self addSubview:self.loginBtn];
    [self addSubview:self.forgetBtn];
    [self addSubview:self.registBtn];
    
    
}

-(UIImageView *)logoImage {
    if (!_logoImage) {
        _logoImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_login"]];
        _logoImage.frame = CGRectMake((KScreenWidth/2-60), 70, 120, 120);
    }
    return _logoImage ;
}

-(UITextField *)accountTF {
    if (!_accountTF) {
        _accountTF = [[UITextField alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(_logoImage.frame)+50, KScreenWidth-30, 44)];
        _accountTF.placeholder = @"请输入您的账号";
        _accountTF.borderStyle = UITextBorderStyleRoundedRect ;
        _accountTF.keyboardType = UIKeyboardTypeNumberPad ;
        _accountTF.font = kFontSize14 ;
        
        UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(7, 7, 30, 30)];
        imageV.image = [UIImage imageNamed:@"iconr"];
        [leftView addSubview:imageV];
        
        _accountTF.leftView = leftView ;
        _accountTF.leftViewMode = UITextFieldViewModeAlways ;
        _accountTF.clearButtonMode = UITextFieldViewModeAlways ;
        _accountTF.delegate = self ;
        [_accountTF addTarget:self action:@selector(AccountTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        _accountTF.tag = 20 ;
    }
    return _accountTF ;
}
-(UITextField *)pwdTextF {
    if (!_pwdTextF) {
        _pwdTextF = [[UITextField alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(_accountTF.frame)+15, KScreenWidth-30, 44)];
        _pwdTextF.placeholder = @"请输入6～18位字母和数字的密码";
        _pwdTextF.borderStyle = UITextBorderStyleRoundedRect ;
        _pwdTextF.font = kFontSize14 ;
        
        UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(7, 7, 30, 30)];
        imageV.image = [UIImage imageNamed:@"mima"];
        [leftView addSubview:imageV];
        
        _pwdTextF.leftView = leftView ;
        _pwdTextF.leftViewMode = UITextFieldViewModeAlways ;
        _pwdTextF.clearButtonMode = UITextFieldViewModeAlways ;
        _pwdTextF.delegate = self ;
        [_pwdTextF addTarget:self action:@selector(PwdTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
        _pwdTextF.secureTextEntry = YES ;
        _pwdTextF.tag = 21 ;
    }
    return _pwdTextF ;
}

-(UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.frame = CGRectMake(15, CGRectGetMaxY(_pwdTextF.frame)+40, KScreenWidth-30, 50);
        [_loginBtn setTitle:@"登录" forState:normal];
        [_loginBtn setTitleColor:KColorWhite forState:normal];
        _loginBtn.titleLabel.font = kFontSize17 ;
        _loginBtn.backgroundColor = KColorMainBlue ;
        _loginBtn.layer.cornerRadius = 5.0 ;
        _loginBtn.layer.masksToBounds = YES ;
        [_loginBtn addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _loginBtn ;
}
-(UIButton *)forgetBtn {
    if (!_forgetBtn) {
        _forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _forgetBtn.frame = CGRectMake(15, CGRectGetMaxY(self.frame)-50-CJ_TabbarSafeBottomMargin, (KScreenWidth/2)-30, 40);
        [_forgetBtn setTitle:@"忘记密码？" forState:normal];
        [_forgetBtn setTitleColor:KColor3333 forState:normal];
        _forgetBtn.titleLabel.font = kFontSize15 ;
        [_forgetBtn jh_clickActionBlock:^(UIButton *button) {
            
        
        }];
    }
    return _forgetBtn ;
}
-(UIButton *)registBtn {
    if (!_registBtn) {
        _registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _registBtn.frame = CGRectMake((KScreenWidth/2)+15, CGRectGetMinY(self.forgetBtn.frame), (KScreenWidth/2)-30, 40);
        [_registBtn setTitle:@"注册" forState:normal];
        [_registBtn setTitleColor:KColor3333 forState:normal];
        _registBtn.titleLabel.font = kFontSize15 ;
        [_registBtn jh_clickActionBlock:^(UIButton *button) {
            RegisterController *vc = [[RegisterController alloc]init];
            [self.viewController.navigationController pushViewController:vc animated:YES];
            
        }];
    }
    return _registBtn ;
}


#pragma mark == 登录
-(void)loginClick:(UIButton *)sender {
    
    if(!(self.accountTF.text && self.accountTF.text.length>0)){
        [MBProgressHUD bwm_showTitle:@"请输入您的账号" toView:self hideAfter:2];
        return;
    }
    if (![CJTool isValidateMobile:self.accountTF.text]) {
        [MBProgressHUD bwm_showTitle:@"格式不对" toView:self hideAfter:2];

    }
    if ((self.pwdTextF.text.length < 6 || self.pwdTextF.text.length > 18)) {
        [MBProgressHUD bwm_showTitle:@"请输入6~18位登录密码" toView:self hideAfter:2];

        return ;
    }
    if (self.accountTF.text.length != 11) {
        [MBProgressHUD bwm_showTitle:@"请输入11位登陆账号" toView:self hideAfter:2];
        return;
    }

    
    //登录操作
    NSDictionary *dic = @{
                          kToken:@"1",
                          kCartID:@"1",
                          kUserId:@"1",
                          kOldPwd:@"1",
                          kSysSign:@"1",
                          kIsLogIn:@YES
                          };
    CJUserDataModel *userModel = [CJUserDataModel userModelWithDict:dic];
    [kCJBasicDataManager loginSucceedWithModel:userModel];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.viewController dismissViewControllerAnimated:YES completion:self.completionBack];
    });
    

}

#pragma mark == //判断是否是纯数字
- (BOOL)isPureNumandCharacters:(NSString *)string {
    
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0)
    {
        return NO;
    }
    return YES;
}
#pragma mark == //判断是否全字母：
- (BOOL)inputShouldLetter:(NSString *)inputString {
    if (inputString.length == 0) return NO;
    NSString *regex =@"[a-zA-Z]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:inputString];
}

#pragma mark == 限制输入框长度监听
-(void)AccountTextFieldDidChange:(UITextField*)textField {
    if (textField.text.length > 11) {
        textField.text = [textField.text substringToIndex:11];
    }
}
- (void)PwdTextFieldDidChange:(UITextField*)textField {
    if (textField.text.length > 18) {
        textField.text = [textField.text substringToIndex:18];
    }
    
}


#pragma mark == 限制输入框输入内容
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *scserStr ;
    if (textField.tag == 20) {
        scserStr = KJUSTNUMBER ;
    }else if (textField.tag == 21) {
        scserStr = KALPHANUM ;
    }
    
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:scserStr] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    return [string isEqualToString:filtered];
}

@end