//
//  WordBreak.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/16/15.
//  Copyright (c) 2015 WES. All rights reserved.
//
/**
 
 Given a string s and a dictionary of words dict, determine if s can be segmented into a space-separated sequence of one or more dictionary words.
 
 For example, given
 s = "leetcode",
 dict = ["leet", "code"].
 
 Return true because "leetcode" can be segmented as "leet code".
 
 */

#import "WordBreak.h"

@interface WordBreak ()

@property (nonatomic, strong) NSSet *dict;

@end

@implementation WordBreak

- (void)runTheProblem {
    self.dict = [NSSet setWithObjects:@"cap", @"map", nil];
    NSString *res = [self wordBreak:@"capmap" dict:self.dict];
    
//    self.dict = [NSSet setWithObjects:@"a", @"aa", @"aaa", @"aaaa", @"aaaaa", nil];
//    NSString *res = [self wordBreak:@"aaab" dict:self.dict];
    NSLog(@"RES:%@, %f", res, timeComplexity);
}

- (NSString *)wordBreak:(NSString *)input dict:(NSSet *)dict {
    if ([self checkDictionary:input]) return input;
    NSUInteger len = input.length;
    for (int i = 1; i < len; i++) {
        NSString *prefix = [input substringToIndex:i];
        if ([self checkDictionary:prefix]) {
            NSString *suffix = [input substringWithRange:NSMakeRange(i, len - i)];
            NSString *segSuffix = [self wordBreak:suffix dict:dict];
            if (segSuffix) {
                return [NSString stringWithFormat:@"%@ %@", prefix, segSuffix];
            }
        }
    }
    return nil;
}

- (BOOL)checkDictionary:(NSString *)input {
    timeComplexity++;
    NSLog(@"CD: %lu: %@", (unsigned long) input.length, input);
    return [self.dict containsObject:input];
}

@end
