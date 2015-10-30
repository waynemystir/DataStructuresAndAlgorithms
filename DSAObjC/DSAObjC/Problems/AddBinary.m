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
    NSString *sum = [self addBinary:a binary2:b];
    NSLog(@"%@ + %@ = %@", a, b, sum);
}

- (NSString *)addBinary:(NSString *)x binary2:(NSString *)y {
    NSString *responseString = @"";
    int carry = 0;
    NSInteger i = x.length - 1;
    NSInteger j = y.length - 1;
    
    while (i >= 0 || j >= 0) {
        int xDig = i < 0 ? 0 : [x characterAtIndex:i--] - '0';
        int yDig = j < 0 ? 0 : [y characterAtIndex:j--] - '0';
        int sum = xDig + yDig + carry;
        responseString = [NSString stringWithFormat:@"%@%@", @(sum % 2), responseString];
        carry = sum / 2;
    }
    
    return carry == 0 ? responseString : [NSString stringWithFormat:@"%@%@", @(1), responseString];
}

- (NSString *)OLDaddBinary:(NSString *)a binary2:(NSString *)b {
    NSString *theSum = @"";
    long i = a.length - 1, j = b.length - 1;
    int carry = 0;
    
    while (i >= 0 || j >= 0) {
        int sum = carry;
        if (i >= 0) {
            int ath = ([a characterAtIndex:i--] - '0');
            sum += ath;
        }
        if (j >= 0) {
            int bth = ([b characterAtIndex:j--] - '0');
            sum += bth;
        }
        carry = sum / 2;
        theSum = [NSString stringWithFormat:@"%d%@", (sum % 2), theSum];
        NSLog(@"theSum:%@", theSum);
    }
    
    if (carry == 1) theSum = [NSString stringWithFormat:@"%c%@", '1', theSum];
    return theSum;
}

- (NSString *)addBinaryOldOLD:(NSString *)a binary2:(NSString *)b {
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
