//
//  JZSqliteModelTool.h
//  JZSQliteDemo
//
//  Created by jiong23 on 2017/4/28.
//  Copyright © 2017年 Chenjz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JZSqliteModelTool : NSObject

+ (NSString *)tableName:(Class)cls;

+ (NSDictionary *)classIvarNameTypeDic:(Class)cls;

+ (NSDictionary *)classIvarNameSqliteTypeDic:(Class)cls;


+ (NSString *)columnNamesAndTypesStr:(Class)cls;


@end
