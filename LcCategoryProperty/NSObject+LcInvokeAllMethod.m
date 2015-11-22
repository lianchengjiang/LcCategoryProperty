//
//  NSObject+LcInvokeAllMethod.m
//  LcCategoryPropertySample
//
//  Created by jiangliancheng on 15/11/22.
//  Copyright © 2015年 jiangliancheng. All rights reserved.
//

#import "NSObject+LcInvokeAllMethod.h"
#import <objc/runtime.h>

@implementation NSObject (LcInvokeAllMethod)

static inline void __invoke_all_method(id self, SEL selecotr)
{
    //1. 根据self，获取class
    Class class = object_getClass(self);
    
    //2. 获取方法列表
    uint count;
    Method *methodList = class_copyMethodList(class, &count);
    
    //3. 遍历方法列表
    for (int i = 0; i < count; i++) {
        Method method = methodList[i];
        //4. 根据SEL查找方法
        if (!sel_isEqual(selecotr, method_getName(method))) {
            continue;
        }
        
        //5. 获取方法的实现
        IMP implement = method_getImplementation(method);
        
        //6. 直接调用方法的实现
        ((void(*)(id,SEL))implement)(self, selecotr);
    }
}

- (void)invokeAllInstanceMethodWithSelector:(SEL)selector
{
    __invoke_all_method(self, selector);
}

+ (void)invokeAllClassMethodWithSelector:(SEL)selector
{
    __invoke_all_method(self, selector);
}


@end
