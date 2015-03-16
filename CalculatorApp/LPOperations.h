//
//  LPOperations.h
//  CalculatorApp
//
//  Created by Leandro Pessini on 3/10/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LPOperations : NSObject

@property NSMutableArray *arrayValuesForMathOperations;

-(NSNumber *)doTheMath:(NSMutableArray *)arrayWithValues;

@end
