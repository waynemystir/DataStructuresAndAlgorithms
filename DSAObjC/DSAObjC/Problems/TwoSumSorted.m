//
//  TwoSumSorted.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/16/15.
//  Copyright (c) 2015 WES. All rights reserved.
//
/*
 
 Similar to Question [1. Two Sum], except that the input array is already sorted in ascending order.
 
 */

#import "TwoSumSorted.h"

@implementation TwoSumSorted

- (void)runTheProblem {
//    NSArray *numbers = @[@1, @2, @3, @12];
//    NSInteger target = 15;
    NSArray *numbers = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15, @16, @17];
    NSInteger target = 29;
    NSArray *twoSumSorted = [self twoSumSortedOptimized:numbers target:target];
    if (twoSumSorted.count == 4) {
        NSInteger i = [twoSumSorted[0] integerValue];
        NSInteger x = [twoSumSorted[1] integerValue];
        NSInteger j = [twoSumSorted[2] integerValue];
        NSInteger y = [twoSumSorted[3] integerValue];
        NSLog(@"%@:Found x:%ld(index:%ld) and y:%ld(index:%ld) that add to %ld. TC:%f", self.class, (long)x, i, y, j, target, timeComplexity);
    } else {
        NSLog(@"No such elements found. TC:%f", timeComplexity);
    }
}

- (NSArray *)twoSumSortedOptimized:(NSArray *)numbers target:(NSInteger)target {
    NSUInteger i = 0, j = numbers.count - 1;
    while (i < j) {
        timeComplexity++;
        NSInteger valAtI = [numbers[i] integerValue];
        NSInteger valAtJ = [numbers[j] integerValue];
        if (valAtI + valAtJ == target) {
            return [NSArray arrayWithObjects:[NSNumber numberWithInteger:i],
                    numbers[i],
                    [NSNumber numberWithInteger:j],
                    numbers[j], nil];
        } else if (valAtI + valAtJ < target) {
            i++;
        } else {
            j--;
        }
    }
    return nil;
}

- (NSArray *)twoSumSorted:(NSArray *)numbers target:(NSInteger)target {
    for (int j = 0; j < numbers.count; j++) {
        timeComplexity++;
        NSInteger x = [numbers[j] integerValue];
        double binarySearchTimeComplexity = log10(numbers.count)-1;
        timeComplexity += binarySearchTimeComplexity;
        NSInteger indexFound = [numbers indexOfObject:[NSNumber numberWithInteger:(target - x)]
                                          inSortedRange:NSMakeRange(0, numbers.count)
                                                options:NSBinarySearchingFirstEqual
                                        usingComparator:^NSComparisonResult(id obj1, id obj2) {
                                            NSInteger number1 = [obj1 integerValue];
                                            NSInteger number2 = [obj2 integerValue];
                                            return number1 > number2 ? NSOrderedDescending : number1 < number2 ? NSOrderedAscending : NSOrderedSame;
        }];
        if (indexFound != NSNotFound) {
            return [NSArray arrayWithObjects:[NSNumber numberWithInteger:j],
                    [NSNumber numberWithInteger:x],
                    [NSNumber numberWithInteger:indexFound],
                    numbers[indexFound], nil];
        }
    }
    return nil;
}

@end
