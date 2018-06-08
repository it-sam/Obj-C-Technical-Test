//
//  JobListTests.m
//  DemoAppTests
//
//  Created by Shyam Parmar on 29/05/18.
//  Copyright © 2018 FreeWare. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ListViewModel.h"

@interface JobListTests : XCTestCase
@property (nonatomic,strong) ListViewModel *viewModel;
@end

@implementation JobListTests
@synthesize viewModel;

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
  self.viewModel = [[ListViewModel alloc] init];
  
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  XCTestExpectation *expectation = [[XCTestExpectation alloc] initWithDescription:@"Fetch List"];
  [self.viewModel requestJobList:^(BOOL isSuccess, NSError *error) {
    [expectation fulfill];
  }];
  NSArray *arr =[NSArray arrayWithObject:expectation];
  [self waitForExpectations:arr timeout:60];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
