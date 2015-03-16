//
//  LPOperations.m
//  CalculatorApp
//
//  Created by Leandro Pessini on 3/10/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import "LPOperations.h"

@implementation LPOperations

-(NSNumber *)doTheMath:(NSMutableArray *)arrayWithValues
{

    NSNumber *result;
//    NSNumber *firstValue, *secondValue;

    NSExpression *expression = [NSExpression expressionWithFormat:@"4 + 5 - 2**3"];
    id value = [expression expressionValueWithObject:nil context:nil];


    NSLog(@"%@", value);


//    [firstValue initWithDouble:[arrayWithValues firstObject]];
//
//    firstValue = [arrayWithValues firstObject];
//
//    secondValue = [NSNumber va:[arrayWithValues lastObject]];
//
//    result = firstValue * secondValue;

    return result;
    
}

@end
