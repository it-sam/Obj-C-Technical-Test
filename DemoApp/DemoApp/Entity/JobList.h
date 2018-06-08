//
//  JobList.h
//  DemoApp
//
//  Created by Shyam Parmar on 28/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JobList : NSObject
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *jobDescription;
@property(nonatomic, strong) NSString *company;
@property(nonatomic, strong) NSString *tags;
@property(nonatomic, strong) NSString *pubDate;

@end
