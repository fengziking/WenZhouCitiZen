//
//  JHMoneyView.m
//  JinHuaCitizen
//
//  Created by Frank-Lee on 17/10/20.
//  Copyright © 2017年 Frank-Lee. All rights reserved.
//

#import "JHMoneyView.h"

@implementation JHMoneyView

-(instancetype)initWithFrame:(CGRect)frame WithTitle:(NSArray *)titleArr  {
    self = [super initWithFrame:frame];
    if (self ) {
        
        self.backgroundColor = KColorWhite ;
        [self creatTypeViewWithtitle:titleArr] ;
        
    }
    return self ;
}

-(void)creatTypeViewWithtitle:(NSArray *)titleArr {
    
    for (int i = 0 ; i < titleArr.count ; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(15+((KScreenWidth-30-40)/3+20)*(i%3), 15+65*(i/3), (KScreenWidth-30-40)/3, 50);
        [button setTitle:titleArr[i] forState:normal];
        [button setTitleColor:KColorMainBlue forState:normal];
        button.backgroundColor = KColorWhite ;
        button.titleLabel.font = kFontSize15;
        button.layer.cornerRadius = 5.0 ;
        button.layer.masksToBounds = YES ;
        button.layer.borderWidth = 1.0 ;
        button.layer.borderColor = KColorMainBlue.CGColor ;
        [self addSubview:button];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
}
-(void)buttonClick:(UIButton *)sender {
    
    if (self.buttonBlock) {
//        if ([sender.currentTitle isEqualToString:@"20元"]) {
//            self.buttonBlock(@"20");
//        }else if ([sender.currentTitle isEqualToString:@"50元"]) {
//            self.buttonBlock(@"50");
//        }else if ([sender.currentTitle isEqualToString:@"100元"]) {
//            self.buttonBlock(@"100");
//        }else if ([sender.currentTitle isEqualToString:@"200元"]) {
//            self.buttonBlock(@"200");
//        }else if ([sender.currentTitle isEqualToString:@"500元"]) {
//            self.buttonBlock(@"500");
//        }
        NSRange range = [sender.currentTitle rangeOfString:@"元"];
        NSString *money = [sender.currentTitle substringToIndex:range.location];
        KNSLog(@"%@",money);
        NSString *moneyStr = [NSString stringWithFormat:@"%.0f",[money doubleValue] * 100];
        self.buttonBlock(moneyStr);
    }
    
    for (id obj in self.subviews)  {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton* selectBtn = (UIButton*)obj;
            
            if (selectBtn == sender) {
                
                selectBtn.backgroundColor = KColorMainBlue ;
                [selectBtn setTitleColor:KColorWhite forState:normal];
                
            }else {
                
                selectBtn.backgroundColor = KColorWhite ;
                [selectBtn setTitleColor:KColorMainBlue forState:normal];
            }
        }
    }
    
}

#pragma mark == 是否有选中 搜索类别的 button
-(BOOL)isSelect {
    
    NSMutableArray *array = [NSMutableArray array];
    [array removeAllObjects];
    for (id obj in self.subviews)  {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton* selectBtn = (UIButton*)obj;
            
            //            BOOL is = .sele
            
            if ([selectBtn.backgroundColor isEqual:KColorMainBlue]) {
                [array addObject:@"YES"];
            }else {
                [array addObject:@"NO"];
            }
            
        }
    }
    
    KNSLog(@"－－－－－－－title－－%@",array);
    if ([array containsObject:@"YES"]) {
        
        return YES ;
    }else {
        
        return NO ;
    }
    
}



@end
