//
//  SubManagerPopView.m
//  HuiShi
//
//  Created by admin on 16/8/25.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import "SubManagerPopView.h"
#import "PopBackView.h"
#import "CommonDefine.h"
#import "SummaryCollectionViewCell.h"

//SummarySubItemView
@interface SubManagerPopView ()<UITableViewDelegate, UITableViewDataSource, SummarySubViewDelegate, PopBackViewDelegate>
{
    UILabel *_titleLabel;
    UITableView *_tableView;
}

@property (nonatomic, strong) NSMutableArray *listArray;

@end

@implementation SubManagerPopView

- (id)initWithFrame:(CGRect)frame data:(id)data
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialView];
    }
    return self;
}

- (void)initialView
{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 64)];
    bgView.translatesAutoresizingMaskIntoConstraints = 0;
    bgView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:bgView];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[V1]-0-|" options:0 metrics:0 views:@{@"V1": bgView}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[V1(64)]" options:0 metrics:0 views:@{@"V1": bgView}]];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = @"项目管理";
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:36];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [bgView addSubview:_titleLabel];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[V1]-0-|" options:0 metrics:0 views:@{@"V1": _titleLabel}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[V1]-0-]" options:0 metrics:0 views:@{@"V1": _titleLabel}]];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.separatorColor = [UIColor clearColor];
    [self addSubview:_tableView];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[V1]-0-|" options:0 metrics:0 views:@{@"V1": _tableView}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-64-[V1]-0-]" options:0 metrics:0 views:@{@"V1": _tableView}]];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *stri = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:stri];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stri];
        SummarySubItemView *itemView = [[SummarySubItemView alloc] init];
        itemView.translatesAutoresizingMaskIntoConstraints = NO;
        itemView.tag = 101;
        [cell.contentView addSubview:itemView];
        [cell.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[V1]-0-|" options:0 metrics:0 views:@{@"V1": itemView}]];
        [cell.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[V1]-0-]" options:0 metrics:0 views:@{@"V1": itemView}]];
    }
    SummarySubItemView *itemView = [cell.contentView viewWithTag:101];
    itemView.delegate = self;
    [itemView setData:nil];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArray.count;
}

#pragma mark - SummarySubViewDelegate
- (void)summaryButtonClick:(SummarySubItemView *)view
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(submanagerPop:data:)]) {
        [self.delegate submanagerPop:self data:nil];
    }
    [self dismiss];
}

#pragma mark - public
- (void)show
{
    UIWindow *wind = AppContext.appdelegate.window;
    PopBackView *bgView = [[PopBackView alloc] initWithFrame:wind.bounds];
    bgView.delegate = self;
    bgView.tag = kPopBackViewTag;
    bgView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
    [wind addSubview:bgView];
    self.tag = 131;
    [bgView addSubview:self];
}

- (void)dismiss
{
    PopBackView *bgView = [AppContext.appdelegate.window viewWithTag:kPopBackViewTag];
    [UIView animateWithDuration:.4 animations:^{
        bgView.alpha  = .5;
    } completion:^(BOOL finished) {
        bgView.delegate = nil;
        [bgView removeFromSuperview];
    }];
}

@end
