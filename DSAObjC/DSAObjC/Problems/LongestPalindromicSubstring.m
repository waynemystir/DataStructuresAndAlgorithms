//
//  LongestPalindromicSubstring.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/18/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import "LongestPalindromicSubstring.h"

@implementation LongestPalindromicSubstring

- (void)runTheProblem {
//    NSString *s = @"ehbvelbjabtyuibaelknbetgnelkfb";
//    NSString *s = @"abcdef";
    NSString *s = @"bbbbbbbbbbbbbbbbbbbb";
//    NSString *s = @"A man, a plan, a canal: Panama";
//    NSString *s = nil;
//    NSString *s = @"amanaplanacanalpanama";
    NSLog(@"%@: string:'%@' longest palindrome:'%@' TC:%f", self.class, s, [self longestPalindrome:s], timeComplexity);
}

- (NSString *)longestPalindrome:(NSString *)s {
    
    NSMutableCharacterSet *lettersAndNumbers = [NSMutableCharacterSet letterCharacterSet];
    [lettersAndNumbers formUnionWithCharacterSet:[NSCharacterSet decimalDigitCharacterSet]];
    NSCharacterSet *discardChars = [lettersAndNumbers invertedSet];
    s = [[s componentsSeparatedByCharactersInSet:discardChars] componentsJoinedByString:@""];
    s = [s lowercaseString];
    
    if (s.length == 0) {
        return @"";
    }
    
    NSInteger start = 0, end = 0;
    for (int i = 0; i < s.length; i++) {
        timeComplexity++;
        NSInteger len1 = [self expandAroundCenter:s left:i right:i];
        NSInteger len2 = [self expandAroundCenter:s left:i right:(i + 1)];
        NSInteger len = MAX(len1, len2);
        if (len > end - start) {
            start = i - (len - 1) / 2;
            end = i + len / 2;
        }
    }
    
    return [s substringWithRange:NSMakeRange(start, end - start + 1)];
}

- (NSInteger)expandAroundCenter:(NSString *)s left:(NSInteger)left right:(NSInteger)right {
    NSInteger L = left, R = right;
    while (L >= 0 && R < s.length && [s characterAtIndex:L] == [s characterAtIndex:R]) {
        timeComplexity++;
        L--;
        R++;
    }
    return R - L - 1;
}

@end
