//
//  uiplayTests.m
//  uiplayTests
//
//  Created by Zhang Xiang on 2017/4/7.
//  Copyright © 2017年 zhangxiang. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface uiplayTests : XCTestCase

@end

@implementation uiplayTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSString* str = @"http://eu.api.enayehme.com/v3/article.html?id=0fa8ecae3600e12ba614f3153bfa5b7a   ";
    NSURL* url = [NSURL URLWithString: str];
    XCTAssertNil(url,"xxxxx");
    
    NSString* str2 = @"http://eu.api.enayehme.com/v3/article.html?id=0fa8ecae3600e12ba614f3153bfa5b7a";
    url = [NSURL URLWithString: str2];
    XCTAssertTrue([url.absoluteString isEqualToString:str2]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
