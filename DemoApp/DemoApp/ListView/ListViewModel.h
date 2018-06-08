//
//  ListViewModel.h
//  DemoApp
//
//  Created by Shyam Parmar on 28/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppConstant.h"
#import "ListModel.h"
#import "JobList.h"

@interface ListViewModel : NSObject
-(void)requestJobList:(BoolComplHandler)handler;
-(NSUInteger)numberofRows;
-(JobList *)getJobList:(NSIndexPath *)indexPath;
-(NSString *)getJobTitle:(NSIndexPath *)indexPath;
-(NSString *)getJobTags:(NSIndexPath *)indexPath;
-(NSString *)getPubDate:(NSIndexPath *)indexPath;
@end
