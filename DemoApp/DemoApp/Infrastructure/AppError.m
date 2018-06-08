//
//  AppError.m
//  DemoApp
//
//  Created by Shyam Parmar on 29/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

#import "AppError.h"

@implementation AppError
// to create any error
+(NSError *)create:(NSString *)message {
  return [NSError errorWithDomain:kAppName code:111
                         userInfo:[NSDictionary dictionaryWithObject:message forKey:NSLocalizedDescriptionKey]];
}
@end
