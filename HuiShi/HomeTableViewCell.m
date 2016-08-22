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
        self.TitleLable.text = item.name;
        if (item.canExpand) {
            self.SecondImageView.hidden = NO;
            if (item.isExpand) {// 减号
//                self.SecondImageView.image = 
            } else {// 加号
//                self.SecondImageView.image =
            }
        } else {
            self.SecondImageView.hidden = YES;
        }
        if (item.highlight || item.isSelected) {
            self.ThirdImageView.hidden = NO;
            self.TitleLable.textColor = [UIColor colorWithHex:0x006DDF];
            self.FirstImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_highlight", item.image]];
        } else {
            self.ThirdImageView.hidden = YES;
            self.TitleLable.textColor = [UIColor blackColor];
            self.FirstImageView.image = [UIImage imageNamed:item.image];
        }
    }
}

@end



@implementation HomeSubTableViewCell

- (void)setData:(id)data
{
    if ([data isKindOfClass:[HomeMenuItem class]]) {
        HomeMenuItem *item = (HomeMenuItem *)data;
        // 界面填充
        self.TitleLable.text = item.name;
        if (item.highlight || item.isSelected) {
            self.TitleLable.textColor = [UIColor colorWithHex:0x006DDF];
        } else {
            self.TitleLable.textColor = [UIColor blackColor];
        }
    }
}

@end