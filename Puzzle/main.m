//
//  main.m
//  Puzzle
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
        [censusResults findPopulationsWithSum:100000000];
   }
    return 0;
}

