//
//  AddTwoNumberStrings.m
//  DSAObjC
//
//  Created by WAYNE SMALL on 9/23/15.
//  Copyright © 2015 WES. All rights reserved.
//

#import "AddTwoNumberStrings.h"

@implementation AddTwoNumberStrings

- (void)runTheProblem {
//    NSString *xVal = @"1039";
//    NSString *yVal = @"4536345";
    NSString *xVal = @"10999";
    NSString *yVal = @"999";
    NSLog(@"x:%@ y:%@ sum:%@", xVal, yVal, [self addNNumber:xVal withNumber:yVal]);
}

- (NSString *)addNNumber:(NSString *)x withNumber:(NSString *)y {
    NSString *responseString = @"";
    int carry = 0;
    NSInteger i = x.length - 1;
    NSInteger j = y.length - 1;
    
    while (i >= 0 || j >= 0) {
        int xDig = i < 0 ? 0 : [x characterAtIndex:i--] - '0';
        int yDig = j < 0 ? 0 : [y characterAtIndex:j--] - '0';
        int sum = xDig + yDig + carry;
        responseString = [NSString stringWithFormat:@"%@%@", @(sum % 10), responseString];
        carry = sum / 10;
    }
    
    return carry == 0 ? responseString : [NSString stringWithFormat:@"%@%@", @(1), responseString];
}

- (NSString *)OLDaddNNumber:(NSString *)x withNumber:(NSString *)y {
    
    NSUInteger maxCount = MAX(x.length, y.length);
    NSUInteger shortCount = MIN(x.length, y.length);
    NSString *longerNumber = y.length > x.length ? y : x;
    NSString *shorterNumber = longerNumber == y ? x : y;
    
    
    NSString *responseString = @"";
    int carry = 0;
    
    for(NSInteger j = maxCount - 1, k = shortCount - 1; j >= 0; j--, k--) {
        
        int jInt = [longerNumber characterAtIndex:j] - '0';
        int kInt = k < 0 ? 0 : [shorterNumber characterAtIndex:k] - '0';
        
        int digitSum = jInt + kInt + carry;
        responseString = [NSString stringWithFormat:@"%@%@", @(digitSum % 10), responseString];
        carry = digitSum / 10;
        
    }
    
    responseString = carry == 0 ? responseString : [NSString stringWithFormat:@"%@%@", @(1), responseString];
    
    return responseString;
    
}

@end
