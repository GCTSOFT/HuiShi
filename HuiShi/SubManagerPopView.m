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


@interface SubManagerPopView ()<UITableViewDelegate, UITableViewDataSource, SummarySubViewDelegate, PopBackViewDelegate>
{
    UILabel *_titleLabel;
    UITableView *_tableView;
    UIButton *_closeButton;
}

@property (nonatomic, strong) NSMutableArray *listArray;
@property (nonatomic, assign) CGRect fr;

@end

@implementation SubManagerPopView

- (id)initWithFrame:(CGRect)frame data:(id)data
{
    self = [super initWithFrame:frame];
    if (self) {
        self.fr = frame;
        [self initialView];
    }
    return self;
}

- (void)initialView
{
    self.layer.cornerRadius = 10.;
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.borderWidth = .5;
    self.clipsToBounds = YES;
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 64)];
    bgView.translatesAutoresizingMaskIntoConstraints = 0;
    bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bgView];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[V1]-0-|" options:0 metrics:0 views:@{@"V1": bgView}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[V1(64)]" options:0 metrics:0 views:@{@"V1": bgView}]];
    
    UIView *sepView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 64)];
    sepView.translatesAutoresizingMaskIntoConstraints = 0;
    sepView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:sepView];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[V1]-0-|" options:0 metrics:0 views:@{@"V1": sepView}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-63-[V1(1)]" options:0 metrics:0 views:@{@"V1": sepView}]];
    
    _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_closeButton setImage:[UIImage imageNamed:@"pop_close"] forState:UIControlStateNormal];
    _closeButton.translatesAutoresizingMaskIntoConstraints = NO;
    [bgView addSubview:_closeButton];
    [bgView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[V1(23)]-15-|" options:0 metrics:0 views:@{@"V1": _closeButton}]];
    [bgView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[V1(23)]" options:0 metrics:0 views:@{@"V1": _closeButton}]];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = @"项目管理";
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:18];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [bgView addSubview:_titleLabel];
    [bgView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[V1]-0-|" options:0 metrics:0 views:@{@"V1": _titleLabel}]];
    [bgView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[V1]-0-|" options:0 metrics:0 views:@{@"V1": _titleLabel}]];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.separatorColor = [UIColor clearColor];
    [self addSubview:_tableView];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[V1]-1-|" options:0 metrics:0 views:@{@"V1": _tableView}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-64-[V1]-0-|" options:0 metrics:0 views:@{@"V1": _tableView}]];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *stri = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:stri];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stri];
        SubManagerItemView *itemView = [[SubManagerItemView alloc] init];
        itemView.translatesAutoresizingMaskIntoConstraints = NO;
        itemView.tag = 101;
        [cell.contentView addSubview:itemView];
        [cell.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[V1(222)]" options:0 metrics:0 views:@{@"V1": itemView}]];
        [cell.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[V1(138)]" options:0 metrics:0 views:@{@"V1": itemView}]];
        
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:itemView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        [cell.contentView addConstraint:[NSLayoutConstraint constraintWithItem:itemView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    }
    SubManagerItemView *itemView = [cell.contentView viewWithTag:101];
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

#pragma mark - PopBackViewDelegate
- (void)touchBgView:(UIView *)backView
{
    [self dismiss];
}

#pragma mark - public
- (void)show
{
    self.fr = CGRectMake(357, 155, 619/2., 854/2.);
    self.frame = self.fr;
    UIWindow *wind = AppContext.appdelegate.window;
    PopBackView *bgView = [[PopBackView alloc] initWithFrame:wind.bounds];
    bgView.delegate = self;
    bgView.tag = kPopBackViewTag;
    bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.6];
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
