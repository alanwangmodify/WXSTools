//
//  UINavigationController+WXSBack.m
//  WXSTools
//
//  Created by 王小树 on 16/4/20.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import "UINavigationController+WXSBack.h"
static  NSString *backBlockKey = @"backBlockKey";
@interface UINavigationController ()

@end

@implementation UINavigationController (WXSBack)

-(BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    return self.backBlock();
    
}
-(void)setBackBlock:(WXSBackBlock)backBlock {
    objc_setAssociatedObject(self, &backBlockKey, backBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(WXSBackBlock)backBlock{
    
    return objc_getAssociatedObject(self,&backBlockKey);
    
}
@end
