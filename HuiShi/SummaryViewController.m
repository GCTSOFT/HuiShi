//
//  SummaryViewController.m
//  HuiShi
//
//  Created by admin on 16/7/19.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import "SummaryViewController.h"
#import "SummaryCollectionViewCell.h"
#import "CLRefresh.h"

@interface SummaryViewController ()<UITableViewDelegate, UITableViewDataSource, SummaryViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *viewHistory;
@property (strong, nonatomic) NSMutableArray *listArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SummaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.listArray = [@[@"10",@"5",@"8",@"6",@"4",@"1",@"8"] copy];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.viewHistory.layer.borderWidth = .5;
    self.viewHistory.layer.cornerRadius = 5.;
    self.viewHistory.layer.borderColor = [UIColor blackColor].CGColor;
    [self.viewHistory setTitle:@"2016年4月" forState:UIControlStateNormal];
//    [self.tableView addHeaderWithRefreshHandler:^(RefreshBaseView *refreshView) {
//        // 下啦刷新
//    }];
//    [self.tableView addFooterWithRefreshHandler:^(RefreshBaseView *refreshView) {
//        // 上啦加载
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        SummaryMainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SummaryMainCell"];
        return cell;
    } else {
        SummarySubCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SummarySubCell"];
        if (cell == nil) {
            cell = [[SummarySubCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SummarySubCell"];
        }
        cell.delegate = self;
        return cell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 122
        ;
    } else {
        return 134;
    }
}

#pragma mark - SummaryViewDelegate
- (void)summaryView:(SummarySubCell *)view selectedAtIndex:(int)index
{
    if (1) {//kpi考核项还有子项的时候  弹出某个controller
        
    }
}


@end
