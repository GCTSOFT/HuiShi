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

@interface SummaryViewController ()<UITableViewDelegate, UITableViewDataSource>

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
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.viewHistory.layer.borderWidth = .5;
    self.viewHistory.layer.cornerRadius = 5.;
    self.viewHistory.layer.borderColor = [UIColor blueColor].CGColor;
    [self.viewHistory setTitle:@"2016年4月" forState:UIControlStateNormal];
    [self.tableView addHeaderWithRefreshHandler:^(RefreshBaseView *refreshView) {
        // 下啦刷新
    }];
    [self.tableView addFooterWithRefreshHandler:^(RefreshBaseView *refreshView) {
        // 上啦加载
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        SummaryMainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SummaryMainCell"];
        cell.bgView.layer.cornerRadius = 5;
        cell.bgView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        cell.bgView.layer.borderWidth = .5;
        cell.contentView.backgroundColor = [UIColor lightGrayColor];
        return cell;
    } else {
        SummarySubCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SummarySubCell"];
        if (cell == nil) {
            cell = [[SummarySubCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SummarySubCell"];
        }
        cell.contentView.backgroundColor = [UIColor lightGrayColor];
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
        return 90;
    } else {
        return 150;
    }
}



//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    return self.listArray.count;
//}
//
//// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString * CellIdentifier = @"summarycollectionviewcell";
//    SummaryCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
////    cell.bgView.layer.borderColor = [UIColor lightGrayColor].CGColor;
////    cell.bgView.layer.borderWidth = 1.;
//    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    cell.layer.borderWidth = 1.;
//    cell.titleLabel.text = @"综合积分";
//    cell.scroeLabel.text = [self.listArray objectAtIndex:indexPath.row];
//    cell.sortLabel.text = [self.listArray objectAtIndex:indexPath.row];
//    return cell;
//}
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/

@end
