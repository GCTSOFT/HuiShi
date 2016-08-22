//
//  HomeTableViewCell.h
//  HuiShi
//
//  Created by admin on 16/7/19.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *FirstImageView;
@property (strong, nonatomic) IBOutlet UIImageView *SecondImageView;
@property (strong, nonatomic) IBOutlet UILabel *TitleLable;
@property (strong, nonatomic) IBOutlet UIImageView *ThirdImageView;
@property (strong, nonatomic) IBOutlet UIImageView *backgroudImageView;

- (void)setData:(id)data;

@end


@interface HomeSubTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *TitleLable;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

- (void)setData:(id)data;

@end