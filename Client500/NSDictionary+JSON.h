//
//  NSDictionary+JSON.h
//  BigMag
//
//  Created by Aleksey Novikov on 29/09/14.
//  Copyright © 2014 Aleksey Novikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDictionary (JSON)

- (id)objectOrNilForKey:(NSString *)key;
- (NSInteger)integerForKey:(NSString *)key;
- (unsigned long long)unsignedLongLongForKey:(NSString *)key;
- (unsigned long)unsignedLongForKey:(NSString *)key;
- (CGFloat)floatForKey:(NSString *)key;
- (double)doubleForKey:(NSString *)key;
- (BOOL)boolForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key;
- (NSDictionary *)dictionaryForKey:(NSString *)key;
- (NSArray *)arrayForKey:(NSString *)key;

@end
