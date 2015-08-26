//
//  Atoi.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/17/15.
//  Copyright (c) 2015 WES. All rights reserved.
//
/**
 
 Question:
 Implement atoi to convert a string to an integer.
 The atoi function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
 The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
 If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
 If no valid conversion could be performed, a zero value is returned. If the correct value is out of the range of representable values, the maximum integer value (2147483647) or the minimum integer value (–2147483648) is returned.
 
 Solution:
 The heart of this problem is dealing with overflow. A direct approach is to store the number as a string so we can evaluate at each step if the number had indeed overflowed. There are some other ways to detect overflow that requires knowledge about how a specific programming language or operating system works.
 A desirable solution does not require any assumption on how the language works. In each step we are appending a digit to the number by doing a multiplication and addition. If the current number is greater than 214748364, we know it is going to overflow. On the other hand, if the current number is equal to 214748364, we know that it will overflow only when the current digit is greater than or equal to 8. Remember to also consider edge case for the smallest number, –2147483648 (–231).
 
 */

#import "Atoi.h"

NSInteger const MaxDiv10 = NSIntegerMax / 10;
NSInteger const MinDiv10 = NSIntegerMin / 10;

@implementation Atoi

- (void)runTheProblem {
    NSString *ascii = @"   -1234567890123456  \n  ";
    NSInteger value = [self atoi:ascii];
    NSLog(@"%@: atoi:%ld TC:%f", self.class, value, timeComplexity);
}

- (NSInteger)atoi:(NSString *)ascii {
    NSInteger i = 0, n = ascii.length;
    while (i < n && [[NSCharacterSet whitespaceAndNewlineCharacterSet] characterIsMember:[ascii characterAtIndex:i]]) {
        i++;
    }
    int sign = 1;
    if (i < n && [ascii characterAtIndex:i] == '+') {
        i++;
    } else if (i < n && [ascii characterAtIndex:i] == '-') {
        sign = -1;
        i++;
    }
    NSInteger num = 0;
    while (i < n) {
        char digit = [ascii characterAtIndex:i];
        
        if (isdigit(digit) == 0) {
            break;
        }
        
        digit = digit - '0';
        
        if (num > MaxDiv10 || (num == MaxDiv10 && digit >= 7)) {
            return sign == 1 ? NSIntegerMax : NSIntegerMin;
        }
        
        num = num * 10 + digit;
        i++;
    }
    return sign * num;
}

- (NSInteger)atoiW:(NSString *)ascii {
    ascii = [ascii stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (ascii.length == 0) {
        return 0;
    }
    char possibleSign = [ascii characterAtIndex:0];
    int sign = 1;
    if (possibleSign == '-') {
        sign = -1;
        ascii = [ascii substringFromIndex:1];
    } else if (possibleSign == '+') {
        ascii = [ascii substringFromIndex:1];
    }
    
    NSInteger num = 0;
    for (int j = 0; j < ascii.length; j++) {
        char digit = [ascii characterAtIndex:j];
        
        if (isdigit(digit) == 0) {
            break;
        }
        
        digit = digit - '0';
        
        if (sign > 0 && (num > MaxDiv10 || (num == MaxDiv10 && digit >= 7))) {
            return NSIntegerMax;
        } else if (sign < 0 && (-1 * num < MinDiv10 || (-1 * num == MinDiv10 && digit >= 8))) {
            return NSIntegerMin;
        }
        
        num = num * 10 + digit;
    }
    
    return sign * num;
}

- (NSInteger)atoiOld:(NSString *)ascii {
    ascii = [ascii stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (ascii.length == 0) {
        return 0;
    }
    char possibleSign = [ascii characterAtIndex:0];
    int positiveOrNegative = 1;
    if (possibleSign == '-') {
        positiveOrNegative = -1;
        ascii = [ascii substringFromIndex:1];
    } else if (possibleSign == '+') {
        ascii = [ascii substringFromIndex:1];
    }
    
    double numberOfDigitsInMaxInt = log10(NSIntegerMax);
    if (positiveOrNegative > 0 && ascii.length >= floor(numberOfDigitsInMaxInt)) {
        return NSIntegerMax;
    } else if (positiveOrNegative < 0 && ascii.length >= floor(numberOfDigitsInMaxInt)) {
        return NSIntegerMin;
    }
    
    NSInteger value = 0;
    for (NSInteger j = 0; j < ascii.length; j++) {
        NSUInteger powerOfTen = ascii.length - 1 - j;
        char c = [ascii characterAtIndex:j] - '0';
        NSInteger nvalue = c * pow(10, powerOfTen);
        value += nvalue;
    }
    
    return positiveOrNegative * value;
}

@end
