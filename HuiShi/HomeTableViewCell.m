//
//  HomeTableViewCell.m
//  HuiShi
//
//  Created by admin on 16/7/19.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "HomeMenuItem.h"
#import "UIColor+Extend.h"

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentView.backgroundColor = [UIColor colorWithHex:0x312C2C];
    self.backgroundColor = [UIColor colorWithHex:0x312C2C];
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    view.backgroundColor = [UIColor clearColor];
    self.selectedBackgroundView = view;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setData:(id)data
{
    if ([data isKindOfClass:[HomeMenuItem class]]) {
        HomeMenuItem *item = (HomeMenuItem *)data;
        // 界面填充
        self.ThirdImageView.hidden = YES;
        self.TitleLable.text = item.name;
        if (item.canExpand) {
            self.SecondImageView.hidden = NO;
            if (item.isExpand) {// 减号
                self.SecondImageView.image = [UIImage imageNamed:@"home_kai"];
            } else {// 加号
                self.SecondImageView.image = nil;
            }
        } else {
            self.SecondImageView.hidden = YES;
        }
        if (item.highlight || item.isSelected) {
            self.TitleLable.textColor = [UIColor whiteColor];
            self.FirstImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", item.image]];
            if (item.isSelected == YES) {
//                self.backgroudImageView = 
            } else {
                
            }
        } else {
            self.TitleLable.textColor = [UIColor colorWithHex:0xAAAAAA];
            self.FirstImageView.image = [UIImage imageNamed:item.image];
        }
    }
}

@end



@implementation HomeSubTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    view.backgroundColor = [UIColor clearColor];
    self.selectedBackgroundView = view;
}

- (void)setData:(id)data
{
    if ([data isKindOfClass:[HomeMenuItem class]]) {
        HomeMenuItem *item = (HomeMenuItem *)data;
        // 界面填充
        if (item.highlight || item.isSelected) {
            self.backgroundImageView.image = [UIImage imageNamed:@"home_subselected"];
        } else {
            self.backgroundImageView.image = nil;
        }
        self.TitleLable.textColor = [UIColor whiteColor];
        [self.contentView bringSubviewToFront:_TitleLable];
        self.TitleLable.text = item.name;
    }
}

@end