//
//  ViewController.m
//  BillSplitter
//
//  Created by NICE on 2018-08-12.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *splitBillAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfPeopleLabel;
@property (weak, nonatomic) IBOutlet UISlider *numberOfPeopleSlider;
@property (nonatomic) NSNumber *billAmount;
@property (nonatomic) NSNumber *numberOfPeople;
@property (nonatomic) NSNumberFormatter *numberFormatter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.numberFormatter = [[NSNumberFormatter alloc] init];
    [self.numberFormatter setFormatterBehavior:NSNumberFormatterBehaviorDefault];
    [self.numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    [self setupBillAmountTextField];
    self.numberOfPeople = [NSNumber numberWithFloat:self.numberOfPeopleSlider.value];
    self.numberOfPeopleLabel.text = [NSString stringWithFormat:@"Number of People: %@", self.numberOfPeople];
}

- (void)setupBillAmountTextField {
    self.billAmountTextField.delegate = self;
    self.billAmountTextField.keyboardType = UIKeyboardTypeNumberPad;
}


- (IBAction)splitBillButton:(id)sender {
    [self.billAmountTextField resignFirstResponder];
    
    self.billAmount = [self.numberFormatter numberFromString:self.billAmountTextField.text];
    self.splitBillAmountLabel.text = [NSString stringWithFormat:@"split bill amout: $ %@", [self splitBillAmount]];
    
    
    [self.numberFormatter stringFromNumber:[self splitBillAmount]];
}

- (NSNumber *)splitBillAmount {
    return [NSNumber numberWithFloat:(self.billAmount.floatValue / self.numberOfPeople.floatValue)];
}


- (IBAction)sliderValueChanged:(id)sender {
    self.numberOfPeople = [NSNumber numberWithInteger:self.numberOfPeopleSlider.value];
    self.numberOfPeopleLabel.text = [NSString stringWithFormat:@"Number of People: %@", self.numberOfPeople];
}


@end
