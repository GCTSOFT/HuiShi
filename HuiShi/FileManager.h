//
//  FileManager.h
//  HuiShi
//
//  Created by admin on 16/8/29.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface FileManager : NSObject




@end





@interface FileManager (AccessData)

// 加载我的积分数据
- (NSMutableArray *)loadMinePointDataWithDepart:(NSString *)depart dateString:(NSString *)dateString;

- (void)saveMinePointDataWithDepart:(NSString *)depart dateString:(NSString *)dateString;

@end






