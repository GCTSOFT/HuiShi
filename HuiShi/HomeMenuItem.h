//
//  HomeMenuItem.h
//  HuiShi
//
//  Created by admin on 16/8/17.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeMenuItem : NSObject

@property (nonatomic, strong) NSString *image;//图片
@property (nonatomic, strong) NSString *name;//名称
@property (nonatomic, assign) BOOL canExpand;//是否支持展开
@property (nonatomic, assign) BOOL isExpand;//是否展开
@property (nonatomic, assign) BOOL isSelected;//是否选中
@property (nonatomic, strong) NSArray *subItems;//展开项
@property (nonatomic, assign) int showType;//展示类型
@property (nonatomic, assign) BOOL highlight;

@property (nonatomic, assign) HomeMenuItem *fItem;//父项

@end
