//
//  NSObject+LcProperty.m
//  LcCategoryPropertySample
//
//  Created by jiangliancheng on 15/11/21.
//  Copyright © 2015年 jiangliancheng. All rights reserved.
//

#import "NSObject+LcProperty.h"
#import <UIKit/UIKit.h>

NSString *LcAddPropertyException = @"LcAddPropertyException";

@implementation NSObject (LcProperty)
static inline NSString *__lc_setter_selector_name_of_property(NSString *property)
{
    NSString *headCharacter = [[property substringToIndex:1] uppercaseString];
    NSString *OtherString = [property substringFromIndex:1];
    return [NSString stringWithFormat:@"set%@%@:",headCharacter,OtherString];
}


+ (void)addObjectProperty:(NSString *)name
{
    [self addObjectProperty:name associationPolicy:OBJC_ASSOCIATION_RETAIN_NONATOMIC];
}


+ (void)addObjectProperty:(NSString *)name associationPolicy:(objc_AssociationPolicy)policy
{
    if (!name.length) {
        [[NSException exceptionWithName:LcAddPropertyException
                                 reason:@"property must not be empty in +addObjectProperty:associationPolicy:"
                               userInfo:@{@"name":name,@"policy":@(policy)}]
         raise];
    }

    //1. 通过class的指针和property的name，创建一个唯一的key
    NSString *key = [NSString stringWithFormat:@"%p_%@",self,name];

    //2. 用block实现setter方法
    id setblock = ^(id self,id value){
        objc_setAssociatedObject(self, (__bridge void *)key, value, policy);
    };

    //3. 将block的实现转化为IMP
    IMP imp = imp_implementationWithBlock(setblock);

    //4. 用name拼接出setter方法
    NSString *selString = __lc_setter_selector_name_of_property(name);

    //5. 将setter方法加入到class中
    BOOL result = class_addMethod([self class], NSSelectorFromString(selString), imp, "v@:@");
    assert(result);

    //6. getter
    id getBlock = ^id(id self){
        return objc_getAssociatedObject(self, (__bridge void*)key);
    };
    IMP getImp = imp_implementationWithBlock(getBlock);
    result = class_addMethod([self class], NSSelectorFromString(name), getImp, "@@:");
    assert(result);
}


+ (void)addBasicProperty:(NSString *)name encodingType:(char *)type
{
    if (!name.length) {
        [[NSException exceptionWithName:LcAddPropertyException
                                 reason:@"property must not be empty in +addBasicProperty:encodingType:"
                               userInfo:@{@"name":name,@"type":@(type)}]
         raise];
    }
    
    if (strcmp(type, @encode(id)) == 0) {
        [self addObjectProperty:name];
    }
    NSString *key = [NSString stringWithFormat:@"%p_%@",self,name];
    id setblock;
    id getBlock;
#define blockWithCaseType(C_TYPE)                               \
    if (strcmp(type, @encode(C_TYPE)) == 0) {                   \
        setblock = ^(id self,C_TYPE var){                       \
        NSValue *value = [NSValue value:&var withObjCType:type];\
        objc_setAssociatedObject(self, (__bridge void *)key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);  \
    };                                                          \
    getBlock = ^C_TYPE (id self){                               \
        NSValue *value = objc_getAssociatedObject(self, (__bridge void*)key);   \
        C_TYPE var;                                             \
        [value getValue:&var];                                  \
        return var;                                             \
    };                                                          \
}
    blockWithCaseType(char);
    blockWithCaseType(unsigned char);
    blockWithCaseType(short);
    blockWithCaseType(int);
    blockWithCaseType(unsigned int);
    blockWithCaseType(long);
    blockWithCaseType(unsigned long);
    blockWithCaseType(long long);
    blockWithCaseType(float);
    blockWithCaseType(double);
    blockWithCaseType(BOOL);

    blockWithCaseType(CGPoint);
    blockWithCaseType(CGSize);
    blockWithCaseType(CGVector);
    blockWithCaseType(CGRect);
    blockWithCaseType(NSRange);
    blockWithCaseType(CFRange);
    blockWithCaseType(CGAffineTransform);
    blockWithCaseType(CATransform3D);
    blockWithCaseType(UIOffset);
    blockWithCaseType(UIEdgeInsets);
#undef blockWithCaseType
    
    if (!setblock || !getBlock) {
        [[NSException exceptionWithName:LcAddPropertyException
                                reason:@"type is an unknown type in +addBasicProperty:encodingType:"
                              userInfo:@{@"name":name,@"type":@(type)}]
         raise];
    }
    
    IMP setImp = imp_implementationWithBlock(setblock);
    NSString *selString = __lc_setter_selector_name_of_property(name);
    NSString *setType = [NSString stringWithFormat:@"v@:%@",@(type)];
    BOOL result = class_addMethod([self class], NSSelectorFromString(selString), setImp, [setType UTF8String]);
    assert(result);
    
    IMP getImp = imp_implementationWithBlock(getBlock);
    NSString *getType = [NSString stringWithFormat:@"%@@:",@(type)];
    result = class_addMethod([self class], NSSelectorFromString(name), getImp, [getType UTF8String]);
    assert(result);
}
@end
