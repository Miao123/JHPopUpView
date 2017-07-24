//
//  PopUpView.m
//  弹出框
//
//  Created by 苗建浩 on 2017/6/18.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "PopUpView.h"
#import "Header.h"
#import "PopTableCell.h"
#import "PopModel.h"


@interface PopUpView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIView *showView;
@property (nonatomic, strong) UITableView *popTable;
@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation PopUpView

+ (instancetype)initWithFrame:(CGRect)frame textArr:(NSArray *)textArr block:(void (^)(NSString *))block{
    PopUpView *popView = [[PopUpView alloc] initWithFrame:frame];
    popView.dataArr = textArr;
    popView.sendStrBlock = block;
    [popView frame:frame];
    popView.backgroundColor = [UIColor clearColor];
    return popView;
}


//- (void)drawRect:(CGRect)rect{
//    NSLog(@"  %g   %g",rect.size.width,rect.size.height);
//    //    获得处理的上下文
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    //    设置线条样式
//    CGContextSetLineCap(context, kCGLineCapButt);
//    //    设置线条粗细宽度
//    CGContextSetLineWidth(context, 1.0);
//    //    设置颜色
//    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
//    //    开始一个起始路径
//    CGContextBeginPath(context);
//    //    起始点设置为（0，0）这是上下文对应区域的相对坐标
//    CGContextMoveToPoint(context, 0, 15);
//    //    设置下一个坐标点
//    CGContextAddLineToPoint(context, 30, 15);
//    //    设置下一个坐标点
//    CGContextAddLineToPoint(context, 35, 0);
//    //    设置下一个坐标点
//    CGContextAddLineToPoint(context, 40, 15);
//    //    设置下一个坐标点
//    CGContextAddLineToPoint(context, rect.size.width, 15);
//    //    设置下一个坐标点
//    CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
//    //    设置下一个坐标点
//    CGContextAddLineToPoint(context, 0, rect.size.height);
//    //    设置下一个坐标点
//    CGContextAddLineToPoint(context, 0, 15);
//
//    //    连接上面定义的坐标点
//    CGContextStrokePath(context);
//
//}


- (void)frame:(CGRect)frame {
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHight)];
    backView.backgroundColor = [UIColor clearColor];
    self.backView = backView;
    [[UIApplication sharedApplication].keyWindow addSubview:backView];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [backView addGestureRecognizer:tap];
    
    CGFloat height;
    if (_dataArr.count > 5) {
        height = 40 * DISTENCEH * 5;
    }else{
        height = 40 * DISTENCEH * _dataArr.count;
    }
    
    
    UIView *showView = [[UIView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y + frame.size.height, frame.size.width, 0)];
    showView.backgroundColor = [UIColor whiteColor];
    showView.layer.borderWidth = 1;
    showView.layer.cornerRadius = 3;
    showView.layer.borderColor = [UIColor grayColor].CGColor;
    self.showView = showView;
    [[UIApplication sharedApplication].keyWindow addSubview:showView];
    
    
    UITableView *popTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, showView.width, 0) style:UITableViewStylePlain];
    popTable.delegate = self;
    popTable.dataSource = self;
    popTable.tableFooterView = [[UIView alloc] init];
    if (_dataArr.count > 5) {
        popTable.scrollEnabled = YES;
    }else{
        popTable.scrollEnabled = NO;
    }
    self.popTable = popTable;
    [showView addSubview:popTable];
    
    
    [UIView animateWithDuration:0.3 animations:^{
        showView.height = height;
        popTable.height = height;
    }];
}


#pragma mark ------ UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40 * DISTENCEH;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PopTableCell *cell = [PopTableCell creatCellWithTableView:tableView];
    cell.dataModel = _dataArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PopModel *dataModel = _dataArr[indexPath.row];
    if (self.sendStrBlock) {
        self.sendStrBlock(dataModel.name);
    }
    [self hideView];
    
}

- (void)tap:(UITapGestureRecognizer *)tap{
    [self hideView];
}


- (void)hideView{
    //    [UIView animateWithDuration:0.3 animations:^{
    
    [UIView animateWithDuration:0.3 animations:^{
        _showView.height = 0;
        _popTable.height = 0;
    }];
    //    } completion:^(BOOL finished) {
    [self.backView removeFromSuperview];
    self.alpha = 0;
    //    }];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
