//
//  ViewController.m
//  弹出框
//
//  Created by 苗建浩 on 2017/6/16.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "ViewController.h"
#import "PopUpView.h"
#import "PopModel.h"
#import "Header.h"


@interface ViewController ()
@property (nonatomic, strong) UIScrollView *backScroll;
@property (nonatomic, strong) UIButton *clickBtn;
@property (nonatomic, strong) PopUpView *showView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) UIButton *choiceBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"弹出框";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArr = [NSMutableArray array];
    
    
    NSArray *arr = @[@{@"name":@"北京"},@{@"name":@"天津"},@{@"name":@"上海"},@{@"name":@"重庆"},@{@"name":@"河北"},@{@"name":@"北京"}];
    for (NSDictionary *dic in arr) {
        [_dataArr addObject:[PopModel modelWithdic:dic]];
    }
    
    
    UIScrollView *backScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHight)];
    backScroll.backgroundColor = [UIColor whiteColor];
    backScroll.contentSize = CGSizeMake(screenWidth, 2 * screenHight);
    self.backScroll = backScroll;
    [self.view addSubview:backScroll];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [backScroll addGestureRecognizer:tap];
    
    
    UIButton *clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    clickBtn.frame = CGRectMake(100, NAVGATION_ADD_STATUS_HEIGHT + 100, 100, 40 * DISTENCEH);
    clickBtn.backgroundColor = [UIColor whiteColor];
    [clickBtn setTitle:@"弹出按钮" forState:0];
    [clickBtn setTitleColor:[UIColor blackColor] forState:0];
    clickBtn.layer.borderColor = [UIColor grayColor].CGColor;
    clickBtn.layer.borderWidth = 1;
    clickBtn.layer.cornerRadius = 3;
    [clickBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    clickBtn.centerX = self.view.centerX;
    self.clickBtn = clickBtn;
    [self.view addSubview:clickBtn];
    
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, NAVGATION_ADD_STATUS_HEIGHT, screenWidth - 40, 40 * DISTENCEH)];
    textField.backgroundColor = [UIColor whiteColor];
    textField.placeholder = @"请输入你想说的话";
    textField.textAlignment = NSTextAlignmentRight;
    textField.layer.borderColor = [UIColor grayColor].CGColor;
    textField.layer.borderWidth = 1;
    textField.layer.cornerRadius = 3;
    [backScroll addSubview:textField];
    
}


- (void)buttonClick:(UIButton *)sender{
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    CGRect rect = [_clickBtn convertRect: _clickBtn.bounds toView:window];
    PopUpView *showView = [PopUpView initWithFrame:rect textArr:_dataArr block:^(NSString *str) {
        [_clickBtn setTitle:str forState:0];
    }];
    self.showView = showView;
    [_backScroll addSubview:showView];
}


- (void)tap:(UITapGestureRecognizer *)tap{
     [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
