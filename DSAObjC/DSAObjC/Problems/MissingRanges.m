//
//  MissingRanges.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/18/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import "MissingRanges.h"

@implementation MissingRanges

- (void)runTheProblem {
    NSArray *vals = @[@3, @24, @25, @26, @55, @97];
    NSArray *ranges = [self missingRanges:vals start:0 end:99];
    NSString *jRanges = [ranges componentsJoinedByString:@":"];
    NSLog(@"%@: ranges:%@", self.class, jRanges);
}

- (NSArray *)missingRanges:(NSArray *)vals start:(NSInteger)start end:(NSInteger)end {
    NSMutableArray *ranges = [NSMutableArray array];
    NSInteger prev = start - 1;
    for (NSInteger i = 0; i <= vals.count; i++) {
        NSInteger curr = (i == vals.count) ? end + 1 : [vals[i] integerValue];
        if (curr - prev >= 2) [ranges addObject:[self daRange:(prev + 1) to:(curr - 1)]];
        prev = curr;
    }
    return [ranges copy];
}

- (NSString *)daRange:(NSInteger)from to:(NSInteger)to {
    return (from == to) ? [NSString stringWithFormat:@"%ld", from] : [NSString stringWithFormat:@"%ld->%ld", from, to];
}

@end
