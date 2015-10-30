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
@property (nonatomic, strong) NSMutableDictionary *memoized;

@end

@implementation WordBreak

- (id)init {
    if (self = [super init]) {
//        _dict = [NSSet setWithObjects:@"cap", @"map", nil];
        _dict = [NSSet setWithObjects:@"a", @"aa", @"aaa", @"aaaa", @"aaaaa", nil];
        _memoized = [NSMutableDictionary dictionary];
    }
    
    return self;
}

- (void)runTheProblem {
//    NSString *res = [self wordBreakMemoized:@"capmap" dict:self.dict];
    NSString *res = [self wordBreakMemoized:@"aaab" dict:self.dict];
    NSLog(@"RES:%@, %f", res, timeComplexity);
}

// O(n^2)
- (NSString *)wordBreakMemoized:(NSString *)input dict:(NSSet *)dict {
    if ([self checkDictionary:input]) return input;
    // TODO: Do I need to check for non-NSNull here?
    if ([self.memoized objectForKey:input]) return [self.memoized objectForKey:input];
    
    NSUInteger len = input.length;
    for (int i = 1; i < len; i++) {
        NSString *prefix = [input substringToIndex:i];
        if ([self checkDictionary:prefix]) {
            NSString *suffix = [input substringWithRange:NSMakeRange(i, len - i)];
            NSString *segSuffix = [self wordBreakMemoized:suffix dict:dict];
            if (segSuffix) {
                NSString *rs = [NSString stringWithFormat:@"%@ %@", prefix, suffix];
                [self.memoized setObject:rs forKey:input];
                return rs;
            }
        }
    }
    
    [self.memoized setObject:[NSNull null] forKey:input];
    return nil;
}

// O(2^n)
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
