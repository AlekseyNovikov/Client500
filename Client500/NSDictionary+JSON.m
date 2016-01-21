//
//  NSDictionary+JSON.m
//  BigMag
//
//  Created by Aleksey Novikov on 29/09/14.
//  Copyright © 2014 Aleksey Novikov. All rights reserved.
//

#import "NSDictionary+JSON.h"

@implementation NSDictionary (JSON)

- (id)objectOrNilForKey:(NSString *)key
{
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSNull class]]) return nil;
    return object;
}

- (NSInteger)integerForKey:(NSString *)key
{
    return [[self objectOrNilForKey:key] integerValue];
}

- (unsigned long long)unsignedLongLongForKey:(NSString *)key
{
    return [[self objectOrNilForKey:key] unsignedLongLongValue];
}

- (unsigned long)unsignedLongForKey:(NSString *)key
{
    return [[self objectForKey:key] unsignedLongValue];
}

- (CGFloat)floatForKey:(NSString *)key
{
    return [[self objectOrNilForKey:key] floatValue];
}

- (double)doubleForKey:(NSString *)key
{
    return [[self objectOrNilForKey:key] doubleValue];
}

- (BOOL)boolForKey:(NSString *)key
{
    return [[self objectOrNilForKey:key] boolValue];
}

- (NSString *)stringForKey:(NSString *)key
{
    return [self objectOrNilForKey:key];
}

- (NSDictionary *)dictionaryForKey:(NSString *)key
{
    NSDictionary *dic = [self objectOrNilForKey:key];
    if ([dic isKindOfClass:[NSDictionary class]]) return dic;
    return nil;
}

- (NSArray *)arrayForKey:(NSString *)key
{
    NSArray *array = [self objectOrNilForKey:key];
    if ([array isKindOfClass:[NSArray class]]) return array;
    return nil;
}


@end
