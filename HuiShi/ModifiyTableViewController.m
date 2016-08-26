//
//  ModifiyTableViewController.m
//  HuiShi
//
//  Created by xiemingmin on 16/8/24.
//  Copyright © 2016年 DiZiCompanyLimited. All rights reserved.
//

#import "ModifiyTableViewController.h"
#import "FooterView.h"
#import "ModifiySuccessViewController.h"
#import "AppUserContext.h"
#import "Base64.h"
@interface ModifiyTableViewController ()
@property (strong, nonatomic) IBOutlet UITableViewCell *oldPassword;

@property (strong, nonatomic) IBOutlet UITableViewCell *xinPassword;

@property (strong, nonatomic) IBOutlet UITableViewCell *surePassword;
@property (weak, nonatomic) IBOutlet UITextField *oldTextField;
@property (weak, nonatomic) IBOutlet UITextField *zinTextField;
@property (weak, nonatomic) IBOutlet UITextField *sureTextField;


@end

@implementation ModifiyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"修改密码";
    //发送请求获得旧密码数据
    NSString *str = [NSString stringWithFormat:@"%@:111111", AppUContext.token];
    NSURL *ru = [NSURL URLWithString:@"http://wyeth.api.hih6.com/score/view"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:ru];
    request.HTTPMethod = @"GET";
    [request setValue:[NSString stringWithFormat:@"Basic %@",[str base64EncodedString]] forHTTPHeaderField:@"Authorization"];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        if (data) {
            NSString *strData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//            NSLog(@"这是什么数据%@", strData);
        }else
        {
            NSLog(@"错误%@",error.userInfo);
        }
        
        }];
    [task resume];

    
}
- (void)postNewPassword
{
    NSString *str = [NSString stringWithFormat:@"%@:111111", AppUContext.token];
    NSURL *ru = [NSURL URLWithString:@"http://wyeth.api.hih6.com/score/view"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:ru];
    request.HTTPMethod = @"POST";
    [request setValue:[NSString stringWithFormat:@"Basic %@",[str base64EncodedString]] forHTTPHeaderField:@"Authorization"];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
                                  {
                                      if (data) {
                                          NSString *strData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                          NSLog(@"这是什么数据%@", strData);
                                      }else
                                      {
                                          NSLog(@"错误%@",error.userInfo);
                                      }
                                      
                                  }];
    [task resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return  self.oldPassword;
    }else if (indexPath.section == 1)
    {
        return self.xinPassword;
    }else
    {
        return self.surePassword;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
        
    }else if (section == 1)
    {
        return 1;
    }else
    {
        return 100;
    }
}

//这是分区尾
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    

    FooterView *footerView;
    
    
    if (section == 2) {
        footerView.headerIndex = section;
        footerView = [[[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:nil options:nil] lastObject];
        footerView.block= ^()
        {
            //当点击按钮的时候
            //上传新的密码
            
            //2跳转
            ModifiySuccessViewController *success =[[ ModifiySuccessViewController alloc] initWithNibName:@"ModifiySuccessViewController" bundle:nil];
            
            [self.navigationController pushViewController:success animated:YES];
        };
    }

    return footerView;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
