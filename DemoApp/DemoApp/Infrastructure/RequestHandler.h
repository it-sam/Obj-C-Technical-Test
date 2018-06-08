//
//  RequestHandler.h
//  DemoApp
//
//  Created by Shyam Parmar on 28/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IRequest.h"
#import "AppConstant.h"

@interface RequestHandler : NSObject
-(void)makeGetRequest:(NSObject<IRequest>*)request response:(ComplHandler)complHandler;
@end

