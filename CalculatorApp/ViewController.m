//
//  ViewController.m
//  CalculatorApp
//
//  Created by Leandro Pessini on 3/10/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *calculateButton;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@property NSString *stringWithValues;
@property (nonatomic)  NSMutableArray *arrayWithValues;

@property int readyToCalculate;

- (IBAction)onButtonTapped:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}

#pragma mark Lazy Instantition
- (NSMutableArray *)arrayWithValues {
    if (_arrayWithValues == nil) _arrayWithValues = [[NSMutableArray alloc] init];
    return _arrayWithValues;
}

#pragma mark IBAction

- (IBAction)onButtonTapped:(UIButton *)sender
{

    /*  int readyToCalculate;
        = 0 - first time
        = 1 - a number for the first time
        = 2 - operation symbol
        = 3 - second number
        = 4 - ready to calculate
     */

    if ([self checkStringIsInteger:sender.currentTitle] || [sender.currentTitle isEqualToString:@"."])
    {
        [self.arrayWithValues addObject:sender.currentTitle];

        if (self.readyToCalculate == 2)
        {
            self.readyToCalculate = 3;
        }
        else
        {
            self.readyToCalculate = 1;
        }

        NSMutableString * result = [[NSMutableString alloc] init];
        for (NSObject * obj in self.arrayWithValues)
        {
            [result appendString:[obj description]];
        }

        self.displayLabel.text = result;

    }
    else if ([self checkStringIsOperation:sender.currentTitle])
    {

        if (self.readyToCalculate == 3)
        {
            self.displayLabel.text = [NSString stringWithFormat:@"%@",[self calculate:self.arrayWithValues]];
            [self.arrayWithValues removeAllObjects];
            [self.arrayWithValues addObject:self.displayLabel.text];
        }
        else
        {
            self.readyToCalculate = 2;
        }

        self.displayLabel.text = [self.displayLabel.text stringByAppendingString:sender.currentTitle];

        if ([sender.currentTitle isEqualToString:@"×"])
        {
            [self.arrayWithValues addObject:@"*"];
        }
        else if ([sender.currentTitle isEqualToString:@"÷"])
        {
            [self.arrayWithValues addObject:@"/"];
        }
        else
        {
            [self.arrayWithValues addObject:sender.currentTitle];
        }

    }
    else
    {
        if ([sender.currentTitle isEqualToString:@"C"])
        {
            [self resetButton];
        }
        else if ([sender.currentTitle isEqualToString:@"="])
        {
            self.readyToCalculate = 4;
        }
    }


    if (self.readyToCalculate == 4) {
        self.displayLabel.text = [NSString stringWithFormat:@"%@",[self calculate:self.arrayWithValues]];
        [self.arrayWithValues removeAllObjects];
        [self.arrayWithValues addObject:self.displayLabel.text];
    }

    NSLog(@"%i", self.readyToCalculate);
}

#pragma mark Helper's Methods

- (id)calculate:(NSMutableArray *)arrayWithValuesToBeCalculate
{

    NSMutableString * result = [[NSMutableString alloc] init];
    for (NSObject * obj in arrayWithValuesToBeCalculate)
    {
        [result appendString:[obj description]];
    }

    NSExpression *expression = [NSExpression expressionWithFormat:result];
    id value = [expression expressionValueWithObject:nil context:nil];

    return value;

}

-(BOOL)checkStringIsInteger:(NSString *)toCheck
{
    NSCharacterSet *_NumericOnly = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *myStringSet = [NSCharacterSet characterSetWithCharactersInString:toCheck];

    if ([_NumericOnly isSupersetOfSet: myStringSet])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(BOOL)checkStringIsOperation:(NSString *)toCheck
{
    if ([toCheck isEqualToString:@"+"] || [toCheck isEqualToString:@"−"] || [toCheck isEqualToString:@"×"] || [toCheck isEqualToString:@"÷"] || [toCheck isEqualToString:@"%"]) {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(void)resetButton
{

    // clean the NSMutableArray and set the displayLabel to 0

    [self.arrayWithValues removeAllObjects];
    self.readyToCalculate = 0;
    self.displayLabel.text = @"0";

}

@end
