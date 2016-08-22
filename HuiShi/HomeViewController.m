//
//  HomeViewController.m
//  HuiShi
//
//  Created by admin on 16/7/19.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import "HomeViewController.h"
#import "HSLoginViewController.h"

#import "HomeMenuItem.h"
#import "AppUserContext.h"
#import "Base64.h"

#import "HomeTableViewCell.h"

#define Cell_Gailan 0      // 概览
#define Cell_MinePaiming 1 // 我的排名
#define Cell_TotalSort 2   // 综合积分排名
#define Cell_EachSort 3    // 单项积分排名
#define Cell_MineSession 4 // 我的通知   (展开的时候)
#define Cell_Setting 5     // 选项设置   (展开的时候)

@interface HomeViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *listArray;
@property (nonatomic) NSInteger selectIndex;
@property (nonatomic) BOOL isExpand;
@property (nonatomic, strong) NSMutableArray *sourceArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    _isExpand = NO;
    _selectIndex = 0;
    self.listArray = [@[@"概览", @"我的排名", @"综合积分排名", @"单项积分排名", @"我的通知", @"选项设置"] copy];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self _setupLeftBarButtonItem];
    [self _setupRightBarButtonItem];
    AppContext.tabController.selectedIndex = 0;
    [self loadMenuPlist];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    if (!AppUContext.isLogin) {
//        HSLoginViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"HSLoginViewController"];
//        [self presentViewController:vc animated:YES completion:nil];
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeMenuItem *item = [self.listArray objectAtIndex:indexPath.row];
    if (self.selectIndex == indexPath.row) {
        item.isSelected = YES;
    }
    if (item.showType == 1) {//页面展示类型  1
        HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCell"];
        [cell setData:item];
        return cell;
    } else if (item.showType == 2) {
        HomeSubTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeSubTableViewCell"];
        [cell setData:item];
        return cell;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.listArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 点击的时候要判断
    HomeMenuItem *item = [self.listArray objectAtIndex:indexPath.row];
    [self resetAllHighlight];
    item.fItem.highlight = YES;
    if (item.canExpand) {// 支持展开
        if (item.isExpand) {// 已经展开 再次点击需要收起
            item.isExpand = NO;
            if (item.subItems.count > 0) {
                [self.listArray removeObjectsInRange:NSMakeRange(indexPath.row+1, item.subItems.count)];
            }
            self.selectIndex = indexPath.row;
            [_tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
        } else {// 未展开 点击展开
            item.isExpand = YES;
            item.highlight = YES;
            NSMutableArray *array = [NSMutableArray arrayWithArray:item.subItems];
            if (item.subItems.count > 0) {
                [self.listArray insertObjects:array atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(indexPath.row+1, array.count)]];
            }
            self.selectIndex = indexPath.row+1;
            [_tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
        }
    } else {
        if (item.fItem != nil) {
            item.fItem.highlight = YES;
        }
        self.selectIndex = indexPath.row;
        [_tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)setSelectIndex:(NSInteger)selectIndex
{
    _selectIndex = selectIndex;
    //
}

#pragma mark - private
- (void)userCenter:(UIButton *)button
{
}

- (void)_setupLeftBarButtonItem
{
    UIView *aview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 49, 49)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:aview];
    UIImageView *imgview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 49, 49)];
    [aview addSubview:imgview];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(imgview.frame.size.width+5, 0, 49, 49)];
    label.font = [UIFont systemFontOfSize:38];
    label.textColor = [UIColor redColor];
    [aview addSubview:label];
}

- (void)_setupRightBarButtonItem
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 69, 49);
    button.backgroundColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self action:@selector(userCenter:) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - private
- (void)loadMenuPlist
{
    AppUContext.userLevel = 1;// 目前写死，便于测试
    if (AppUContext.userLevel > 0) {
        self.listArray = [NSMutableArray array];
        NSString *fileName = [NSString stringWithFormat:@"Level%d", AppUContext.userLevel];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
        NSArray *array = [dic objectForKey:@"New item"];
        for (int i = 0; i < array.count; i++) {
            NSDictionary *dic = [array objectAtIndex:i];
            HomeMenuItem *item = [[HomeMenuItem alloc] init];
            item.image = [dic objectForKey:@"image"];
            item.name = [dic objectForKey:@"name"];
            item.canExpand = [[dic objectForKey:@"canexpand"] boolValue];
            item.isExpand = [[dic objectForKey:@"isexpand"] boolValue];
            item.isSelected = [[dic objectForKey:@"isselected"] boolValue];
            item.showType = [[dic objectForKey:@"showtype"] intValue];
            item.showType = 1;
            NSMutableArray *aaa = [dic objectForKey:@"subitem"];
            if (aaa.count > 0) {
                NSMutableArray *ar = [NSMutableArray array];
                for (int i = 0; i < aaa.count; i++) {
                    NSDictionary *adic = [aaa objectAtIndex:i];
                    HomeMenuItem *aitem = [[HomeMenuItem alloc] init];
                    aitem.image = [adic objectForKey:@"image"];
                    aitem.name = [adic objectForKey:@"name"];
                    aitem.canExpand = [[adic objectForKey:@"canexpand"] boolValue];
                    aitem.isExpand = [[adic objectForKey:@"isexpand"] boolValue];
                    aitem.isSelected = [[adic objectForKey:@"isselected"] boolValue];
                    aitem.showType = [[adic objectForKey:@"showtype"] intValue];
                    aitem.showType = 2;
                    aitem.fItem = item;
                    [ar addObject:aitem];
                }
                item.subItems = [NSMutableArray arrayWithArray:ar];
            }
            [self.listArray addObject:item];
        }
    }
    [_tableView reloadData];
}
//可以 递归 加载本地文件
- (void)parseObject:(HomeMenuItem *)item dicData:(NSDictionary *)dic
{
    item.image = [dic objectForKey:@"image"];
    item.name = [dic objectForKey:@"name"];
    item.canExpand = [[dic objectForKey:@"canexpand"] boolValue];
    item.isExpand = [[dic objectForKey:@"isexpand"] boolValue];
    item.isSelected = [[dic objectForKey:@"isselected"] boolValue];
    item.showType = [[dic objectForKey:@"showtype"] intValue];
    item.showType = 1;
    NSMutableArray *aaa = [dic objectForKey:@"subitem"];
    if (aaa.count > 0) {
        NSMutableArray *ar = [NSMutableArray array];
        for (int i = 0; i < aaa.count; i++) {
            NSDictionary *adic = [aaa objectAtIndex:i];
            HomeMenuItem *aitem = [[HomeMenuItem alloc] init];
            [self parseObject:aitem dicData:adic];
            aitem.fItem = item;
            [ar addObject:aitem];
        }
        item.subItems = [NSMutableArray arrayWithArray:ar];
    }
}

- (void)resetAllHighlight
{
    for (HomeMenuItem *item in self.listArray) {
        item.highlight = NO;
        item.isSelected = NO;
    }
}


@end
