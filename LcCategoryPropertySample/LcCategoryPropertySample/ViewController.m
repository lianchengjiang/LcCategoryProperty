//
//  ViewController.m
//  LcCategoryPropertySample
//
//  Created by jiangliancheng on 15/11/21.
//  Copyright © 2015年 jiangliancheng. All rights reserved.
//

#import "ViewController.h"
#import "Model+Property.h"
#import "Model+second.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Model *model = [[Model alloc] init];
    model.name = @"name";
    model.f = 4.2;
    model.a = 89.2;
    model.point = CGPointZero;
    model.myRect = CGRectMake(0, 78, 67, 67);
    NSLog(@"name:%@",model.name);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
