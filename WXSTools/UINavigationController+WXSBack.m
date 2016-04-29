//
//  UINavigationController+WXSBack.m
//  WXSTools
//
//  Created by 王小树 on 16/4/20.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import "UINavigationController+WXSBack.h"

@interface UINavigationController ()

@end

@implementation UINavigationController (WXSBack)
-(BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    return YES;
}
-(void)setBackBlock:(WXSBackBlock)backBlock {
    
}
@end
