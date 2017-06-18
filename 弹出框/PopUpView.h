//
//  PopUpView.h
//  弹出框
//
//  Created by 苗建浩 on 2017/6/18.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopUpView : UIView

+ (instancetype)initWithFrame:(CGRect)frame popUpFrame:(CGRect)popFrame textArr:(NSArray *)textArr block:(void(^)(NSString *))block;

@property (nonatomic, copy) void(^sendStrBlock)(NSString *);

@end
