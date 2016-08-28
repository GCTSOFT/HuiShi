//
//  DataParseBaseObject.m
//  HuiShi
//
//  Created by admin on 16/8/28.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import "DataParseBaseObject.h"

@implementation DataParseBaseObject

- (void)parseWithData:(id)data
{
    
}

@end


@implementation OwnerRankDataParse

- (void)parseWithData:(id)data
{
    NSDictionary *dic = (NSDictionary *)data;
    if (![dic isKindOfClass:[NSDictionary class]]) {
        return;
    }
    self.listArray = [NSMutableArray array];
    OwnerRankTotalItem *item = [[OwnerRankTotalItem alloc] init];
    item.totalScore = [dic objectForKey:@"totalScore"];
    item.totalSort = [dic objectForKey:@"totalScore"];
    item.score = [dic objectForKey:@"score"];
    item.sort = [dic objectForKey:@"sort"];
    [self.listArray addObject:item];
    
    NSDictionary *allItems = [dic objectForKey:@"allItems"];
    if ([allItems isKindOfClass:[NSDictionary class]]) {
        NSArray *keys = [allItems allKeys];
        for (int i = 0; i < keys.count; i++) {
            NSString *key = [keys objectAtIndex:i];
            NSDictionary *di = [allItems objectForKey:key];
            OwnerRankItem *item = [[OwnerRankItem alloc] init];
            item.rid = [di objectForKey:@"id"];
            item.name = [di objectForKey:@"name"];
            item.parentid = [di objectForKey:@"parent_id"];
            item.level = [di objectForKey:@"level"];
            item.score = [di objectForKey:@"score"];
            item.weight = [di objectForKey:@"weight"];
            item.sort = [di objectForKey:@"sort"];
            item.childArray = [NSMutableArray array];
            NSArray *childs = [di objectForKey:@"childs"];
            for (int j = 0; j < childs.count; j++) {
                NSDictionary *itemDic = [childs objectAtIndex:j];
                OwnerRankItem *it = [[OwnerRankItem alloc] init];
                it.rid = [itemDic objectForKey:@"id"];
                it.name = [itemDic objectForKey:@"name"];
                it.parentid = [itemDic objectForKey:@"parent_id"];
                it.level = [itemDic objectForKey:@"level"];
                it.weight = [itemDic objectForKey:@"weight"];
                it.score = [itemDic objectForKey:@"score"];
                it.sort = [itemDic objectForKey:@"sort"];
                [item.childArray addObject:it];
            }
            [self.listArray addObject:item];
        }
    }
}

@end


@implementation TeamRankDataParse

- (void)parseWithData:(id)data
{
    NSDictionary *dic = (NSDictionary *)data;
    if (![dic isKindOfClass:[NSDictionary class]]) {
        return;
    }
    self.listArray = [NSMutableArray array];
    OwnerRankTotalItem *item = [[OwnerRankTotalItem alloc] init];
    item.totalScore = [dic objectForKey:@"avgScore"];
    item.totalSort = [dic objectForKey:@"avgSort"];
    item.score = [dic objectForKey:@"score"];
    item.sort = [dic objectForKey:@"sort"];
    [self.listArray addObject:item];
    
    NSDictionary *allItems = [dic objectForKey:@"allItems"];
    if ([allItems isKindOfClass:[NSDictionary class]]) {
        NSArray *keys = [allItems allKeys];
        for (int i = 0; i < keys.count; i++) {
            NSString *key = [keys objectAtIndex:i];
            NSDictionary *di = [allItems objectForKey:key];
            OwnerRankItem *item = [[OwnerRankItem alloc] init];
            item.rid = [di objectForKey:@"id"];
            item.name = [di objectForKey:@"name"];
            item.parentid = [di objectForKey:@"parent_id"];
            item.level = [di objectForKey:@"level"];
            item.score = [di objectForKey:@"score"];
            item.sort = [di objectForKey:@"sort"];
            item.childArray = [NSMutableArray array];
            NSArray *childs = [di objectForKey:@"childs"];
            for (int j = 0; j < childs.count; j++) {
                NSDictionary *itemDic = [childs objectAtIndex:j];
                OwnerRankItem *it = [[OwnerRankItem alloc] init];
                it.rid = [itemDic objectForKey:@"id"];
                it.name = [itemDic objectForKey:@"name"];
                it.parentid = [itemDic objectForKey:@"parent_id"];
                it.level = [itemDic objectForKey:@"level"];
                it.score = [itemDic objectForKey:@"score"];
                it.sort = [itemDic objectForKey:@"sort"];
                [item.childArray addObject:it];
            }
            [self.listArray addObject:item];
        }
    }
}

@end


@implementation SubordinateRankDataParse

- (void)parseWithData:(id)data
{
    if ([data isKindOfClass:[NSArray class]]) {
        self.listArray = [NSMutableArray array];
        NSArray *dataArray = (NSArray *)data;
        for (int i = 0; i < dataArray.count; i++) {
            NSDictionary *dic = [dataArray objectAtIndex:i];
            SubordinateItem *item = [[SubordinateItem alloc] init];
            item.uid = [dic objectForKey:@"uid"];
            item.name = [dic objectForKey:@"name"];
            item.post = [dic objectForKey:@"post"];
            item.depart = [dic objectForKey:@"depart"];
            item.region = [dic objectForKey:@"region"];
            item.score = [dic objectForKey:@"score"];
            [self.listArray addObject:item];
        }
    }
}

@end

