//
//  JZSQliteDemoTests.m
//  JZSQliteDemoTests
//
//  Created by jiong23 on 2017/4/26.
//  Copyright © 2017年 Chenjz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JZSqliteTool.h"

@interface JZSQliteDemoTests : XCTestCase

@end

@implementation JZSQliteDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    NSString *sql = @"create table if not exists t_stu(id integer primary key autoincrement, name text not null, age integer, score real)";
    
    BOOL result = [JZSqliteTool deal:sql uid:nil];
    XCTAssertEqual(result, YES);
    
    
    
}

- (void)testQuery {
    
    NSString *sql = @"select * from t_stu";
    NSMutableArray *result = [JZSqliteTool querySql:sql uid:nil];
    
    NSLog(@"%@", result);
    
    
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
