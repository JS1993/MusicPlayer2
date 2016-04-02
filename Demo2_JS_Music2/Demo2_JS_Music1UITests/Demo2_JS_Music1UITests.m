//
//  Demo2_JS_Music1UITests.m
//  Demo2_JS_Music1UITests
//
//  Created by  江苏 on 16/3/13.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Demo2_JS_Music1UITests : XCTestCase

@end

@implementation Demo2_JS_Music1UITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
