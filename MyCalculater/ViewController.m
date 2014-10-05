//
//  ViewController.m
//  MyCalculater
//
//  Created by Avadesh Yadav on 10/31/13.
//  Copyright (c) 2013 Strumsoft. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@property NSString *operator;
@property double operand1,operand2,result;
@property NSString *str;
@property BOOL isUserIsContinueInEnteringNumber;
@property BOOL operationPressed;
@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.isUserIsContinueInEnteringNumber=YES;
    
    
	// Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - UIAction Method

- (IBAction)digitPressed:(UIButton *)sender

{
    NSString *digit = [[sender titleLabel] text];
    
    if(self.isUserIsContinueInEnteringNumber)
    {
        self.displayLabel.text = [[self.displayLabel text] stringByAppendingString:sender.titleLabel.text];
    }
    else
    {
        [self.displayLabel setText:digit];
        self.isUserIsContinueInEnteringNumber=YES;
    }
}

-(IBAction)operationPressed:(UIButton *)sender
{
    if(![sender.titleLabel.text isEqual: @"="])
    {
        self.operator = [[sender titleLabel] text];
    }
    
    if(self.isUserIsContinueInEnteringNumber)
    {
       if(self.operationPressed)
       {
        self.isUserIsContinueInEnteringNumber=NO;
        self.operand2 = [[self.displayLabel text] floatValue];
           
       }
        else
        {self.isUserIsContinueInEnteringNumber=NO;
            self.operand1 = [[self.displayLabel text] floatValue];
            self.operationPressed=YES;
            
            
            
        }
        [self performOperation:self.operator];
    }
    
   // self.displayLabel.text = [NSString stringWithFormat:@"%f",result];
                     
}

- (void)performOperation:(NSString *)operator
{
    if([operator isEqualToString:@"sqrt"])
    { self.operand1 = sqrt(self.operand1);
    self.displayLabel.text = [NSString stringWithFormat:@"%f",self.operand1];

    }
    if(self.operand2)
    {
    NSLog(@"%f",self.operand1);
    NSLog(@"%f",self.operand2);
    [self watingOperation];
    }
}

- (void)watingOperation
{
    if([self.operator isEqualToString:@"+"])
    {
    
        self.operand1 = self.operand1 +self.operand2;
    }
    if([self.operator isEqualToString:@"*"])
    {
        
        self.operand1 = self.operand1 *self.operand2;
    }
    if([self.operator isEqualToString:@"-"])
    {
        
        self.operand1 = self.operand1 - self.operand2;
    }
    if([self.operator isEqualToString:@"/"])
    {
    
        self.operand1 = self.operand1 /self.operand2;
    }
    
     self.displayLabel.text = [NSString stringWithFormat:@"%f",self.operand1];

}

@end
