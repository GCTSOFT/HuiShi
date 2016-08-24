//
//  SummaryCollectionViewCell.h
//  HuiShi
//
//  Created by admin on 16/8/1.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SummarySubItemView;

@interface SummaryCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *scroeLabel;
@property (strong, nonatomic) IBOutlet UILabel *sortLabel;
@property (strong, nonatomic) IBOutlet UIView *bgView;

@end


@interface SummaryMainCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *fenLabel;
@property (strong, nonatomic) IBOutlet UILabel *paimingLabel;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIView *bgView;

@end

@interface SummarySubCell : UITableViewCell

@property (strong, nonatomic) SummarySubItemView *firstView;
@property (strong, nonatomic) SummarySubItemView *secondView;
@property (strong, nonatomic) SummarySubItemView *thirdView;

- (void)setdata:(id)data;

@end

@interface SummarySubItemView : UIView

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *fenLabel;
@property (strong, nonatomic) UILabel *paimingLabel;

- (void)setData:(id)data;

@end



