//
//  JZSqliteModelTool.m
//  JZSQliteDemo
//
//  Created by jiong23 on 2017/4/28.
//  Copyright © 2017年 Chenjz. All rights reserved.
//

#import "JZSqliteModelTool.h"
#import <objc/runtime.h>

@implementation JZSqliteModelTool

+ (NSString *)tableName:(Class)cls {
    return NSStringFromClass(cls);
}

+ (NSDictionary *)classIvarNameTypeDic:(Class)cls {
    
    unsigned int outCount = 0;
    Ivar *varList = class_copyIvarList(cls, &outCount);
    
    NSMutableDictionary *nameTypeDic = [NSMutableDictionary dictionary];
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = varList[i];
        
        NSString *ivarName = [NSString stringWithUTF8String: ivar_getName(ivar)];
        if ([ivarName hasPrefix:@"_"]) {
            ivarName = [ivarName substringFromIndex:1];
        }
        
        NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        
        type = [type stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"@\""]];
        
        
        [nameTypeDic setValue:type forKey:ivarName];
    }
    
    return nameTypeDic;
    
}

+ (NSDictionary *)classIvarNameSqliteTypeDic:(Class)cls {
    
    NSMutableDictionary *dic = [[self classIvarNameTypeDic:cls] mutableCopy];
    
    NSDictionary *typeDic = [self ocTypeToSqliteTypeDic];
    [dic enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL * _Nonnull stop) {
        dic[key] = typeDic[obj];
    }];
    
    return dic;
    
}


+ (NSString *)columnNamesAndTypesStr:(Class)cls {
    
    NSDictionary *nameTypeDic = [self classIvarNameSqliteTypeDic:cls];

    NSMutableArray *result = [NSMutableArray array];
    [nameTypeDic enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL * _Nonnull stop) {
        
        [result addObject:[NSString stringWithFormat:@"%@ %@", key, obj]];
    }];
    
    
    return [result componentsJoinedByString:@","];
    
}

#pragma mark - 私有的方法
+ (NSDictionary *)ocTypeToSqliteTypeDic {
    return @{
             @"d": @"real",
             @"f": @"real",
             
             @"i": @"integer",
             @"q": @"integer",
             @"Q": @"integer",
             @"B": @"integer",
             
             @"NSData": @"blob",
             @"NSDictionary": @"text",
             @"NSMutableDictionary": @"text",
             @"NSArray": @"text",
             @"NSMutableArray": @"text",
             
             @"NSString": @"text"
             };
    
}


@end
