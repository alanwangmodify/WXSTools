//
//  UINavigationController+WXSBack.h
//  WXSTools
//
//  Created by 王小树 on 16/4/20.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/message.h>
#import <objc/runtime.h>

typedef NS_ENUM(NSInteger,WXSBackType){
    WXSBackTypeShouldBack,
    WXSBackTypeDidBack,
};
typedef BOOL (^WXSBackBlock)();
@interface UINavigationController (WXSBack)<UIGestureRecognizerDelegate,UINavigationBarDelegate>

@property (nonatomic,copy) WXSBackBlock backBlock;

@end
