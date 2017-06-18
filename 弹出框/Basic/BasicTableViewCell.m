//
//  BasicTableViewCell.m
//  弹出框
//
//  Created by 苗建浩 on 2017/6/18.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "BasicTableViewCell.h"

@implementation BasicTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)creatCellWithTableView:(UITableView *)tableView{
    NSString *cellIdentifier = NSStringFromClass([self class]);
    BasicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
