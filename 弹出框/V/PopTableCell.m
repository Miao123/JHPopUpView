//
//  PopTableCell.m
//  弹出框
//
//  Created by 苗建浩 on 2017/6/18.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "PopTableCell.h"
#import "Header.h"

@interface PopTableCell ()
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation PopTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth(self.bounds), 40 * DISTENCEH)];
        nameLabel.font = [UIFont systemFontOfSize:15 * DISTENCEW];
        nameLabel.textColor = [UIColor blackColor];
        nameLabel.textAlignment = NSTextAlignmentLeft;
        self.nameLabel = nameLabel;
        [self.contentView addSubview:nameLabel];
        
    }
    return self;
}

- (void)setDataModel:(PopModel *)dataModel{
    _nameLabel.text = [NSString stringWithFormat:@"%@",dataModel.name];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
