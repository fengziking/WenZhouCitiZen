//
//  MinetableView.h
//  JinHuaCitizen
//
//  Created by Frank-Lee on 17/8/3.
//  Copyright © 2017年 Frank-Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^minActionBlock)(NSInteger index);

@interface MineTableView : UITableView

@property (nonatomic,strong)NSMutableArray *dataArray ;
@property (nonatomic, copy)minActionBlock actionHandler;

@property (nonatomic, assign)BOOL setBool;

@end
