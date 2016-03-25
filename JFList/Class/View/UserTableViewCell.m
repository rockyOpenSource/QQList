//
//  UserTableViewCell.m
//  JFList
//
//  Created by 李俊峰 on 16/2/28.
//  Copyright © 2016年 李俊峰. All rights reserved.
//  60

#import "UserTableViewCell.h"

@implementation UserTableViewCell

+ (instancetype)userTableViewCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"UserTableViewCell";
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UserTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIView * _line = [[UIView alloc] initWithFrame:CGRectMake(60, 60-0.5, [UIScreen mainScreen].bounds.size.width-60, 0.5)];
        _line.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
        [self.contentView addSubview:_line];

    }
    return self;
}

- (void)setUser:(ModelUser *)user
{
    _user = user;
    if (_user) {
        self.name.text = _user.name;
        self.name.textColor=_user.vip==1?[UIColor redColor]:[UIColor blackColor];
        
        self.intro.text = _user.intro;
        
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg",_user.icon];
        self.icon.image = [UIImage imageNamed:imageName];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat space = 5.0;
    CGFloat cellW = self.contentView.frame.size.width;
    CGFloat cellH = self.contentView.frame.size.height;
    CGFloat iconW = cellH-space*2;
    
    self.icon.frame = CGRectMake(space, space, iconW, iconW);
    self.name.frame = CGRectMake(CGRectGetMaxX(self.icon.frame)+10, space, cellW/2.5, iconW/2.0);
    self.intro.frame = CGRectMake(CGRectGetMaxX(self.icon.frame)+10, CGRectGetMaxY(self.name.frame), cellW/1.5, iconW/2.0);
}

- (UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc]init];
        _name.font = [UIFont systemFontOfSize:15.0];
        _name.textAlignment = NSTextAlignmentLeft;
        _name.textColor = [UIColor blackColor];
        [self.contentView addSubview:_name];
    }
    return _name;
}

- (UIImageView *)icon{
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.image = [UIImage imageNamed:@""];
        [self.contentView addSubview:_icon];
    }
    return _icon;
}

- (UILabel *)intro{
    if (!_intro) {
        _intro = [[UILabel alloc] init];
        _intro.font = [UIFont systemFontOfSize:13.0];
        _intro.textAlignment = NSTextAlignmentLeft;
        _intro.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_intro];
    }
    return _intro;
}
@end
