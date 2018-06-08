//
//  Listdeserializer.h
//  DemoApp
//
//  Created by Shyam Parmar on 28/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppConstant.h"

@interface Listdeserializer : NSObject
-(void)deserializeModel:(NSData *)data response:(ComplHandler)complHandler;
@end
