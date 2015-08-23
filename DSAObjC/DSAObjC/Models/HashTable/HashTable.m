//
//  HashTable.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/20/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import "HashTable.h"
#import "KeyAndObject.h"

@interface HashTable ()

@property (nonatomic, strong) NSMutableArray *keysAndObjects;

@end

@implementation HashTable

- (id)initWithSize:(NSUInteger)size {
    if (self = [super init]) {
        _keysAndObjects = [NSMutableArray array];
        for (NSInteger i = 0; i < size; ++i) [_keysAndObjects addObject:[NSNull null]];
    }
    return self;
}

- (NSArray *)allKeys {
    if (self.keysAndObjects.count == 0) {
        return nil;
    }
    
    NSMutableArray *mutKeys = [NSMutableArray array];
    for (KeyAndObject *ko in self.keysAndObjects) {
        if (ko == (id)[NSNull null]) continue;
        [mutKeys addObject:ko.key];
    }
    
    return [NSArray arrayWithArray:mutKeys];
}

- (NSArray *)allObjects {
    if (self.keysAndObjects.count == 0) {
        return nil;
    }
    
    NSMutableArray *mutObjects = [NSMutableArray array];
    for (KeyAndObject *ko in self.keysAndObjects) {
        if (ko == (id)[NSNull null]) continue;
        [mutObjects addObject:ko.object];
    }
    
    return [NSArray arrayWithArray:mutObjects];
}

- (void)enumerateKeysAndObjectsUsingBlock:(void (^)(id, id, BOOL *))block {
    BOOL stop = NO;
    for (KeyAndObject *ko in self.keysAndObjects) {
        if (stop) break;
        if (ko == (id)[NSNull null]) continue;
        block(ko.key, ko.object, &stop);
    }
}

- (NSUInteger)hashFunction:(NSInteger)hash {
    return labs(hash) % (self.keysAndObjects.count ? : 1);
}

- (id)put:(id)key object:(id)object {
    if (!key) {
        [self throwInvalidArgException:_cmd reason:@"key cannot be nil"];
    }
    
    if (!object) {
        [self throwInvalidArgException:_cmd reason:@"object cannot be nil"];
    }
    
    NSUInteger index = [self hashFunction:[key hash]];
    for (KeyAndObject *ko in self.keysAndObjects) {
        if (ko != (id)[NSNull null] && [key hash] == [ko.key hash] && [ko.key isEqual:key]) {
            id old = ko.object;
            ko.object = object;
            return old;
        }
    }
    
    self.keysAndObjects[index] = [[KeyAndObject alloc] initWithKey:key object:object];
    return nil;
}

- (id)get:(id)key {
    if (!key) {
        [self throwInvalidArgException:_cmd reason:@"key cannot be nil"];
    }
    
    NSUInteger index = [self hashFunction:[key hash]];
    if (index >= self.keysAndObjects.count) {
        return nil;
    }
    
    return ((KeyAndObject *)self.keysAndObjects[index]).object;
}

- (void)delete:(id)key {
    if (!key) {
        [self throwInvalidArgException:_cmd reason:@"key cannot be nil"];
    }
    
    NSUInteger index = [self hashFunction:[key hash]];
    if (index >= self.keysAndObjects.count) {
        return;
    }
    
    self.keysAndObjects[index] = [NSNull null];
}

- (void)throwInvalidArgException:(SEL)selector reason:(NSString *)reason {
    reason = [NSString stringWithFormat:@"%@.%@: %@", NSStringFromClass(self.class), NSStringFromSelector(selector), reason];
    NSException *ex = [NSException exceptionWithName:NSInvalidArgumentException reason:reason userInfo:nil];
    @throw ex;
}

@end
