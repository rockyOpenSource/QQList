//
//  JFListViewController.m
//  JFList
//
//  Created by 李俊峰 on 16/2/28.
//  Copyright © 2016年 李俊峰. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "JFListViewController.h"
#import "UserTableViewCell.h"
#import "ModelGroups.h"
#import "JFHeaderView.h"

@interface JFListViewController ()<UITableViewDataSource,UITableViewDelegate,JFHeaderViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *listArray;
@end

@implementation JFListViewController

- (NSArray *)listArray{
    if (!_listArray) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"list.plist" ofType:nil];
        NSArray * dicArr = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray * arr = [NSMutableArray array];
        for (NSDictionary *dict in dicArr) {
            ModelGroups *group = [ModelGroups parsingJsonWithDictionary:dict];
            [arr addObject:group];
        }
        _listArray = arr;
    }
    return _listArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"JFList";
    
    [self tableView];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.rowHeight = 60;
        _tableView.sectionHeaderHeight = 44;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    ModelGroups *group = self.listArray[section];
    return group.isOpen? group.groups.count:0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UserTableViewCell *cell = [UserTableViewCell userTableViewCellWithTableView:tableView];
    if (self.listArray) {
        ModelGroups *group = self.listArray[indexPath.section];
        ModelUser *user = group.groups[indexPath.row];
        cell.user = user;
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    JFHeaderView *header = [JFHeaderView jfHeadViewWithTableView:tableView];
    header.delegate = self;
    if (self.listArray) {
        ModelGroups *group = self.listArray[section];
        header.group = group;
    }
    return header;
}

- (void)jfHeaderView:(JFHeaderView *)view didButton:(UIButton *)sender
{
    [self.tableView reloadData];
}

@end