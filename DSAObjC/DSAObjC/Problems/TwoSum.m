//
//  TwoSum.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/16/15.
//  Copyright (c) 2015 WES. All rights reserved.
//
/**
 
 Given an array of integers, find two numbers such that they add up to a specific target number.
 
 The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.
 
 You may assume that each input would have exactly one solution.
 
 Input: numbers={2, 7, 11, 15}, target=9
 Output: index1=1, index2=2
 
 */

#import "TwoSum.h"

@implementation TwoSum

- (void)runTheProblem {
//    NSArray *numbers = @[@1, @2, @3, @4, @1, @2, @3, @4, @1, @2, @3, @4, @1, @2, @3, @4, @11];
//    NSInteger target = 15;
    NSArray *numbers = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15, @16, @17];
    NSInteger target = 29;
    NSArray *twoSum = [self twoSum:numbers target:target];
    if (twoSum.count == 4) {
        NSInteger i = [twoSum[0] integerValue];
        NSInteger x = [twoSum[1] integerValue];
        NSInteger j = [twoSum[2] integerValue];
        NSInteger y = [twoSum[3] integerValue];
        NSLog(@"%@:Found x:%ld(index:%ld) and y:%ld(index:%ld) that add to %ld. TC:%f", self.class, x, i, y, j, target, timeComplexity);
    } else {
        NSLog(@"No such elements found. TC:%f", timeComplexity);
    }
}

- (NSArray *)twoSum:(NSArray *)numbers target:(NSInteger)target {
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    for (int j = 0; j < numbers.count; j++) {
        timeComplexity++;
        NSInteger x = [numbers[j] integerValue];
        id indexOfTargetLessX = [map objectForKey:@(target - x)];
        if (indexOfTargetLessX)
            return [NSArray arrayWithObjects:@(j), @(x), indexOfTargetLessX, @(target - x), nil];
        [map setObject:@(j) forKey:@(x)];
    }
    return nil;
}

- (NSArray *)twoSumBruteForce:(NSArray *)numbers target:(NSInteger)target {
    for (int j = 0; j < numbers.count; j++) {
        NSInteger x = [numbers[j] integerValue];
        for (int k = 0; k < numbers.count; k++) {
            timeComplexity++;
            NSInteger y = [numbers[k] integerValue];
            if (x + y == target) {
                return [NSArray arrayWithObjects:[NSNumber numberWithInteger:x], [NSNumber numberWithInteger:y], nil];
            }
        }
    }
    return nil;
}

@end
