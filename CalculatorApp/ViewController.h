//
//  ViewController.h
//  CalculatorApp
//
//  Created by Leandro Pessini on 3/10/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

-(BOOL)checkStringIsInteger:(NSString *)toCheck;
-(void)resetButton;
-(BOOL)checkStringIsOperation:(NSString *)toCheck;

@end

