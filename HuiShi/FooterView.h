//
//  FooterView.h
//  HuiShi
//
//  Created by xiemingmin on 16/8/24.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^FooterViewBlock)();

@interface FooterView : UIView

@property (nonatomic,copy) FooterViewBlock block;
@property (nonatomic,assign) NSInteger headerIndex;
@end
