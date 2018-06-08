//
//  ViewController.m
//  DemoApp
//
//  Created by Shyam Parmar on 28/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

#import "ViewController.h"
#import "ListViewModel.h"
#import "ListViewTableViewCell.h"
#import "DetailsViewController.h"
#import "DetailsViewModel.h"

@interface ViewController ()
@property (nonatomic,strong) ListViewModel *viewModel;
@end

@implementation ViewController
@synthesize tblJobList;
- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.viewModel = [[ListViewModel alloc] init];
  //set uitableview properties
  self.tblJobList.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
  self.tblJobList.rowHeight = UITableViewAutomaticDimension;
  self.tblJobList.estimatedRowHeight = 30;
  self.tblJobList.layoutMargins = UIEdgeInsetsZero;
  [self requestToViewModel];
}
// Actual request for data to Viewmodel
-(void)requestToViewModel {
  [self.viewModel requestJobList:^(BOOL isSuccess, NSError *error) {
    NSLog(@"Received response");
    if (isSuccess == true) {
      //Reload Table
      dispatch_async(dispatch_get_main_queue(),
                     ^{
                       [self.tblJobList reloadData];
                     });
    } else {
      [self handleError:error];
    }
  }];
}
// Error Handling
-(void)handleError:(NSError *)error {
  NSString *title = error.domain;
  NSString *message = error.localizedDescription;
  
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                 message:message preferredStyle:UIAlertControllerStyleAlert];
  UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleCancel handler:nil];
  UIAlertAction *retryAction = [UIAlertAction actionWithTitle:@"Retry"
                                                        style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
      [self requestToViewModel];
  }];
  [alert addAction:okAction];
  [alert addAction:retryAction];
  [self.navigationController presentViewController:alert animated:true completion:nil];
}
- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - UITableview Methods

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  static NSString *cellIdentifier = @"JobListCell";
  ListViewTableViewCell *cell = [tableView
                                 dequeueReusableCellWithIdentifier:cellIdentifier];
  
  if (cell == nil) {
    cell = [[ListViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:cellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
  }
  [cell.lblName setText: [self.viewModel getJobTitle:indexPath]];
  [cell.lblTags setText: [self.viewModel getJobTags:indexPath]];
  [cell.lblDate setText: [self.viewModel getPubDate:indexPath]];
  [cell layoutIfNeeded];
  [cell updateConstraintsIfNeeded];
  return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.viewModel numberofRows];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//  return 60.0;
//}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self performSegueWithIdentifier:@"JobListSegue" sender:nil];
}

 #pragma mark - Navigation
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
   NSIndexPath *indexPath = self.tblJobList.indexPathForSelectedRow;
   if (indexPath == nil) return;
   JobList *destinationObject = [self.viewModel getJobList:indexPath];
   DetailsViewController *destinationVC = [segue destinationViewController];
   destinationVC.detailViewModel = [[DetailsViewModel alloc] init:destinationObject];
 }

@end
