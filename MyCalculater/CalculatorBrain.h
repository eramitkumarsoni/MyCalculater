//
//  CalculatorBrain.h
//  MyCalculater
//
//  Created by Avadesh Yadav on 11/1/13.
//  Copyright (c) 2013 Strumsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
- (void)setOperand:(double)anOperand;
- (double)performOperation:(NSString *)operation;
@end
