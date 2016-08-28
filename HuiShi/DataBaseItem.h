//
//  DataBaseItem.h
//  HuiShi
//
//  Created by admin on 16/8/28.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBaseItem : NSObject

@end


@interface OwnerRankTotalItem : NSObject

@property (nonatomic, strong) NSString *totalScore;
@property (nonatomic, strong) NSString *totalSort;
@property (nonatomic, strong) NSMutableArray *listArray;
@property (nonatomic, strong) NSString *score;
@property (nonatomic, strong) NSString *sort;

@end

@interface OwnerRankItem : NSObject

@property (nonatomic, strong) NSString *rid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *parentid;
@property (nonatomic, strong) NSString *level;
@property (nonatomic, strong) NSString *weight;
@property (nonatomic, strong) NSString *score;
@property (nonatomic, strong) NSString *sort;
@property (nonatomic, strong) NSMutableArray *childArray;

@end


@interface SubordinateItem : NSObject

@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *post;
@property (nonatomic, strong) NSString *depart;
@property (nonatomic, strong) NSString *region;
@property (nonatomic, strong) NSString *score;

@end

