//
//  UserTableViewCell.h
//  JFList
//
//  Created by 李俊峰 on 16/2/28.
//  Copyright © 2016年 李俊峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelUser.h"

@interface UserTableViewCell : UITableViewCell
+ (instancetype)userTableViewCellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong)UIImageView * icon;
@property (nonatomic, strong)UILabel * intro;
@property (nonatomic, strong)UILabel * name;
@property (nonatomic, strong)UILabel * vip;

@property (nonatomic, strong) ModelUser *user;
@end