//
//  NSArray+WXS.m
//  Tujia
//
//  Created by 王小树 on 16/5/10.
//  Copyright © 2016年 bp1010. All rights reserved.
//

#import "NSArray+WXS.h"


@implementation NSArray (WXS)
+(void)load{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
       
        Method m1 = class_getInstanceMethod([self class], @selector(lastObject));
        Method m2 = class_getInstanceMethod([self class], @selector(My_lastObject));
        
        BOOL isAdd = class_addMethod([self class], @selector(lastObject), method_getImplementation(m2), method_getTypeEncoding(m2));
        if (isAdd == YES) {
            
            class_replaceMethod([self class], @selector(My_lastObject), method_getImplementation(m1), method_getTypeEncoding(m1));
            
        }else{
            method_exchangeImplementations(m1, m2);
        }
        
        
        Method m3 = class_getInstanceMethod([self class], @selector(firstObject));
        Method m4 = class_getInstanceMethod([self class], @selector(My_fistObjcet));
        method_exchangeImplementations(m3, m4);
        
    });
    
    
}
-(id)My_fistObjcet{
    NSLog(@"My_fistObjcet : exchangeSuccess");
    return [self My_fistObjcet];
}
-(id)My_lastObject{
    NSLog(@"My_lastObject : exchangeSuccess");
    return [self My_lastObject];
}


-(id)wxs_objectAtIndex:(NSUInteger)index{
    NSLog(@"exchangeSuccess");
    if (self.count <= index) {
        
#if DEBUG
        NSLog(@"数组越界了");
#endif
        return nil;
    }
    return [self wxs_objectAtIndex:index];
}

@end
