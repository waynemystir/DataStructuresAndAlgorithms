//
//  ConsecutiveSequenceLargestSum.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/21/15.
//  Copyright (c) 2015 WES. All rights reserved.
//
/*
 
 Question:
 Find the contiguous subarray within an array (containing at least one number) that has the largest sum.
 For example, given the array [2, 1, –3, 4, –1, 2, 1, –5, 4], The contiguous array [4, –1, 2, 1] has the largest sum = 6.
 
 */

#import "MaxSumSubArray.h"

@implementation MaxSumSubArray

- (void)runTheProblem {
//    NSArray *array = @[@2, @-3, @-4, @5, @6];
//    NSArray *array = @[@2, @-3, @-4, @5, @6, @-1];
//    NSArray *array = @[@2, @-3, @-4, @5, @4, @(-10), @2, @7, @3];
    NSArray *array = @[@2, @-3, @-4, @20, @2, @(-10), @4, @7, @3, @-5, @-5, @-5, @-5];
//    NSArray *array = @[@2, @-3, @-4, @6, @2, @(-10), @4, @7, @3, @-5, @-5, @-5, @-5];
    
    NSArray *m = [self maxSubArrayOptimal:array];
    NSLog(@"Optimal: %@ TC:%f", [m componentsJoinedByString:@", "], timeComplexity);
    
    NSInteger q = [self maxSubArrayOptimalInt:array];
    NSLog(@"Optimal: %lu TC:%f", q, timeComplexity);
    
    NSArray *r = [self maxSubArrayBruteForce:array];
    NSLog(@"WES: %@ TC:%f", [r componentsJoinedByString:@", "], timeComplexity);
}

- (NSArray *)maxSubArrayOptimal:(NSArray *)array {
    timeComplexity = 0;
    NSArray *result = [NSArray array];
    NSInteger maxStartIndex = 0, maxEndIndex = 0;
    NSInteger maxEndingHere = [array[0] integerValue], maxSoFar = [array[0] integerValue];
    for (int i = 1; i < array.count; i++) {
        timeComplexity++;
        if ([array[i] integerValue] > maxEndingHere + [array[i] integerValue]) {
            maxEndingHere = [array[i] integerValue];
            maxStartIndex = i;
        } else {
            maxEndingHere = maxEndingHere + [array[i] integerValue];
        }
        
        if (maxEndingHere > maxSoFar) {
            maxSoFar = maxEndingHere;
            maxEndIndex = i;
            result = @[@(maxStartIndex), @(maxEndIndex), @(maxSoFar)];
        }
    }
    return result;
}

- (NSInteger)maxSubArrayOptimalInt:(NSArray *)array {
    timeComplexity = 0;
    NSInteger maxEndingHere = [array[0] integerValue], maxSoFar = [array[0] integerValue];
    for (int i = 1; i < array.count; i++) {
        timeComplexity++;
        maxEndingHere = MAX(maxEndingHere + [array[i] integerValue], [array[i] integerValue]);
        maxSoFar = MAX(maxEndingHere, maxSoFar);
    }
    return maxSoFar;
}

- (NSArray *)maxSubArrayBruteForce:(NSArray *)array {
    timeComplexity = 0;
    NSArray *result = [NSArray array];
    NSInteger largestSum = NSIntegerMin;
    
    for (NSInteger j = 0; j < array.count; j++) {
        NSInteger start = j;
        NSInteger end = j;
        BOOL sore = NO;
        while (start >= 0 || end < array.count) {
            
            NSUInteger s = MAX(0, start);
            NSUInteger e = MIN(array.count - 1, end);
            NSInteger sum = 0;
            
            for (NSUInteger i = s; i <= e; i++) {
                timeComplexity++;
                sum += [array[i] integerValue];
            }
            
            if (sum > largestSum) {
                largestSum = sum;
                result = @[ [NSNumber numberWithInteger:s],
                            [NSNumber numberWithInteger:e],
                            [NSNumber numberWithInteger:largestSum]];
            }
            
            if (sore) {
                end++;
            } else {
                start--;
            }
            sore = !sore;
            
        }
    }
    
    return result;
}

@end
