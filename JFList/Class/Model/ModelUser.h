//
//  ModelUser.h
//  JFList
//
//  Created by 李俊峰 on 16/2/28.
//  Copyright © 2016年 李俊峰. All rights reserved.
//

#import "ModelBase.h"

@interface ModelUser : ModelBase

@property (nonatomic, copy)NSString * icon;
@property (nonatomic, copy)NSString * intro;
@property (nonatomic, copy)NSString * name;
@property (nonatomic, assign)NSInteger vip;

+ (instancetype)parsingJsonWithDictionary:(NSDictionary *)dict;
- (instancetype)parsingJsonWithDictionary:(NSDictionary *)dict;

@end
/*
 icon = "006.png";
 intro = "\U6211\U7684\U597d\U53cb\U597d\U53cb-9\U7684\U4e2a\U6027\U7b7e\U540d\U5c31\U662f\U8fd9\U4e48\U62fd";
 name = "\U6211\U7684\U597d\U53cb\U597d\U53cb-9";
 vip = 0;
 */