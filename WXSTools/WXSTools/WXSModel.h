//
//  WXSModel.h
//  WXSRuntime
//
//  Created by 王小树 on 16/4/18.
//  Copyright © 2016年 王小树. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <objc/runtime.h>
#import <objc/message.h>

@interface WXSModel : NSObject <NSCoding>

-(instancetype)init UNAVAILABLE_ATTRIBUTE;
/**
 *  init method
 *
 *  @param dict a dictionary data
 *
 *  @return a instance ,or nil if error occur
 */
-(instancetype)initWithDic:(NSDictionary *)dict;
/**
 *  creat Model From dictionary
 *
 *  @param dict a dictionary
 */
-(void)creatModelWithDic:(NSDictionary *)dict ;
/**
 *  transform to dictionary
 *
 *  @return a dictionary ,or nil if error occur
 */

-(NSDictionary *)modelToDic;

@end
