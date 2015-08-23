//
//  ReverseWords.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/17/15.
//  Copyright (c) 2015 WES. All rights reserved.
//
/**
 
 Question:
 Given an input string s, reverse the string word by word.
 For example, given s = "the sky is blue", return "blue is sky the".
 
 */

#import "ReverseWords.h"

@implementation ReverseWords

- (void)runTheProblem {
    NSString *string = @"dan \tackroyd\t\n was cool\n\t";
    NSLog(@"%@: reversed:'%@' TC:%f", self.class, [self reverseWords:string], timeComplexity);
}

- (NSString *)reverseWords:(NSString *)string {
    NSUInteger wordEnd = string.length;
    NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *reversed = @"";
    
    for (NSInteger wordStart = string.length - 1; wordStart >= 0; wordStart--) {
        if ([whiteSpace characterIsMember:[string characterAtIndex:wordStart]]) {
            wordEnd = wordStart;
        } else if ([whiteSpace characterIsMember:[string characterAtIndex:(wordStart - 1)]]
                        || wordStart == 0) {
            if (reversed.length) {
                reversed = [reversed stringByAppendingString:@" "];
            }
            reversed = [reversed stringByAppendingString:[string substringWithRange:NSMakeRange(wordStart, wordEnd - wordStart)]];
        }
    }
    
    return reversed;
}

@end
