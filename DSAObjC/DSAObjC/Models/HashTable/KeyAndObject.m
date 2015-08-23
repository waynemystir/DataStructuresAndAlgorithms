//
//  KeyAndObject.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/21/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import "KeyAndObject.h"

@implementation KeyAndObject

- (id)initWithKey:(id)key object:(id)object {
    if (self = [super init]) {
        _key = key;
        _object = object;
    }
    return self;
}

@end
