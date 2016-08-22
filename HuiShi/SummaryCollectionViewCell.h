//
//  SummaryCollectionViewCell.h
//  HuiShi
//
//  Created by admin on 16/8/1.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SummaryCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *scroeLabel;
@property (strong, nonatomic) IBOutlet UILabel *sortLabel;
@property (strong, nonatomic) IBOutlet UIView *bgView;

@end
