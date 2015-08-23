//
//  TwoSumDataStructure.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/17/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import "TwoSumDataStructure.h"

@interface TwoSumDataStructure ()

@property (nonatomic, strong) NSMutableDictionary *inputTable;

@end

@implementation TwoSumDataStructure

- (void)runTheProblem {
    [self add:1];
    [self add:3];
    [self add:5];
//    [self add:5];
    NSString *f4 = [self find:4] ? @"YES" : @"NO";
    NSString *f7 = [self find:7] ? @"YES" : @"NO";
    NSString *f10 = [self find:10] ? @"YES" : @"NO";
    NSLog(@"%@:Found 4:%@ Found 7:%@ Found 10:%@", self.class, f4, f7, f10);
}

- (id)init {
    if (self = [super init]) {
        _inputTable = [NSMutableDictionary new];
    }
    return self;
}

- (void)add:(NSInteger)input {
    NSUInteger count = [[self.inputTable objectForKey:[NSNumber numberWithInteger:input]] integerValue];
    [self.inputTable setObject:[NSNumber numberWithInteger:++count] forKey:[NSNumber numberWithInteger:input]];
}

- (BOOL)find:(NSInteger)val {
    for (NSNumber *numberInput in self.inputTable.allKeys) {
        NSInteger x = [numberInput integerValue];
        NSInteger y = val - x;
        if (y == x) {
            // For duplicates, ensure there are at least two individual numbers.
            NSUInteger count = [[self.inputTable objectForKey:numberInput] integerValue];
            if (count >= 2) {
                return YES;
            }
        } else if ([self.inputTable objectForKey:[NSNumber numberWithInteger:y]]) {
            return YES;
        }
    }
    return NO;
}

@end
