//
//  ViewController.m
//  Calculator
//
//  Created by Jeremi Kaczmarczyk on 26.04.2015.
//  Copyright (c) 2015 Jeremi Kaczmarczyk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (strong, nonatomic) NSMutableString *digitString;
@property (strong, nonatomic) NSString *functionCall;
@property (strong, nonatomic) UIButton *functionButton;
@property (nonatomic) int index;
@property (nonatomic) int digit;

@end

@implementation ViewController

- (IBAction)touchDigit:(id)sender {

    UIButton *clickedButton = (UIButton *)sender;
    NSString *currentValue = [sender currentTitle];

    [UIView animateWithDuration:0.15 animations:^{
    [clickedButton setBackgroundColor:[UIColor orangeColor]];
    } completion:^(BOOL finished){
        [UIView animateWithDuration:0.1 animations:^{
        [clickedButton setBackgroundColor:[UIColor lightGrayColor]];
        }];
    }];
    
    if ((self.index) || ([currentValue intValue])) {
    [self.digitString insertString:currentValue atIndex:self.index];
    [self.displayLabel setText:self.digitString];
    self.index++;
    }
}

- (IBAction)touchFunction:(id)sender {
    
    self.functionCall = [sender currentTitle];
    
    if (!self.digit){
    self.digit = [self.digitString intValue];
    }
    
    self.index=0;
    self.digitString = [NSMutableString new];
    self.functionButton = [sender self];

    [UIView animateWithDuration:0.1 animations:^{
        [self.functionButton setBackgroundColor:[UIColor orangeColor]];
    }];
}

- (IBAction)touchEnter:(id)sender {
    int result;
    if ([self.functionCall  isEqual: @"+"]) {
        result = self.digit + [self.digitString intValue];
    } else if ([self.functionCall  isEqual: @"-"]) {
        result = self.digit - [self.digitString intValue];
    } else if ([self.functionCall  isEqual: @"*"]) {
        result = self.digit * [self.digitString intValue];
    }
    
    self.digit = result;
    
    NSString *resultText = [NSString stringWithFormat:@"%d",result];
    [self.displayLabel setText:resultText];
    self.digitString = [NSMutableString new];
    self.index = 0;
    
    [UIView animateWithDuration:0.1 animations:^{
        [self.functionButton setBackgroundColor:[UIColor lightGrayColor]];
    }];
}

- (IBAction)touchClear:(id)sender {
    self.index=0;
    self.digit=0;
    self.digitString = [NSMutableString new];
    [self.displayLabel setText:@"_"];
    
    [UIView animateWithDuration:0.1 animations:^{
        [self.functionButton setBackgroundColor:[UIColor lightGrayColor]];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUp];
}

- (void)setUp {
    [self digitButtonsSetUp];
    self.digitString = [NSMutableString new];
    self.index = 0;
    self.digit = 0;
}

- (void)digitButtonsSetUp {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
