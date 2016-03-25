//
//  JFHeaderView.h
//  JFList
//
//  Created by 李俊峰 on 16/2/28.
//  Copyright © 2016年 李俊峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelGroups.h"
@class JFHeaderView;

@protocol JFHeaderViewDelegate <NSObject>
- (void)jfHeaderView:(JFHeaderView *)view didButton:(UIButton *)sender;
@end

@interface JFHeaderView : UITableViewHeaderFooterView

+(JFHeaderView *)jfHeadViewWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) ModelGroups *group;
@property (nonatomic, weak) id <JFHeaderViewDelegate>delegate;
@end
