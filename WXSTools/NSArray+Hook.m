//
//  NSArray+Hook.m
//  WXSTools
//
//  Created by 王小树 on 16/5/10.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import "NSArray+Hook.h"

@implementation NSArray (Hook)
+(void)load{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
         
            Method m1 = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(objectAtIndex:));
            Method m2 = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(My_objectAtIndex:));
            
            BOOL isAdd = class_addMethod([self class], @selector(objectAtIndex:), method_getImplementation(m2), method_getTypeEncoding(m2));
            if (isAdd == YES) {
                
                class_replaceMethod([self class], @selector(My_objectAtIndex:), method_getImplementation(m1), method_getTypeEncoding(m1));
                
            }else{
                method_exchangeImplementations(m1, m2);
            }

        }
        
    });
    
    
}

-(id)My_objectAtIndex:(NSUInteger)index{
    
    if (self.count <= index) {
        
#if DEBUG
        NSLog(@"数组越界了");
#endif
        return nil;
    }
    
    NSLog(@"exchange");
    return [self My_objectAtIndex:index];
}


@end
