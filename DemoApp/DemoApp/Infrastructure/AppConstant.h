//
//  AppConstant.h
//  DemoApp
//
//  Created by Shyam Parmar on 28/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

typedef void (^ComplHandler) (NSObject* Any, NSError* error);
typedef void (^BoolComplHandler) (BOOL isSuccess, NSError* error);

#define kAppName      @"JobList"
#define kFetchError   @"Unable to fetch the list."
