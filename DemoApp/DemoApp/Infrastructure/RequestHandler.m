//
//  RequestHandler.m
//  DemoApp
//
//  Created by Shyam Parmar on 28/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

#import "RequestHandler.h"
#import "AppError.h"
#import "AppConstant.h"

//typealias responseHandler = (Any?, Error?) -> Void

@implementation RequestHandler
//Actual get request to server
-(void)makeGetRequest:(NSObject<IRequest>*)request response:(ComplHandler)complHandler {
  NSURLSessionConfiguration *config = NSURLSessionConfiguration.defaultSessionConfiguration;
  config.timeoutIntervalForRequest = 60;
  
  NSURLSession *urlsession = [NSURLSession sessionWithConfiguration:config];
  NSURL *url = [NSURL URLWithString: [request urlPath]];
  NSURLRequest *urlRequest = [NSURLRequest requestWithURL: url];
  NSURLSessionDataTask *task = [urlsession dataTaskWithRequest:urlRequest
                                             completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                               if (error != nil) {
                                                 complHandler(nil,error);
                                               } else if(data != nil && data.length >0) {
                                                 complHandler(data,nil);
                                               } else {
                                                 NSError *error=[AppError create:kFetchError];
                                                 complHandler(nil,error);
                                               }
    
    
  }];
  [task resume];
}
@end
