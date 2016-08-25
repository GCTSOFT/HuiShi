//
//  PopBackView.h
//  HuiShi
//
//  Created by admin on 16/8/25.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kPopBackViewTag 1000000

@protocol PopBackViewDelegate <NSObject>

- (void)touchBgView:(UIView *)backView;

@end

@interface PopBackView : UIView

@property (nonatomic, assign) id<PopBackViewDelegate>delegate;

@end
