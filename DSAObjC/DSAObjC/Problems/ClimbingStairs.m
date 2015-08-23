//
//  ClimbingStairs.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/22/15.
//  Copyright (c) 2015 WES. All rights reserved.
//
/*
 
 Question:
 You are climbing a staircase. It takes n steps to reach to the top.
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to
 the top?
 
 O(n) runtime, O(1) space – Dynamic programming: This is a classic Dynamic Programming problem. Define:
 f(n) = number of ways you can climb to the nth step. To reach to the nth step, you have only two choices:
 1. Advance one step from the n – 1th step.
 2. Advance two steps from the n – 2th step.
 Therefore, f(n) = f(n – 1) + f(n – 2), which is the exact same recurrence formula defined
 by the Fibonacci sequence (with different base cases, though). Set base cases f(1) = 1, f(2) = 2 and you are almost done.
 Now, we could calculate f(n) easily by storing previous values in an one dimension array and work our way up to n. Heck, we can even optimize this further by storing just the previous two values.
 
 
 Here's another explanation from Glassdoor:
 Let c(i-1) = the total for a staircase with i-1 steps. Now add one step to the beginning. You have two choices: start with one step and then do c(i-1), or start with two steps and then do c(i-2). In other words, c(i) = c(i-1) + c(i-2). The basis for the recurrence is c(0) = c(1) = 1. This is exactly the Fibonacci sequence. I submit that the solution to this problem of n steps is Fib(n+1). Let's verify for small values of n: 1 steps: There's only one way to take one step. (1) 2 steps: There are 2 ways (1+1) or (2) 3 steps: 3 ways (1+1+1), (1+2), (2+1) 4 steps: 5 ways (1+1+1+1), (1+1+2), (1+2+1), (2+1+1), (2+2)
 
 
 If there's any question about it being Fibonacci, count it out:
 
 1(1)
 
 1
 
 2(2)
 
 11
 2
 
 
 3(3)
 
 111
 12
 21
 
 
 4(5)
 
 1111
 112
 121
 211
 22
 
 
 5(8)
 
 11111
 1112
 1121
 1211
 2111
 221
 212
 122
 
 6(13)
 
 111111
 11112
 11121
 11211
 12111
 21111
 1122
 1221
 2211
 2121
 1212
 2112
 222
 
 7(20)
 
 1111111
 111112
 111121
 111211
 112111
 121111
 211111
 11122
 11221
 12211
 22111
 21211
 12121
 11212
 21121
 21112
 12112
 2221
 2122
 2212
 1222
 
 */

#import "ClimbingStairs.h"

@implementation ClimbingStairs

- (void)runTheProblem {
    NSUInteger steps = 10;
    NSUInteger r = [self climbStairs:steps];
    NSLog(@"%@: steps:%lu combs:%lu", self.class, steps, r);
}

- (NSUInteger)climbStairs:(NSUInteger)steps {
    NSUInteger p = 1, q = 1;
    for (int i = 2; i <= steps; i++) {
        NSUInteger temp = q;
        q += p;
        p = temp;
    }
    return q;
}

@end
