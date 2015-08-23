//
//  AddBinary.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/16/15.
//  Copyright (c) 2015 WES. All rights reserved.
//
/**
 
 Given two binary strings, return their sum (also a binary string).
 
 For example,
 a = "11"
 b = "1"
 Return "100".
 
 */

#import "AddBinary.h"

@implementation AddBinary

- (void)runTheProblem {
    NSString *a = @"111", *b = @"10";
    NSString *sum = [self addBinaryOld:a binary2:b];
    NSLog(@"%@ + %@ = %@", a, b, sum);
}

- (NSString *)addBinary:(NSString *)a binary2:(NSString *)b {
    NSString *theSum = @"";
    long i = a.length - 1, j = b.length - 1;
    int carry = 0;
    
    while (i >= 0 || j >= 0) {
        int sum = carry;
        if (i >= 0) {
            int ath = [[a substringWithRange:NSMakeRange(i--, 1)] intValue];
            sum += ath;
        }
        if (j >= 0) {
            int bth = [[b substringWithRange:NSMakeRange(j--, 1)] intValue];
            sum += bth;
        }
        carry = sum / 2;
        theSum = [NSString stringWithFormat:@"%d%@", (sum % 2), theSum];
        NSLog(@"theSum:%@", theSum);
    }
    
    if (carry == 1) theSum = [NSString stringWithFormat:@"%c%@", '1', theSum];
    return theSum;
}

- (NSString *)addBinaryOld:(NSString *)a binary2:(NSString *)b {
    NSString *res = @"";
    unsigned long N = a.length, M = b.length;
    long i = N - 1, j = M - 1;
    int carry = 0;
    while (i >= 0 || j >= 0) {
        int sum = carry;
        if (i >= 0) sum += [[a substringWithRange:NSMakeRange(i--, 1)] intValue];
        if (j >= 0) sum += [[b substringWithRange:NSMakeRange(j--, 1)] intValue];
        carry = sum / 2;
        res = [NSString stringWithFormat:@"%d%@", (sum % 2), res];
    }
    if (carry == 1) res = [NSString stringWithFormat:@"%c%@", '1', res];
    return res;
}

@end
