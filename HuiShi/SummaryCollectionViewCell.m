//
//  SummaryCollectionViewCell.m
//  HuiShi
//
//  Created by admin on 16/8/1.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import "SummaryCollectionViewCell.h"

@implementation SummaryCollectionViewCell

@end



@implementation SummaryMainCell


@end

@implementation SummarySubCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initialView];
    }
    return self;
}

- (void)initialView
{
    self.firstView = [[SummarySubItemView alloc] init];
    self.secondView = [[SummarySubItemView alloc] init];
    self.thirdView = [[SummarySubItemView alloc] init];
    self.firstView.tag = 0;
    self.secondView.tag = 1;
    self.thirdView.tag = 2;
    self.firstView.delegate = self;
    self.secondView.delegate = self;
    self.thirdView.delegate = self;
    [self.contentView addSubview:self.firstView];
    [self.contentView addSubview:self.thirdView];
    [self.contentView addSubview:self.secondView];
    self.firstView.translatesAutoresizingMaskIntoConstraints = NO;
    self.secondView.translatesAutoresizingMaskIntoConstraints = NO;
    self.thirdView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[V1]-10-[V2(==V1)]-10-[V3(==V1)]-24-|" options:0 metrics:0 views:@{@"V1": self.firstView,@"V2": self.secondView,@"V3": self.thirdView}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[V2]-5-|" options:0 metrics:0 views:@{@"V1": self.firstView,@"V2": self.secondView,@"V3": self.thirdView}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[V1]-5-|" options:0 metrics:0 views:@{@"V1": self.firstView,@"V2": self.secondView,@"V3": self.thirdView}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[V3]-5-|" options:0 metrics:0 views:@{@"V1": self.firstView,@"V2": self.secondView,@"V3": self.thirdView}]];
}

- (void)setdata:(id)data
{
    
}

- (void)summaryButtonClick:(SummarySubItemView *)view
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(summaryView:selectedAtIndex:)]) {
        [self.delegate summaryView:self selectedAtIndex:view.tag];
    }
}

@end


@interface SummarySubItemView ()

@property (nonatomic, strong) UIImageView *fenImageView;
@property (nonatomic, strong) UIImageView *paimingImageView;
@property (nonatomic, strong) UIButton *button;

@end

@implementation SummarySubItemView 

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialView];
    }
    return self;
}

- (void)setData:(id)data
{
    
}

- (void)buttonClick:(UIButton *)button
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(summaryButtonClick:)]) {
        [self.delegate summaryButtonClick:self];
    }
}

- (void)initialView
{
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    self.button.layer.cornerRadius = 5;
    self.button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.button.layer.borderWidth = .5;
    self.button.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.button];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[V2]-5-|" options:0 metrics:0 views:@{@"V2": self.button}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[V2]-5-|" options:0 metrics:0 views:@{@"V2": self.button}]];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.titleLabel.text = @"KPI执行";
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.titleLabel];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[V2(==120)]" options:0 metrics:0 views:@{@"V2": self.titleLabel}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[V2(==25)]" options:0 metrics:0 views:@{@"V2": self.titleLabel}]];
    
    self.fenImageView = [[UIImageView alloc] init];
    self.fenImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.fenImageView.image = [UIImage imageNamed:@"fen1"];
    [self addSubview:self.fenImageView];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[V2(==25)]" options:0 metrics:0 views:@{@"V2": self.fenImageView}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[V2(==25)]-20-|" options:0 metrics:0 views:@{@"V2": self.fenImageView}]];
    
    self.fenLabel = [[UILabel alloc] init];
    self.fenLabel.textColor = [UIColor blueColor];
    self.fenLabel.text = @"10";
    self.fenLabel.font = [UIFont systemFontOfSize:30];
    self.fenLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.fenLabel];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[V2(==40)]" options:0 metrics:0 views:@{@"V2": self.fenLabel}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[V2(==40)]-15-|" options:0 metrics:0 views:@{@"V2": self.fenLabel}]];
    
    self.paimingImageView = [[UIImageView alloc] init];
    self.paimingImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.paimingImageView.image = [UIImage imageNamed:@"paiming1"];
    [self addSubview:self.paimingImageView];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-120-[V2(==25)]" options:0 metrics:0 views:@{@"V2": self.paimingImageView}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[V2(==25)]-15-|" options:0 metrics:0 views:@{@"V2": self.paimingImageView}]];
    
    self.paimingLabel = [[UILabel alloc] init];
    self.paimingLabel.textColor = [UIColor blueColor];
    self.paimingLabel.text = @"8";
    self.paimingLabel.font = [UIFont systemFontOfSize:30];
    self.paimingLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.paimingLabel];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-150-[V2(==40)]" options:0 metrics:0 views:@{@"V2": self.paimingLabel}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[V2(==40)]-15-|" options:0 metrics:0 views:@{@"V2": self.paimingLabel}]];

}


@end