//
//  ViewController.h
//  iOSFundasCalculator
//
//  Created by Vinay Raj on 30/07/14.
//  Copyright (c) 2014 Vinay Raj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lblResult;
@property (weak, nonatomic) IBOutlet UIView *vwLayoutContainer;
@property (weak, nonatomic) IBOutlet UITextField *txtInput2;
@property (weak, nonatomic) IBOutlet UITextField *txtInput1;
@end
