//
//  main.m
//  CensusPuzzle
//
//  Created by Matthew Lintlop on 12/1/17.
//  Copyright © 2017 Matthew Lintlop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CensusResults.h"
#include <stdio.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CensusResults *censusResults = [[CensusResults alloc] init];
        int sum = 100000000;
        NSArray *results = [censusResults findPopulationsWithSum:100000000];
        if (results) {
            printf("%ld city population's sum = %d :\n[", results.count, sum);
            [results enumerateObjectsUsingBlock:^(NSNumber*  _Nonnull number, NSUInteger idx, BOOL * _Nonnull stop) {
                if (idx < (results.count-1))
                    printf("%d, ",number.intValue);
               else
                   printf("%d]\n",number.intValue);
            }];
        }
        else {
            printf("No city population's sum = %d\n", sum);
        }
   }
    return 0;
}

