//
//  IRequest.h
//  DemoApp
//
//  Created by Shyam Parmar on 28/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

#import <Foundation/Foundation.h>
// A protocol to follow when we want network connection, can be usefull for post request too.
@protocol IRequest
@optional
-(NSDictionary *)urlContent;
@required
-(NSString *)urlPath;
@end

