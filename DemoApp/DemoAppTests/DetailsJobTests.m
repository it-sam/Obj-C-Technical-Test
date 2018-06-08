//
//  DetailsJobTests.m
//  DemoAppTests
//
//  Created by Shyam Parmar on 29/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JobList.h"
#import "DetailsViewModel.h"

@interface DetailsJobTests : XCTestCase
@property(nonatomic,strong) DetailsViewModel *viewModel;
@end

@implementation DetailsJobTests
//@synthesize title,pubDate,company,jobDescription,tags;

- (void)setUp {
  [super setUp];
  // Put setup code here. This method is called before the invocation of each test method in the class.
  JobList *aJobList = [[JobList alloc] init];
  aJobList.title = @"iOS Developer";
  aJobList.pubDate = @"29-May";
  aJobList.company = @"Earth";
  aJobList.jobDescription = @"development";
  aJobList.tags = @"ios,Swift,Objective-C";
  
  self.viewModel = [[DetailsViewModel alloc] init:aJobList];
  XCTAssertNotNil(self.viewModel);
  XCTAssertNotNil(aJobList);
}

- (void)tearDown {
  // Put teardown code here. This method is called after the invocation of each test method in the class.
  [super tearDown];
  XCTAssertNotNil([self.viewModel getTitle]);
  XCTAssertNotNil([self.viewModel getWebData]);
  XCTAssertNotNil([self.viewModel getcompanyName]);
}

- (void)testExample {
  // This is an example of a functional test case.
  // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
  // This is an example of a performance test case.
  [self measureBlock:^{
    // Put the code you want to measure the time of here.
  }];
}

@end
