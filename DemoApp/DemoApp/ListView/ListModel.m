//
//  ListModel.m
//  DemoApp
//
//  Created by Shyam Parmar on 28/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

#import "ListModel.h"
#import "RequestHandler.h"
#import "Listdeserializer.h"
#import "ListGetRequest.h"

@implementation ListModel
@synthesize arrJobList;
//Model is going ro form the request and send it and response back to Viewmodel
-(void)request:(BoolComplHandler)compHandler {
  ListGetRequest *myrequest = [[ListGetRequest alloc]init];
  RequestHandler *handler = [[RequestHandler alloc]init];
  [handler makeGetRequest:myrequest response:^(NSObject *resObj, NSError *error) {
    if (error == nil) {
      //sleep(10);
      Listdeserializer *deserilize = [[Listdeserializer alloc]init];
      [deserilize deserializeModel:(NSData *)resObj response:^(NSObject *Any, NSError *error) {
        if (error == nil && [Any isKindOfClass:[NSArray class]]) {
          self.arrJobList = (NSArray *)Any;
          compHandler(true, nil);
        } else {
          compHandler(false,error);
        }
      }];
    } else {
      compHandler(false,error);
    }
  }];
}
@end
