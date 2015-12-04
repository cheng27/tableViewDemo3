//
//  QYFriend.h
//  03-LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 阿六. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYFriend : NSObject
//声明属性
@property (nonatomic,strong) NSString *icon;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *intro;
@property (nonatomic) BOOL vip;

//声明初始化方法
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
