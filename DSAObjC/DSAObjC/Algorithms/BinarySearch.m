//
//  BinarySearch.m
//  DSAObjC
//
//  Created by WAYNE SMALL on 8/27/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import "BinarySearch.h"

static NSUInteger runtimeComplexity = 0;

@implementation BinarySearch

- (NSInteger)binarySearch:(NSArray *)array value:(NSInteger)value {
    NSInteger valueIndex = [self binarySearch:array value:value start:0 end:(array.count - 1)];
    if (-1 == valueIndex) {
        NSLog(@"%@: Could not find value %lu. TC:%lu", self.class, value, runtimeComplexity);
    } else {
        NSLog(@"%@: Found value %lu at index %lu. TC:%lu", self.class, value, valueIndex, runtimeComplexity);
    }
    return valueIndex;
}

- (NSInteger)binarySearch:(NSArray *)array value:(NSInteger)value start:(NSInteger)start end:(NSInteger)end {
    runtimeComplexity++;
    if (start > end) return -1;
    NSInteger mid = (start + end) / 2;
    if (value == [array[mid] integerValue]) return mid;
    else if (value < [array[mid] integerValue]) return [self binarySearch:array value:value start:start end:(mid - 1)];
    else return [self binarySearch:array value:value start:(mid + 1) end:end];
}

@end
