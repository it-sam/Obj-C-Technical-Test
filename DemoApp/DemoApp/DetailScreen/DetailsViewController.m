//
//  DetailsViewController.m
//  DemoApp
//
//  Created by Shyam Parmar on 28/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@property (nonatomic, assign) BOOL hasDescription;
@end

@implementation DetailsViewController
@synthesize detailViewModel;
@synthesize webJobDescription, lblcompanyName;
@synthesize hasDescription;

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  // Delegate set manually
  self.webJobDescription.navigationDelegate = self;
  [self updateView];
}
// updating view details once view didload called.
-(void)updateView {
  self.title = [self.detailViewModel getTitle];
  [self.webJobDescription loadHTMLString:@"<Br><center><H1>Loading description</H1></center>" baseURL:nil];
  hasDescription = false;
  [lblcompanyName setText:[self.detailViewModel getcompanyName]];
}
- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
// Webkit finish loading delegate
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
  if (hasDescription == false) {
    //Loading actual job description
    self.hasDescription = true;
    [self.webJobDescription loadHTMLString:[self.detailViewModel getWebData] baseURL:nil];
  }
}
// Stop loading data as user already pressed to pop.
-(void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  self.hasDescription = true;
  [self.webJobDescription stopLoading];
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
