//
//  QYFriendGroup.h
//  03-LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 阿六. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYFriendGroup : NSObject
@property (nonatomic,strong) NSArray *friends;
@property (nonatomic,strong) NSString *name;
@property (nonatomic) NSInteger online;
@property (nonatomic)BOOL isOpen;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)friendGroupWithDict:(NSDictionary *)dict;

@end
