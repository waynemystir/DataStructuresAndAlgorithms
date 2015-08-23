//
//  HashTable.h
//  LeetCode
//
//  Created by WAYNE SMALL on 8/20/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HashTable : NSObject

@property (nonatomic, strong, readonly) NSArray *allKeys;
@property (nonatomic, strong, readonly) NSArray *allObjects;

- (id)initWithSize:(NSUInteger)size NS_DESIGNATED_INITIALIZER;
- (id)put:(id)key object:(id)object;
- (id)get:(id)key;
- (void)delete:(id)key;
- (void)enumerateKeysAndObjectsUsingBlock:(void (^)(id key,
                                                    id obj,
                                                    BOOL *stop))block;

@end
