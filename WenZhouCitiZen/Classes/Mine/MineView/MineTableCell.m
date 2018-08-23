//
//  MineTableCell.m
//  JinHuaCitizen
//
//  Created by Frank-Lee on 17/8/3.
//  Copyright © 2017年 Frank-Lee. All rights reserved.
//

#import "MineTableCell.h"

@implementation MineModel

@end


@interface MineTableCell ()

@property (nonatomic,strong)UIImageView *imageV ;
@property (nonatomic,strong)UILabel *title ;


@end

@implementation MineTableCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = KColorWhite ;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator ;
        self.selectionStyle = UITableViewCellSelectionStyleNone ;
        [self creatViews];
    }
    return self ;
}
-(void)creatViews {
    
    [self.contentView addSubview:self.imageV];
    [self.contentView addSubview:self.title];
}
-(UIImageView *)imageV {
    if (!_imageV) {
        _imageV = [[UIImageView alloc]initWithFrame:CGRectMake(15, 7, 30, 30)];
    }
    return _imageV ;
}
-(UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc]initWithFrame:CGRectMake(55, 7, 140, 30)];
        _title.textColor = KColor3333;
        _title.textAlignment = NSTextAlignmentLeft ;
        _title.font = kFontSize15 ;
    }
    return _title ;
}
-(void)setSetBool:(BOOL)setBool{
    _setBool = setBool;
    self.imageV.image = [UIImage imageNamed:self.model.imageName];
    if (setBool) {
        self.title.text = self.model.title ;

    }else{
        self.title.text = @"123";
    }
    
}
//-(void)setModel:(MineModel *)model {
//    _model = model;
//    self.imageV.image = [UIImage imageNamed:model.imageName];
//    self.title.text = model.title ;
//}
+(CGFloat)getRowHeight {
    return 44 ;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end