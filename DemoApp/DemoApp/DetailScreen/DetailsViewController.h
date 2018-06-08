//
//  DetailsViewController.h
//  DemoApp
//
//  Created by Shyam Parmar on 28/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "DetailsViewModel.h"

@interface DetailsViewController : UIViewController <WKNavigationDelegate>
@property(nonatomic, strong) IBOutlet WKWebView *webJobDescription;
@property(nonatomic, strong) IBOutlet UILabel *lblcompanyName;

//Viewmodel
@property(nonatomic,strong)DetailsViewModel *detailViewModel;
@end
