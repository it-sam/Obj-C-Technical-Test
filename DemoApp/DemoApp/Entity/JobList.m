//
//  JobList.m
//  DemoApp
//
//  Created by Shyam Parmar on 28/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

#import "JobList.h"

@implementation JobList
@synthesize title,pubDate,company,jobDescription,tags;

- (void)setValue:(nullable id)value forUndefinedKey:(NSString *)key {
  if([key  isEqual: @"company_name"]) {
    [self setValue:value forKey:@"company"];
  } else if([key  isEqual: @"pub_date"]) {
    [self setValue:value forKey:@"pubDate"];
  } else if([key  isEqual: @"description"]) {
    [self setValue:value forKey:@"jobDescription"];
  }
}
@end
