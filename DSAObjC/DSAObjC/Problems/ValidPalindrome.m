//
//  ValidPalindrome.m
//  LeetCode
//
//  Created by WAYNE SMALL on 8/17/15.
//  Copyright (c) 2015 WES. All rights reserved.
//
/**
 
 Question:
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
 For example,
 "A man, a plan, a canal: Panama" is a palindrome. "race a car" is not a palindrome.
 Example Questions Candidate Might Ask:
 Q: What about an empty string? Is it a valid palindrome?
 A: For the purpose of this problem, we define empty string as valid palindrome.
 
 */

#import "ValidPalindrome.h"
#import "AppDelegate.h"

@implementation ValidPalindrome

- (void)runTheProblem {
//    NSString *str = @"12345678900987654321";
//    NSString *str = @"A man, a plan, a canal: Panama";
    NSString *str = @"abcdefedcba";
//    NSString *str = nil;
    NSString *isPalindrome = [self isValidPalindrome:str] ? @"YES" : @"NO";
    NSLog(@"%@: '%@' isPalindrome:%@ TC:%f", self.class, str, isPalindrome, timeComplexity);
}

- (BOOL)isValidPalindrome:(NSString *)string {
    
    NSMutableCharacterSet *lettersAndNumbers = [NSMutableCharacterSet letterCharacterSet];
    [lettersAndNumbers formUnionWithCharacterSet:[NSCharacterSet decimalDigitCharacterSet]];
    NSCharacterSet *discardChars = [lettersAndNumbers invertedSet];
    string = [[string componentsSeparatedByCharactersInSet:discardChars] componentsJoinedByString:@""];
    string = [string lowercaseString];
    
    if (string.length == 0) {
        return @"";
    }
    
    // One approach is to reverse the string and check equality
//    NSString *reversedString = [self reverseString:string];
//    return [reversedString isEqualToString:string];
    
    // A more efficient approach is to check the end characters and
    // iteratively check towards the middle
    NSUInteger length = string.length;
    NSUInteger halfLength = length / 2;
    
    for (int j = 0; j < halfLength; j++) {
        timeComplexity++;
        char lc = [string characterAtIndex:j];
        char rc = [string characterAtIndex:(length - j - 1)];
        if (lc != rc) {
            return NO;
        }
    }
    
    return YES;
}

- (NSString *)reverseString:(NSString *)string {
    if (!string) {
        return nil;
    }
    
    NSString *reversedString = @"";
    for (NSInteger j = string.length - 1; j >= 0; j--) {
        timeComplexity++;
        char c = [string characterAtIndex:j];
        reversedString = [reversedString stringByAppendingFormat:@"%c", c];
    }
    
    return reversedString;
}

@end
