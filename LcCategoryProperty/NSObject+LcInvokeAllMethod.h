//
//  NSObject+LcInvokeAllMethod.h
//  LcCategoryPropertySample
//
//  Created by jiangliancheng on 15/11/22.
//  Copyright © 2015年 jiangliancheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LcInvokeAllMethod)

/**
 *  通过selector调用所有实例的方法，包括被category覆盖的方法
 *  @param selector 要调用方法的selector
 */
- (void)invokeAllInstanceMethodWithSelector:(SEL)selector;

/**
 *  通过selector调用所有类的方法，包括被category覆盖的方法
 *  @param selector 方法的selector
 */
+ (void)invokeAllClassMethodWithSelector:(SEL)selector;

@end
