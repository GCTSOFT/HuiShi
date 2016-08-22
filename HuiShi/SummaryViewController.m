//
//  SummaryViewController.m
//  HuiShi
//
//  Created by admin on 16/7/19.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import "SummaryViewController.h"
#import "SummaryCollectionViewCell.h"

@interface SummaryViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UIButton *viewHistory;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *listArray;

@end

@implementation SummaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.listArray = [@[@"10",@"5",@"8",@"6",@"4",@"1",@"8"] copy];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.listArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"summarycollectionviewcell";
    SummaryCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
//    cell.bgView.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    cell.bgView.layer.borderWidth = 1.;
    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.layer.borderWidth = 1.;
    cell.titleLabel.text = @"综合积分";
    cell.scroeLabel.text = [self.listArray objectAtIndex:indexPath.row];
    cell.sortLabel.text = [self.listArray objectAtIndex:indexPath.row];
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
