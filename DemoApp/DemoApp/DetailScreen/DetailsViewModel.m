//
//  DetailsViewModel.m
//  DemoApp
//
//  Created by Shyam Parmar on 29/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

#import "DetailsViewModel.h"

@implementation DetailsViewModel
@synthesize jobDetails;

-(instancetype)init:(JobList *)jobDetails {
  if (self != nil) {
    self.jobDetails = jobDetails;
  }
  return self;
}
// methods will be used to populate data using detailViewController.
-(NSString *)getTitle {
  return jobDetails.title;
}
-(NSString *)getWebData {
  return jobDetails.jobDescription;
}
-(NSString *)getcompanyName {
  return [NSString stringWithFormat:@" By: %@",jobDetails.company];
}
@end
