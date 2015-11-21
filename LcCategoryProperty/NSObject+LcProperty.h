//
//  NSObject+LcProperty.h
//  LcCategoryPropertySample
//
//  Created by jiangliancheng on 15/11/21.
//  Copyright © 2015年 jiangliancheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

extern NSString const*LcUnknownTypeException;

@interface NSObject (LcProperty)
/**
 *  为类添加id类型的属性，objc_AssociationPolicy类型为OBJC_ASSOCIATION_RETAIN_NONATOMIC
 *  @param name 属性的name
 */
+ (void)addObjectProperty:(NSString *)name;

/**
 *  为类添加id类型的属性
 *  @param name   属性的name
 *  @param policy 属性的policy
 */
+ (void)addObjectProperty:(NSString *)name associationPolicy:(objc_AssociationPolicy)policy;

/**
 *  为类添加基础类型的属性，如：int,float,CGPoint,CGRect等
 *  @param name 属性的name
 *  @param type 属性的encodingType，如int类型的属性，type为@encode(int)
 */
+ (void)addBasicProperty:(NSString *)name encodingType:(char *)type;

@end
