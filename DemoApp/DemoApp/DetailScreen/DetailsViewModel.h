//
//  DetailsViewModel.h
//  DemoApp
//
//  Created by Shyam Parmar on 29/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JobList.h"

@interface DetailsViewModel : NSObject
-(instancetype)init:(JobList *)jobDetails;
@property (nonatomic,strong) JobList *jobDetails;
-(NSString *)getTitle;
-(NSString *)getWebData;
-(NSString *)getcompanyName;
@end
