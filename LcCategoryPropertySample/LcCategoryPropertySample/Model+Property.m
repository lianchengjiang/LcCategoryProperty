//
//  Model+Property.m
//  LcCategoryPropertySample
//
//  Created by jiangliancheng on 15/11/21.
//  Copyright © 2015年 jiangliancheng. All rights reserved.
//

#import "Model+Property.h"
#import "NSObject+LcProperty.h"

@implementation Model (Property)
@dynamic name;
@dynamic URL;
@dynamic date;
@dynamic point;
@dynamic myRect;
@dynamic f;
@dynamic a;

+ (void)load
{
    [self addObjectProperty:@"URL"];
    [self addObjectProperty:@"date"];
    [self addObjectProperty:@"name" associationPolicy:OBJC_ASSOCIATION_COPY_NONATOMIC];
    [self addBasicProperty:@"point" encodingType:@encode(CGPoint)];
    [self addBasicProperty:@"myRect" encodingType:@encode(CGRect)];
    [self addBasicProperty:@"f" encodingType:@encode(float)];
    [self addBasicProperty:@"a" encodingType:@encode(int)];
}

@end

