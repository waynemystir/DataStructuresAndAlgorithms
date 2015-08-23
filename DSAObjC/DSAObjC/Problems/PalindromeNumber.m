//
//  PalindromeNumber.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/19/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import "PalindromeNumber.h"

@implementation PalindromeNumber

- (void)runTheProblem {
    NSInteger x = 5123673215;
    NSString *ip = [self isPalindromeNumber:x] ? @"YES" : @"NO";
    NSLog(@"%@: x:%ld is palindrome:%@", self.class, x, ip);
}

- (BOOL)isPalindromeNumber:(NSInteger)x {
    if (x < 0 || x > NSIntegerMax) {
        return NO;
    }
    while (x > 0) {
        NSInteger lx = log10l(x);
        NSInteger p = powl(10, lx);
        NSInteger firstDigit = x / p;
        NSInteger lastDigit = x % 10;
        if (firstDigit != lastDigit) {
            return NO;
        }
        x -= firstDigit * p;
        x /= 10;
    }
    return YES;
}

@end
