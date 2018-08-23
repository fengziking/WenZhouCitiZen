//
//  MinetableView.m
//  JinHuaCitizen
//
//  Created by Frank-Lee on 17/8/3.
//  Copyright © 2017年 Frank-Lee. All rights reserved.
//

#import "MineTableView.h"
#import "MineTableCell.h"

@interface MineTableView ()<UITableViewDelegate,UITableViewDataSource>

@end

static NSString *mineTableCell = @"MineTableCell";

@implementation MineTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.backgroundColor = KColorMainGray ;
        self.delegate = self ;
        self.dataSource = self ;
        self.separatorColor = KColorMainGray ;
        self.rowHeight = [MineTableCell getRowHeight];
        self.tableFooterView = [[UIView alloc]init];
    }
    return self ;
}
-(void)setSetBool:(BOOL)setBool{
    _setBool = setBool;
//    self.backgroundColor = KColorMainGray ;
//    self.delegate = self ;
//    self.dataSource = self ;
//    self.separatorColor = KColorMainGray ;
//    self.rowHeight = [MineTableCell getRowHeight];
//    self.tableFooterView = [[UIView alloc]init];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10 ;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 10)];
    view.backgroundColor = KColorMainGray ;
    return view ;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3 ;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3 ;
    }else if (section == 1) {
        return 1 ;
    }else {
        return 4 ;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MineTableCell *cell = [tableView dequeueReusableCellWithIdentifier:mineTableCell];
    if (cell == nil) {
        cell = [[MineTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mineTableCell];
    }
  
    if (indexPath.section == 0) {
        cell.model = [self.dataArray objectAtIndexCheck:indexPath.row];
    }else if (indexPath.section == 1) {
        cell.model = [self.dataArray objectAtIndexCheck:indexPath.row+3];
    }else {
        cell.model = [self.dataArray objectAtIndexCheck:indexPath.row+4];
    }
    cell.setBool = self.setBool;
    return cell ;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}
-(NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray ;
}


@end
