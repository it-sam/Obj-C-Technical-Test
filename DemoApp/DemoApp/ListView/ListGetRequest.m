//
//  ListGetRequest.m
//  DemoApp
//
//  Created by Shyam Parmar on 29/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

#import "ListGetRequest.h"

@implementation ListGetRequest
// url path where we need to connect for list of jobs->api end point
-(NSString *)urlPath {
  return @"https://www.workingnomads.co/api/exposed_jobs/";
}
@end
