//
//  StrStr.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/17/15.
//  Copyright (c) 2015 WES. All rights reserved.
//
/*
 
 Question:
 
 Return the index of the first occurrence of the needle in a haystack, or -1 if needle is not part of haystack.
 
 */

#import "StrStr.h"

@implementation StrStr

- (void)runTheProblem {
//    NSString *needle = @"needle";
//    NSString *haystack = @"kjvbnfkjbneedlewjnrlbgfvlbwv";
//    NSString *needle = @"aab";
//    NSString *haystack = @"aaaaaaaaaaaa";
    NSString *needle = @"issi";
    NSString *haystack = @"mississippi";
    NSLog(@"%@: Starting index of '%@' is %ld. TC:%f", self.class, needle, [self strstr:needle haystack:haystack], timeComplexity);
}

- (NSInteger)strstr:(NSString *)needle haystack:(NSString *)haystack {
    for (int i = 0; ; i++) {
        timeComplexity++;
        for (int j = 0; ; j++) {
            timeComplexity++;
            if (j == needle.length) return i;
            if (i + j == haystack.length) return -1;
            if ([needle characterAtIndex:j] != [haystack characterAtIndex:(i + j)]) break;
        }
    }
    return -1;
}

@end
