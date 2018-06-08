//
//  ListViewModel.m
//  DemoApp
//
//  Created by Shyam Parmar on 28/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ListViewModel.h"

@interface ListViewModel  ()
@property(nonatomic, strong) ListModel *model;
@property(nonatomic,strong)NSDateFormatter *dateFormatter;
@end
@implementation ListViewModel
@synthesize model;
@synthesize dateFormatter;
-(instancetype)init {
  if (self != nil) {
    self.model = [[ListModel alloc]init];
    self.dateFormatter = [[NSDateFormatter alloc] init];
  }
  return self;
}
//Actual request to pass at model
-(void)requestJobList:(BoolComplHandler)handler {
  if(self.model.arrJobList == nil || self.model.arrJobList.count == 0) {
    [self.model request:handler];
  } else {
    //We already have data
    handler(true,nil);
  }
}
//Methods will return data to uitableview to render the list
-(NSUInteger)numberofRows {
  return self.model.arrJobList.count;
}
-(JobList *)getJobList:(NSIndexPath *)indexPath {
  return (JobList *)[self.model.arrJobList objectAtIndex:indexPath.row];
}
-(NSString *)getJobTitle :(NSIndexPath *)indexPath {
  return [[self getJobList:indexPath] title];
}
-(NSString *)getJobTags :(NSIndexPath *)indexPath {
  NSString *strTags = [[self getJobList:indexPath] tags];
  return [strTags stringByReplacingOccurrencesOfString:@"," withString:@" "];
}
-(NSString *)getPubDate:(NSIndexPath *)indexPath {
   NSString *dateString = [[self getJobList:indexPath] pubDate];
  return [self getStringDate:dateString];
 // return [[self getJobList:indexPath] pubDate];
}
-(NSString *)getStringDate:(NSString *)dateString {
  //2018-05-11T15:09:07Z
  [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
  NSDate *date = [dateFormatter dateFromString:dateString];
  [dateFormatter setDateFormat:@"dd-MMM"];
  return [dateFormatter stringFromDate:date];
}
@end
