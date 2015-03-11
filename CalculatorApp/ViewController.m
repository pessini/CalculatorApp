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

@property NSMutableArray *arrayValues;

- (IBAction)onButtonTapped:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark IBAction

- (IBAction)onButtonTapped:(UIButton *)sender
{
    if ([self checkStringIsInteger:sender.currentTitle] || [sender.currentTitle isEqualToString:@"."])
    {
         NSLog(@"Number: %@",sender.currentTitle);
    }
    else if ([self checkStringIsOperation:sender.currentTitle])
    {
        NSLog(@"Operation: %@", sender.currentTitle);
    }
}

#pragma mark Helper's Methods

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

}

@end
