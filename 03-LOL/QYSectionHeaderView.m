//
//  QYSectionHeaderView.m
//  03-LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 阿六. All rights reserved.
//

#import "QYSectionHeaderView.h"
#import "QYFriendGroup.h"

@interface QYSectionHeaderView()
@property (nonatomic,strong)UIButton *btn;
@property (nonatomic,strong)UILabel *label;
@end

@implementation QYSectionHeaderView

static NSString *headerViewIdentifier = @"headerView";

+ (instancetype)sectionHeaderViewForTableView:(UITableView *)tableView
{
    QYSectionHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewIdentifier];
    if (headerView ==nil) {
        headerView = [[QYSectionHeaderView alloc] initWithReuseIdentifier:headerViewIdentifier];
    }
    return headerView;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        //添加背景btn
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        //设置背景
        UIImage *img = [[UIImage imageNamed:@"buddy_header_bg"]resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 1) resizingMode:UIImageResizingModeStretch];
        [btn setBackgroundImage:img forState:UIControlStateNormal];
        UIImage *highlightedImg = [[UIImage imageNamed:@"buddy_header_bg_highlighted"]resizableImageWithCapInsets:UIEdgeInsetsMake(44, 1, 44, 0) resizingMode:UIImageResizingModeStretch];
        [btn setBackgroundImage:highlightedImg forState:UIControlStateHighlighted];
        //设置图标
        [btn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        //设置标题的字体颜色
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //设置内容的显示
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft ;
        //设置整体的偏移量
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        //设置标题的偏移量
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        //设置btn的图片视图的内容模式
        btn.imageView.contentMode = UIViewContentModeCenter;
        btn.imageView.clipsToBounds = NO;
        //添加事件监听
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        //添加label（在线人数/总人数）
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        label.textAlignment = NSTextAlignmentRight;
        _btn = btn;
        _label = label;
    }
    return self;
}

- (void)btnClick:(UIButton *)btn
{
    _friendGroup.isOpen = ! _friendGroup.isOpen;

    if (_headerViewClick) {
        _headerViewClick();
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    //设置btn的frame
    _btn.frame = self.bounds;
    //设置label的frame
    CGFloat labelW = 100;
    CGFloat labelH = self.bounds.size.height;
    CGFloat labelX = self.bounds.size.width - labelW - 10;
    CGFloat labelY = 0;
    _label.frame = CGRectMake(labelX, labelY, labelW, labelH);
}

- (void) setFriendGroup:(QYFriendGroup *)friendGroup
{
    _friendGroup = friendGroup;
    //设置btn的标题
    [_btn setTitle:friendGroup.name forState:UIControlStateNormal];
    _label.text = [NSString stringWithFormat:@"%ld/%ld",friendGroup.online,friendGroup.friends.count];
    
    if (_friendGroup.isOpen) {
        _btn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else
    {
        _btn.imageView.transform = CGAffineTransformIdentity;
    }
}

@end
