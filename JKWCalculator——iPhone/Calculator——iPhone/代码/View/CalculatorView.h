//
//  CalculatorView.h
//  Calculator——iPhone
//
//  Created by mac on 2018/9/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKWMathButton.h"


NS_ASSUME_NONNULL_BEGIN

@interface CalculatorView : UIView

@property (nonatomic, strong) JKWMathButton *ACButton;
@property (nonatomic, strong) JKWMathButton *leftButton;
@property (nonatomic, strong) JKWMathButton *rightButton;
@property (nonatomic, strong) JKWMathButton *divisionButton;
@property (nonatomic, strong) JKWMathButton *sevenButton;
@property (nonatomic, strong) JKWMathButton *eightButton;
@property (nonatomic, strong) JKWMathButton *nineButton;
@property (nonatomic, strong) JKWMathButton *multiplyButton;
@property (nonatomic, strong) JKWMathButton *fourButton;
@property (nonatomic, strong) JKWMathButton *fiveButton;
@property (nonatomic, strong) JKWMathButton *sixButton;
@property (nonatomic, strong) JKWMathButton *minusButton;
@property (nonatomic, strong) JKWMathButton *oneButton;
@property (nonatomic, strong) JKWMathButton *twoButton;
@property (nonatomic, strong) JKWMathButton *threeButton;
@property (nonatomic, strong) JKWMathButton *plusButton;
@property (nonatomic, strong) JKWMathButton *zeroButton;
@property (nonatomic, strong) JKWMathButton *dotButton;
@property (nonatomic, strong) JKWMathButton *equalButton;
@property (nonatomic) NSArray *buttonArr;

@property (nonatomic, strong) UITextField *inputTextField;



@end

NS_ASSUME_NONNULL_END
