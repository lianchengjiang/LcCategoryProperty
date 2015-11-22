//
//  Model+second.m
//  LcCategoryPropertySample
//
//  Created by jiangliancheng on 15/11/22.
//  Copyright © 2015年 jiangliancheng. All rights reserved.
//

#import "Model+second.h"
#import "NSObject+LcProperty.h"

@implementation Model (second)
@dynamic name;
@dynamic URL;
@dynamic date;

+ (void)categoryInitialize
{
    [self addObjectProperty:@"URL"];
    [self addObjectProperty:@"date"];
    [self addObjectProperty:@"name" associationPolicy:OBJC_ASSOCIATION_COPY_NONATOMIC];
}

@end
