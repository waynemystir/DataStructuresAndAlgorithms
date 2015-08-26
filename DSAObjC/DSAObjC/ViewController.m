//
//  ViewController.m
//  DSAObjC
//
//  Created by WAYNE SMALL on 8/23/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import "ViewController.h"
#import "HashTable.h"
#import "WisDigit.h"
#import "WordBreak.h"
#import "AddBinary.h"
#import "TwoSum.h"
#import "TwoSumSorted.h"
#import "TwoSumDataStructureFastAdd.h"
#import "TwoSumDataStructureFastFind.h"
#import "ValidPalindrome.h"
#import "StrStr.h"
#import "ReverseWords.h"
#import "Atoi.h"
#import "ValidNumber.h"
#import "LongestSubstringWithoutRepeatingChars.h"
#import "MissingRanges.h"
#import "LongestPalindromicSubstring.h"
#import "IsOneEditDistance.h"
#import "ReverseInteger.h"
#import "PlusOne.h"
#import "PalindromeNumber.h"
#import "AddTwoNumbers.h"
#import "SwapNodesInPairs.h"
#import "MaxSumSubArray.h"
#import "ClimbingStairs.h"
#import "ValidateBinarySearchTree.h"
#import "MaximumDepthBinaryTree.h"
#import "MinimumDepthBinaryTree.h"
#import "IsHeightBalancedTree.h"
#import "SortedArrayToBalancedBinarySearchTree.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 100, 30)];
    l.text = @"Wayne";
    l.textColor = [UIColor whiteColor];
    l.backgroundColor = [UIColor blackColor];
    [self.view addSubview:l];
    
//    [[WisDigit new] runThis];
    
    [[LongestPalindromicSubstring new] runTheProblem];
    
//    HashTable *ht = [[HashTable alloc] initWithSize:1000];
//    [ht put:@"ab" object:@"albert einstein"];
//    [ht put:@"cd" object:@"charles dickens"];
//    [ht put:@"nl" object:@"ned nugent"];
//    [ht put:@"ef" object:@"edward whatever"];
//    [ht put:@"gh" object:@"george costanza"];
//    [ht put:@"ij" object:@"indiana jones"];
//    [ht put:@"cd" object:@"caldwell jones"];
//    [ht put:@"kl" object:@"kanyon bay"];
//    [ht put:@"mn" object:@"michael jordan"];
//    [ht put:@"op" object:@"opie and andie"];
//    
//    NSLog(@"GET cd:%@", [ht get:@"cd"]);
//    
//    [ht enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
//        NSLog(@"ENUMER key:%@ obj:%@", key, obj);
//        *stop = [key isEqualToString:@"ab"];
//    }];
//    
//    NSLog(@"KEYS:%@", [ht.allKeys componentsJoinedByString:@", "]);
//    NSLog(@"OBJECTS:%@", [ht.allObjects componentsJoinedByString:@", "]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
