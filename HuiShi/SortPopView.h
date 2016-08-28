//
//  SortPopView.h
//  HuiShi
//
//  Created by admin on 16/8/27.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SortPopView;

@protocol SortPopDelegate <NSObject>

- (void)submanagerPop:(SortPopView *)view data:(id)data;

@end

@interface SortPopView : UIView

@property (nonatomic, assign) id<SortPopDelegate> delegate;

- (id)initWithFrame:(CGRect)frame data:(id)data;

- (void)show;

- (void)dismiss;

@end

@interface paimingItemCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *selectImageView;
@property (nonatomic, strong) UIImageView *arrawImageView;
@property (nonatomic, strong) UIButton *bgButton;

- (void)setData:(id)data;

@end