//
//  CensusResults.m
//  Puzzle
//
//  Created by Matthew Lintlop on 12/1/17.
//  Copyright © 2017 Matthew Lintlop. All rights reserved.
//

#import "CensusResults.h"

@implementation CensusResults

- (instancetype)init {
    if (self = [super init]) {
        self.populations = @[@18897109, @12828837, @9461105, @6371773, @5965343, @5946800, @5582170, @5564635, @5268860, @4552402, @4335391, @4296250, @4224851, @4192887, @3439809, @3279833, @3095313, @2812896, @2783243, @2710489, @2543482, @2356285, @2226009, @2149127, @2142508, @2134411];
    }
    
    return self;
}

- (void) subset_sum:(NSArray<NSNumber*>*)numbers target:(int)target {
    [self subset_sumRecursive:numbers target:target partial:[NSArray array]];
}

- (void) subset_sumRecursive:(NSArray<NSNumber*>*)numbers target:(int)target partial:(NSArray<NSNumber*>*)partial {
    int sum = 0;
    for (NSNumber *number in partial) {
        sum += number.intValue;
    }
    if (sum == target) {
        printf("sum = %d : [", sum);
        for (NSNumber *number in partial) {
            printf("%d, ",number.intValue);
        }
        printf("]\n");
    }
    if (sum >= target) return;
    
    NSNumber* n = nil;
    int count = numbers.count;
    for (int index = 0; index < count; index++) {
        n = numbers[index];
        NSMutableArray<NSNumber*>* remaining = [NSMutableArray array];
        for (int index2 = index; index2 < count; index2++) {
            if (index2 == index) continue;
            [remaining addObject:numbers[index2]];
        }
        
        NSMutableArray<NSNumber*>* partial_rec = partial.mutableCopy;
        [partial_rec addObject:n];
        [self subset_sumRecursive:remaining target:target partial:partial_rec];
    }
    
}

- (void)doTest {
    [self subset_sum:self.populations target:100000000];
}

@end
