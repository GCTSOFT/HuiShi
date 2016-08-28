//
//  SummaryCollectionViewCell.h
//  HuiShi
//
//  Created by admin on 16/8/1.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SummarySubItemView;
@class SummarySubCell;

@protocol SummarySubViewDelegate <NSObject>

- (void)summaryButtonClick:(SummarySubItemView *)view;

@end

@protocol SummaryViewDelegate <NSObject>

- (void)summaryView:(SummarySubCell *)view selectedAtIndex:(int)index;

@end


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

@interface SummarySubCell : UITableViewCell<SummarySubViewDelegate>

@property (strong, nonatomic) SummarySubItemView *firstView;
@property (strong, nonatomic) SummarySubItemView *secondView;
@property (strong, nonatomic) SummarySubItemView *thirdView;

@property (nonatomic, assign) id<SummaryViewDelegate>delegate;

- (void)setdata:(id)data;

@end

@interface SummarySubItemView : UIView

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *fenLabel;
@property (strong, nonatomic) UILabel *paimingLabel;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIImageView *arrowImageView;

@property (nonatomic, assign) id<SummarySubViewDelegate>delegate;

- (void)setData:(id)data;

@end


@interface SubManagerItemView : SummarySubItemView


@end



