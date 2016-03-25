//
//  JFHeaderView.m
//  JFList
//
//  Created by 李俊峰 on 16/2/28.
//  Copyright © 2016年 李俊峰. All rights reserved.
//

#import "JFHeaderView.h"

@interface JFHeaderView ()

@property(nonatomic, strong) UILabel * label;
@property(nonatomic, strong) UILabel * labelNum;
@property(nonatomic, strong) UIButton * button;
@property (nonatomic, strong) UIImageView *imageArrow;
@end

@implementation JFHeaderView

+ (JFHeaderView *)jfHeadViewWithTableView:(UITableView *)tableView
{
    static NSString * JFHeaderViewID = @"JFHeaderView";
    JFHeaderView * headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:JFHeaderViewID];
    if (headView == nil) {
        headView = [[JFHeaderView alloc]initWithReuseIdentifier:JFHeaderViewID];
        headView.contentView.backgroundColor = [UIColor whiteColor];
    }
    return headView;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIView * _line = [[UIView alloc] initWithFrame:CGRectMake(0, 44-0.5, [UIScreen mainScreen].bounds.size.width, 0.5)];
        _line.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
        [self.contentView addSubview:_line];

    }
    return self;
}

- (void)setGroup:(ModelGroups *)group
{
    _group = group;
    if (_group) {
        self.label.text = _group.name;
        self.labelNum.text = [NSString stringWithFormat:@"%ld/%ld",(long)_group.online,(long)_group.groups.count];
        [self setArrowImageViewWithIfUnfold:self.group.isOpen];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageArrow.frame = CGRectMake(10, (self.frame.size.height-9)/2.0, 14, 9);
    self.label.frame = CGRectMake(CGRectGetMaxX(self.imageArrow.frame)+10, 0, 100, self.frame.size.height);
    self.button.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.labelNum.frame = CGRectMake(self.frame.size.width-50, 0, 40, self.frame.size.height);
    
}

- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.font = [UIFont systemFontOfSize:14.0];
        _label.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_label];
    }
    return _label;
}

- (UILabel *)labelNum{
    if (!_labelNum) {
        _labelNum = [[UILabel alloc]init];
        _labelNum.font = [UIFont systemFontOfSize:12.0];
        _labelNum.textAlignment = NSTextAlignmentRight;
        _labelNum.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_labelNum];
    }
    return _labelNum;
}

- (UIButton *)button{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_button];
    }
    return _button;
}

- (UIImageView *)imageArrow{
    if (!_imageArrow) {
        _imageArrow = [[UIImageView alloc] init];
        _imageArrow.image = [UIImage imageNamed:@"account_arrows"];
        [self.contentView addSubview:_imageArrow];
    }
    return _imageArrow;
}

-(void)buttonClick:(UIButton *)sender
{
    self.group.isOpen =! self.group.isOpen;
    
    if ([self.delegate respondsToSelector:@selector(jfHeaderView:didButton:)]) {
        [self.delegate jfHeaderView:self didButton:sender];
    }
}
/**
 *   设置图片箭头旋转
 */
-(void)setArrowImageViewWithIfUnfold:(BOOL)unfold
{
    double degree;
    if(unfold){
        degree = M_PI;
    } else {
        degree = 0;
    }
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.imageArrow.layer.transform = CATransform3DMakeRotation(degree, 0, 0, 1);
    } completion:NULL];
}

@end
