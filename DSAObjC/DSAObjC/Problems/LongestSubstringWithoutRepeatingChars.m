//
//  LongestSubstringWithoutRepeatingChars.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/18/15.
//  Copyright (c) 2015 WES. All rights reserved.
//
/*
 
 Question:
 Given a string, find the length of the longest substring without repeating characters. For example, the longest substring without repeating letters for “abcabcbb” is “abc”, which the length is 3. For “bbbbb” the longest substring is “b”, with the length of 1.
 
 Solution:
 O(n) runtime, O(1) space – Two iterations:
 How can we look up if a character exists in a substring instantaneously? The answer is to use a simple table to store the characters that have appeared. Make sure you communicate with your interviewer if the string can have characters other than ‘a’–‘z’. (ie, Digits? Upper case letter? Does it contain ASCII characters only? Or even unicode character sets?)
 The next question is to ask yourself what happens when you found a repeated character? For example, if the string is “abcdcedf”, what happens when you reach the second appearance of ‘c’?
 When you have found a repeated character (let’s say at index j), it means that the current substring (excluding the repeated character of course) is a potential maximum, so update the maximum if necessary. It also means that the repeated character must have appeared before at an index i, where i is less than j.
 Since you know that all substrings that start before or at index i would be less than your current maximum, you can safely start to look for the next substring with head which starts exactly at index i + 1.
 Therefore, you would need two indices to record the head and the tail of the current substring. Since i and j both traverse at most n steps, the worst case would be 2n steps, which the runtime complexity must be O(n).
 Note that the space complexity is constant O(1), even though we are allocating an array. This is because no matter how long the string is, the size of the array stays the same at 256.
 
 */

#import "LongestSubstringWithoutRepeatingChars.h"

@implementation LongestSubstringWithoutRepeatingChars

- (void)runTheProblem {
    NSString *s = @"abcccdefgg";
//    NSString *s = @"1234567890";
    NSInteger l = [self lengthOfLongestSubstring:s];
    NSLog(@"%@: string '%@' lengthOfLongestSubstringOptimized:%ld TC:%f", self.class, s, l, timeComplexity);
}

- (NSInteger)lengthOfLongestSubstringOptimized:(NSString *)s {
    NSMutableArray *charMap = [NSMutableArray arrayWithCapacity:256];
    for (int k = 0; k < 256; k++) {
        [charMap addObject:[NSNumber numberWithInteger:-1]];
    }
    NSInteger i = 0, maxLen = 0;
    for (NSInteger j = 0; j < s.length; j++) {
        timeComplexity++;
        if ([charMap[[s characterAtIndex:j]] integerValue] >= i) {
            timeComplexity++;
            i = [charMap[[s characterAtIndex:j]] integerValue] + 1;
        }
        charMap[[s characterAtIndex:j]] = [NSNumber numberWithInteger:j];
        maxLen = MAX(j - i + 1, maxLen);
    }
    return maxLen;
}

- (NSInteger)lengthOfLongestSubstring:(NSString *)s {
    NSMutableArray *exist = [NSMutableArray arrayWithCapacity:256];
    for (int k = 0; k < 256; k++) {
        [exist addObject:[NSNumber numberWithBool:NO]];
    }
    int i = 0, maxLen = 0;
    for (int j = 0; j < s.length; j++) {
        timeComplexity++;
        while ([exist[[s characterAtIndex:j]] boolValue]) {
            timeComplexity++;
            exist[[s characterAtIndex:i]] = [NSNumber numberWithBool:NO];
            i++;
        }
        exist[[s characterAtIndex:j]] = [NSNumber numberWithBool:YES];
        maxLen = MAX(j - i + 1, maxLen);
    }
    return maxLen;
}

@end
