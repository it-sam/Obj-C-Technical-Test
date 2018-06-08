//
//  Listdeserializer.m
//  DemoApp
//
//  Created by Shyam Parmar on 28/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

#import "Listdeserializer.h"
#import "ListModel.h"
#import "JobList.h"

@implementation Listdeserializer
//Method to deserialize nsdata response to entity
-(void)deserializeModel:(NSData *)data response:(ComplHandler)complHandler {
  NSError *localError = nil;
  NSArray *parsedObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&localError];
  //Check for error
  if (localError != nil) {
    return complHandler(nil, localError);
  }
  NSMutableArray *arr = [[NSMutableArray alloc]init];
  for (NSDictionary *object in parsedObject) {
    JobList *model = [[JobList alloc] init];
    for (NSString *key in [object allKeys]) {
      [model setValue:[object valueForKey:key] forKey:key];
    }
    [arr addObject:model];
  }
  complHandler(arr, nil);
}
@end
