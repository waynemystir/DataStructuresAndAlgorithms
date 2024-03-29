//
//  PlusOne.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/19/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import "PlusOne.h"

@implementation PlusOne

- (void)runTheProblem {
//    NSMutableArray *digits = [@[@5, @6, @1, @7, @3] mutableCopy];
    NSMutableArray *digits = [@[@9, @9, @9] mutableCopy];
    NSString *rd = [[[self plusOne:digits] valueForKey:@"description"] componentsJoinedByString:@""];
    NSLog(@"%@:plusone:%@", self.class, rd);
}

- (NSArray *)plusOne:(NSMutableArray *)digits {
    for (NSInteger j = digits.count - 1; j >= 0; j--) {
        NSUInteger digit = [digits[j] integerValue];
        if (digit < 9) {
            digits[j] = @(++digit);
            return [digits copy];
        } else digits[j] = @(0);
    }
    
    [digits addObject:@(0)];
    digits[0] = @(1);
    
    return [digits copy];
}

@end
