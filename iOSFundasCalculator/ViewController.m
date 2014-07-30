//
//  ViewController.m
//  iOSFundasCalculator
//
//  Created by Vinay Raj on 30/07/14.
//  Copyright (c) 2014 Vinay Raj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

/*  As we are developing a calculator app of two inputs we expect them to be numbers and theeby we need to restrict the keyboard text to numbers. We do this in the attributes inspector of text field in storyboard by changing the setting for keyboard to number pad  */


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-( void )viewDidAppear:(BOOL)animated
{
    if( self.view.frame.size.height >= 480 )
    {
        NSLog(@"Log : 3.5 inch display --- ");
        
        // Bring the input 1 to focus
        [self.txtInput1 becomeFirstResponder];
        
        // Shift the frame of layout container up
        // Make sure that autolayout is unchecked in the storyboard inspector for resizing to work
        
        CGRect layoutFrame = self.vwLayoutContainer.frame;
        layoutFrame.origin.y -= 50;
        self.vwLayoutContainer.frame = layoutFrame;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnAddClicked:(id)sender {
    
    if( [self isInputFieldsValid] )
    {
        self.lblResult.text = [NSString stringWithFormat:@"The result of %@ + %@ is %d", self.txtInput1.text, self.txtInput2.text, (self.txtInput1.text.intValue + self.txtInput2.text.intValue)];
    }
    else
        self.lblResult.text = @"Input/s were found to be blank. Please fill input fields";

}


- (IBAction)btnMultiplyClicked:(id)sender {
    
    if( [self isInputFieldsValid] )
        self.lblResult.text = [NSString stringWithFormat:@"The result of %@ * %@ is %d", self.txtInput1.text, self.txtInput2.text, (self.txtInput1.text.intValue * self.txtInput2.text.intValue)];
    else
        self.lblResult.text = @"Input/s were found to be blank. Please fill input fields";
}


- (IBAction)btnSubtractClicked:(id)sender {
    
    if( [self isInputFieldsValid] )
        self.lblResult.text = [NSString stringWithFormat:@"The result of %@ - %@ is %d", self.txtInput1.text, self.txtInput2.text, (self.txtInput1.text.intValue - self.txtInput2.text.intValue)];
    else
        self.lblResult.text = @"Input/s were found to be blank. Please fill input fields";
}


- (IBAction)btnDivideClicked:(id)sender {
    
    if( [self isInputFieldsValid] )
    {
        if( self.txtInput2.text.intValue > 0 )
        {
            self.lblResult.text = [NSString stringWithFormat:@"The result of %@ / %@ is %d", self.txtInput1.text, self.txtInput2.text, (self.txtInput1.text.intValue / self.txtInput2.text.intValue)];
        }
        else
            self.lblResult.text = @"Denominator cannot be zero. Invalid input";
    }
    else
        self.lblResult.text = @"Input/s were found to be blank. Please fill input fields";
}

// Delegate function to dismiss keyboard on tapping the view
- (IBAction)dismissKeyBoard:(id)sender {
    [self.txtInput1 resignFirstResponder];
    [self.txtInput2 resignFirstResponder];
}

// Check validity of input fields before performing arithmetic

-(BOOL)isInputFieldsValid
{
    if( [self isStringValid:self.txtInput1.text] && [self isStringValid:self.txtInput2.text] )
        return YES;
    return NO;
}


// Function to check validity of a string. Should generally be written as a category method for NSString class

-(BOOL)isStringValid : (NSString*)input
{
    if( input != nil && input.length > 0 )
        return YES;
    return NO;
}


#pragma mark textfield delegates

// This is used to dismiss the keyboard on click of return button if the keyboard type is not number pad

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

// Delegate function to change color of status bar to light content

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
