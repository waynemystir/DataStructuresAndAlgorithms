//
//  TwoSumDataStructureFastFind.m
//  DSAObjC
//
//  Created by WAYNE SMALL on 8/25/15.
//  Copyright (c) 2015 WES. All rights reserved.
//
/*
 
 Question:
 Design and implement a TwoSum class. It should support the following operations: add and find.
 add(input) – Add the number input to an internal data structure.
 find(value) – Find if there exists any pair of numbers which sum is equal to the value.
 For example,
 add(1); add(3); add(5); find(4)true; find(7)false
 
 */

#import "TwoSumDataStructureFastFind.h"

@interface TwoSumDataStructureFastFind ()

@property (nonatomic, strong) NSMutableDictionary *pairSumsTable;
@property (nonatomic, strong) NSMutableArray *inputArray;

@end

@implementation TwoSumDataStructureFastFind

- (void)runTheProblem {
    [self add:1];
    [self add:3];
    [self add:5];
    [self add:5];
    NSString *f4 = [self find:4] ? @"YES" : @"NO";
    NSString *f7 = [self find:7] ? @"YES" : @"NO";
    NSString *f10 = [self find:10] ? @"YES" : @"NO";
    NSLog(@"%@:Found 4:%@ Found 7:%@ Found 10:%@", self.class, f4, f7, f10);
}

- (id)init {
    if (self = [super init]) {
        _pairSumsTable = [NSMutableDictionary new];
        _inputArray = [NSMutableArray array];
    }
    return self;
}

- (void)add:(NSInteger)input {
    [self.inputArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSInteger on = [obj integerValue];
        NSString *ps = [NSString stringWithFormat:@"%lu,%lu", input, on];
        [self.pairSumsTable setObject:ps forKey:[NSNumber numberWithInteger:(input + on)]];
    }];
    
    [self.inputArray addObject:[NSNumber numberWithInteger:input]];
}

- (BOOL)find:(NSInteger)val {
    return nil != [self.pairSumsTable objectForKey:[NSNumber numberWithInteger:val]];
}

@end
