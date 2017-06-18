//
//  BasicModel.m
//  弹出框
//
//  Created by 苗建浩 on 2017/6/18.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "BasicModel.h"

@implementation BasicModel

+ (instancetype)modelWithdic:(NSDictionary *)dic{
    if (![dic isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    BasicModel *model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
