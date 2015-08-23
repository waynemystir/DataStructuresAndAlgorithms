//
//  ValidNumber.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/17/15.
//  Copyright (c) 2015 WES. All rights reserved.
//
/**
 
 Question:
 Validate if a given string is numeric. Some examples:
 "0"  true "0.1"  true "abc"  false
 Example Questions Candidate Might Ask:
 Difficulty: Easy, Frequency: Low
 ￼￼Q: How to account for whitespaces in the string?
 A: When deciding if a string is numeric, ignore both leading and trailing whitespaces.
 Q: Should I ignore spaces in between numbers – such as “1 1”?
 A: No, only ignore leading and trailing whitespaces. “1 1” is not numeric.
 Q: If the string contains additional characters after a number, is it considered valid?
 A: No. If the string contains any non-numeric characters (excluding whitespaces and decimal point), it is not numeric.
 Q: Is it valid if a plus or minus sign appear before the number? A: Yes. “+1” and “-1” are both numeric.
 Q: Should I consider only numbers in decimal? How about numbers in other bases such as hexadecimal (0xFF)?
 A: Only consider decimal numbers. “0xFF” is not numeric.
 Q: Should I consider exponent such as “1e10” as numeric?
 A: No. But feel free to work on the challenge that takes exponent into consideration. (The Online Judge problem does take exponent into account.)
 
 Solution:
 This problem is very similar to Question [8. String to Integer (atoi)]. Due to many corner cases, it is helpful to break the problem down to several components that can be solved individually.
 A string could be divided into these four substrings in the order from left to right:
 s1. Leading whitespaces (optional).
 s2. Plus (+) or minus (–) sign (optional). s3. Number.
 s4. Optional trailing whitespaces (optional).
 We ignore s1, s2, s4 and evaluate whether s3 is a valid number. We realize that a number could either be a whole number or a decimal number. For a whole number, it is easy: We evaluate whether s3 contains only digits and we are done.
 16
 On the other hand, a decimal number could be further divided into three parts:
 a. Integer part
 b. Decimal point
 c. Fractional part
 The integer and fractional parts contain only digits. For example, the number “3.64” has integer part (3) and fractional part (64). Both of them are optional, but at least one of them must present. For example, a single dot ‘.’ is not a valid number, but “1.”, “.1”, and “1.0” are all valid. Please note that “1.” is valid because it implies “1.0”.
 By now, it is pretty straightforward to translate the requirements into code, where the main logic to determine if s3 is numeric from line 6 to line 17.
 
 */

#import "ValidNumber.h"

@implementation ValidNumber

- (void)runTheProblem {
    NSString *string = @"   12345.6";
    NSString *vn = [self validNumber:string] ? @"YES" : @"NO";
    NSLog(@"%@: %@ valid:%@", self.class, string, vn);
}

- (BOOL)validNumber:(NSString *)string {
    int i = 0;
    NSUInteger n = string.length;
    NSCharacterSet *whitespaceSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    while (i < n && [whitespaceSet characterIsMember:[string characterAtIndex:i]]) i++;
    if (i < n && ([string characterAtIndex:i] == '+' || [string characterAtIndex:i] == '-')) i++;
    BOOL isNumeric = NO;
    while (i < n && isdigit([string characterAtIndex:i])) {
        i++;
        isNumeric = YES;
    }
    if (i < n && [string characterAtIndex:i] == '.') {
        i++;
        while (i < n && isdigit([string characterAtIndex:i])) {
            i++;
            isNumeric = YES;
        }
    }
    while (i < n && [whitespaceSet characterIsMember:[string characterAtIndex:i]]) i++;
    return isNumeric && i == n;
}

@end
