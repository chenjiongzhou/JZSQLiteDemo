//
//  JZSqliteTool.h
//  JZSQliteDemo
//
//  Created by jiong23 on 2017/4/26.
//  Copyright © 2017年 Chenjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JZSqliteTool : NSObject

+ (BOOL)deal:(NSString *)sql uid:(NSString *)uid;

+ (BOOL)dealSqls:(NSArray <NSString *>*)sqls uid:(NSString *)uid;

+ (NSMutableArray <NSMutableDictionary *>*)querySql:(NSString *)sql uid:(NSString *)uid;


@end
