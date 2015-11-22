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

+ (void)categoryInitialize
{
    [self addBasicProperty:@"point" encodingType:@encode(CGPoint)];
    [self addBasicProperty:@"myRect" encodingType:@encode(CGRect)];
    [self addBasicProperty:@"f" encodingType:@encode(float)];
    [self addBasicProperty:@"a" encodingType:@encode(int)];
}

@end

