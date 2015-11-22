//
//  Model.m
//  LcCategoryPropertySample
//
//  Created by jiangliancheng on 15/11/21.
//  Copyright © 2015年 jiangliancheng. All rights reserved.
//

#import "Model.h"
#import "NSObject+LcInvokeAllMethod.h"

@implementation Model

+ (void)initialize
{
    [self invokeAllClassMethodWithSelector:@selector(categoryInitialize)];
}

@end
