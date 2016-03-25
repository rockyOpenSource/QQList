//
//  ModelUser.m
//  JFList
//
//  Created by 李俊峰 on 16/2/28.
//  Copyright © 2016年 李俊峰. All rights reserved.
//

#import "ModelUser.h"

@implementation ModelUser

+ (instancetype)parsingJsonWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] parsingJsonWithDictionary:dict];
}

- (instancetype)parsingJsonWithDictionary:(NSDictionary *)dict
{
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
