//
//  IsOneEditDistance.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/19/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import "IsOneEditDistance.h"

@implementation IsOneEditDistance

- (void)runTheProblem {
    NSString *s = @"abcde";
    NSString *t = @"abcdef";
    NSString *r = [self isOneEditDistance:s t:t] ? @"YES" : @"NO";
    NSLog(@"%@: s:%@ t:%@ r:%@ TC:%f", self.class, s, t, r, timeComplexity);
}

- (BOOL)isOneEditDistance:(NSString *)s t:(NSString *)t {
    NSInteger m = s.length, n = t.length;
    if (m > n) return [self isOneEditDistance:t t:s];
    if (n - m > 1) return false;
    NSInteger i = 0, shift = n - m;
    while (i < m && [s characterAtIndex:i] == [t characterAtIndex:i]) i++;
    if (i == m) return shift > 0;
    if (shift == 0) i++;
    while (i < m && [s characterAtIndex:i] == [t characterAtIndex:(i + shift)]) i++;
    return i == m;
}

@end
