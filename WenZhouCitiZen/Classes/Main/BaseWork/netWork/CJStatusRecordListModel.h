//
//  CJStatusRecordListModel.h
//  WenLingCitizenCard
//
//  Created by 创建zzh on 2017/3/16.
//  Copyright © 2017年 zhusf. All rights reserved.
//

#import <Foundation/Foundation.h>


//列表型数据返回 封装该model 
@interface CJStatusRecordListModel : NSObject

@property (assign, nonatomic) NSInteger currPage;
@property (assign, nonatomic) NSInteger totalCount;
@property (assign, nonatomic) NSInteger totalPage;

@property (strong, nonatomic) NSArray *recordList;


@end
