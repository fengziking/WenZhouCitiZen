//
//  NoListView.m
//  JinHuaCitizen
//
//  Created by 朱书峰 on 2017/9/6.
//  Copyright © 2017年 Frank-Lee. All rights reserved.
//

#import "NoListView.h"

@interface NoListView ()
@property (nonatomic, strong)UIImageView *imageView;
@end
@implementation NoListView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = KColorWhite ;
        [self addSubview:self.imageView];
    }
    return self;
}
- (void)layoutSubviews {
    self.imageView.frame = CGRectMake(self.width / 2 - 100, 100, 200, 200 * 314/339);
}
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.image = [UIImage imageNamed:@"icon-null"];
    }
    return _imageView;
}
@end
