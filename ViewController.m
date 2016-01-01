//
//  ViewController.m
//  MultiplyJ
//
//  Created by Matt Deuschle on 12/12/15.
//  Copyright © 2015 Matt Deuschle. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) IBOutlet UILabel *answerLabel;
@property (strong, nonatomic) IBOutlet UILabel *sliderLabel;

@property int sliderInt;
@property int textFieldInt;
@property int answerInt;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

// calculate helper method
-(void)onCalculateMethod;
{
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        self.textFieldInt = [self.textField.text intValue];
        self.sliderInt = [self.sliderLabel.text intValue];
        self.answerInt = self.textFieldInt * self.sliderInt;
        self.answerLabel.text = [NSString stringWithFormat:@"%i", self.answerInt];
    }
    else
    {
        self.textFieldInt = [self.textField.text intValue];
        self.sliderInt = [self.sliderLabel.text intValue];
        self.answerInt = self.textFieldInt / self.sliderInt;
        self.answerLabel.text = [NSString stringWithFormat:@"%i", self.answerInt];
    }
    if (self.answerInt >= 20) {
        self.view.backgroundColor = [UIColor greenColor];
    }
    else
    {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    if ((self.answerInt % 3 == 0) && (self.answerInt % 5 == 0)) {
        self.answerLabel.text = [NSString stringWithFormat:@"FizzBuzz"];
    }
    else if ((self.answerInt % 3 == 0) && !(self.answerInt % 5 == 0)) {
        self.answerLabel.text = [NSString stringWithFormat:@"Fizz"];
    }
    else if ((self.answerInt % 5 == 0) && !(self.answerInt % 3 == 0)) {
        self.answerLabel.text = [NSString stringWithFormat:@"Buzz"];
    }
}

// dismiss keyboard action from textField
- (IBAction)dismissKeyboard:(id)sender {
    [self onCalculateMethod];
}

- (IBAction)onSliderMoved:(UISlider *)slider {
    self.sliderLabel.text = [NSString stringWithFormat:@"%.0f", slider.value];
}

- (IBAction)onButtonPressed:(id)sender {
    [self onCalculateMethod];
}

@end
