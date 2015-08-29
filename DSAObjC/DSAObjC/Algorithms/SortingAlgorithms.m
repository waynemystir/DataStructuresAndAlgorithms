//
//  SortingAlgorithms.m
//  SortingObjectiveC
//
//  Created by WAYNE SMALL on 8/13/15.
//  Copyright (c) 2015 WES. All rights reserved.
//

#import "SortingAlgorithms.h"

//static long insertionSortCount;

@implementation SortingAlgorithms

// O(n log n)
+ (void)mergeSort:(NSMutableArray *)arr {
    merge_sort(arr, 0, arr.count);
}

void merge_sort(NSMutableArray *arr, NSUInteger first, NSUInteger last) {
    if (first + 1 < last) {
        NSUInteger mid = (first + last) / 2;
        merge_sort(arr, first, mid);
        merge_sort(arr, mid, last);
        merge(arr, first, mid, last);
    }
}

void merge(NSMutableArray *arr, NSUInteger first, NSUInteger mid, NSUInteger last) {
    NSMutableArray *tempArr = [[NSMutableArray alloc] init];
    NSUInteger indexA = first;
    NSUInteger indexB = mid;
    
    while (indexA < mid && indexB < last) {
        NSNumber *numA = [arr objectAtIndex:indexA];
        NSNumber *numB = [arr objectAtIndex:indexB];
        
        if (numA.integerValue < numB.integerValue) {
            [tempArr addObject:numA];
            indexA++;
        }
        else {
            [tempArr addObject:numB];
            indexB++;
        }
    }
    
    while (indexA < mid) {
        [tempArr addObject:[arr objectAtIndex:indexA]];
        indexA++;
    }
    
    while (indexB < last) {
        [tempArr addObject:[arr objectAtIndex:indexB]];
        indexB++;
    }
    
    indexA = first;
    
    for (NSUInteger i = 0; i < tempArr.count; i++) {
        [arr replaceObjectAtIndex:indexA withObject:[tempArr objectAtIndex:i]];
        indexA++;
    }
}

// O(n^2)
+ (void)insertionSort:(NSMutableArray *)arr {
    for (NSUInteger i = 1; i < arr.count; i++) {
        NSUInteger j = i;
        NSNumber *target = arr[i];
        
        while (j > 0 && target.integerValue < [arr[j - 1] integerValue]) {
            [arr exchangeObjectAtIndex:j withObjectAtIndex:j - 1];
            j--;
        }
//        [arr replaceObjectAtIndex:j withObject:target];
    }
}

// O(n^2)
+ (void)selectionSort:(NSMutableArray *)arr {
    NSUInteger minIndex = 0;
    
    for (NSUInteger i = 0; i < arr.count - 1; i++) {
        minIndex = i;
        
        for (NSUInteger j = i + 1; j < arr.count; j++) {
            if ([[arr objectAtIndex:j] integerValue] < [[arr objectAtIndex:minIndex] integerValue]) {
                minIndex = j;
            }
        }
        
        if (minIndex != i) {
            [arr exchangeObjectAtIndex:i withObjectAtIndex:minIndex];
        }
    }
}

// O(n^2)
+ (void)bubbleSort:(NSMutableArray *)arr {
    BOOL swapped = YES;
    NSUInteger k = 0;
    
    while (swapped) {
        swapped = NO;
        
        for (NSInteger i = 0; i < arr.count - 1 - k; i++) {
            if ([[arr objectAtIndex:i] integerValue] > [[arr objectAtIndex:i + 1] integerValue]) {
                [arr exchangeObjectAtIndex:i withObjectAtIndex:i + 1];
                swapped = YES;
            }
        }
        k++;
    }
}

@end
