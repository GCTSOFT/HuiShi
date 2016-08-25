//
//  SubManagerPopView.h
//  HuiShi
//
//  Created by admin on 16/8/25.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SubManagerPopView;

@protocol SubManagerPopDelegate <NSObject>

- (void)submanagerPop:(SubManagerPopView *)view data:(id)data;

@end

@interface SubManagerPopView : UIView

@property (nonatomic, assign) id<SubManagerPopDelegate> delegate;

- (id)initWithFrame:(CGRect)frame data:(id)data;

- (void)show;

- (void)dismiss;

@end
