//
//  AppError.h
//  DemoApp
//
//  Created by Shyam Parmar on 29/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppConstant.h"

@interface AppError : NSObject
+(NSError *)create:(NSString *)message;
@end
