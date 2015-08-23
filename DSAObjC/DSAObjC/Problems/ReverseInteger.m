//
//  ReverseInteger.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/19/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import "ReverseInteger.h"

@implementation ReverseInteger

- (void)runTheProblem {
    NSInteger x = -1234;
//    NSInteger x = NSIntegerMax+5;
    NSLog(@"\n%ld\n%ld\n%ld\n%ld\n%ld\n%ld\n%ld", NSIntegerMax*10, NSIntegerMax*13, NSIntegerMax*23, NSIntegerMax+1, NSIntegerMax+2, NSIntegerMax+3, NSIntegerMax+4);
    NSLog(@"%@ %ld rev %ld %ld", self.class, x, [self reverseSimple:x], NSIntegerMax);
}

- (NSInteger)reverseSimple:(NSInteger)x {
    NSInteger ret = 0;
    while (x != 0) {
        if (x > NSIntegerMax / 10 || x < NSIntegerMin / 10) {
            return 0;
        }
        ret = ret * 10 + x % 10;
        x /= 10;
    }
    return ret;
}

@end
