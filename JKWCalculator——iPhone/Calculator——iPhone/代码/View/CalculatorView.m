//
//  CalculatorView.m
//  Calculator——iPhone
//
//  Created by mac on 2018/9/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//414 x 736

#import "CalculatorView.h"
#define JKWDeviceWidth [UIScreen mainScreen].bounds.size.width
#define JKWDeviceHeight [UIScreen mainScreen].bounds.size.height

@implementation CalculatorView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _inputTextField = [[UITextField alloc] init];
        _inputTextField.textAlignment = NSTextAlignmentRight;
        _inputTextField.font = [UIFont systemFontOfSize:30];
        _inputTextField.textColor = [UIColor whiteColor];
        _inputTextField.tintColor =[UIColor clearColor];
        [self addSubview:_inputTextField];
        
        _ACButton = [[JKWMathButton alloc] init];
        _ACButton.backgroundColor = [UIColor colorWithRed:0.65f green:0.65f blue:0.65f alpha:1.00f];
        [_ACButton setTitle:@"AC" forState:UIControlStateNormal];
        [_ACButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _ACButton.titleLabel.font = [UIFont systemFontOfSize:30];
        _ACButton.tag = 1;
        [self addSubview:_ACButton];
        
        _leftButton = [[JKWMathButton alloc] init];
        _leftButton.backgroundColor = [UIColor colorWithRed:0.65f green:0.65f blue:0.65f alpha:1.00f];
        [_leftButton setTitle:@"(" forState:UIControlStateNormal];
        [_leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _leftButton.titleLabel.font = [UIFont systemFontOfSize:40];
        _leftButton.tag = 2;
        [self addSubview:_leftButton];
        
        _rightButton = [[JKWMathButton alloc] init];
        _rightButton.backgroundColor = [UIColor colorWithRed:0.65f green:0.65f blue:0.65f alpha:1.00f];
        [_rightButton setTitle:@")" forState:UIControlStateNormal];
        [_rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:40];
        _rightButton.tag = 3;
        [self addSubview:_rightButton];
        
        _divisionButton = [[JKWMathButton alloc] init];
        _divisionButton.backgroundColor = [UIColor colorWithRed:0.97f green:0.58f blue:0.10f alpha:1.00f];
        [_divisionButton setTitle:@"÷" forState:UIControlStateNormal];
        _divisionButton.titleLabel.font = [UIFont systemFontOfSize:50];
        _divisionButton.tag = 4;
        [self addSubview:_divisionButton];
        
        _sevenButton = [[JKWMathButton alloc] init];
        [_sevenButton setTitle:@"7" forState:UIControlStateNormal];
        _sevenButton.tag = 5;
        [self addSubview:_sevenButton];
        
        _eightButton = [[JKWMathButton alloc] init];
        [_eightButton setTitle:@"8" forState:UIControlStateNormal];
        _eightButton.tag = 6;
        [self addSubview:_eightButton];
        
        _nineButton = [[JKWMathButton alloc] init];
        [_nineButton setTitle:@"9" forState:UIControlStateNormal];
        _nineButton.tag = 7;
        [self addSubview:_nineButton];
        
        _multiplyButton = [[JKWMathButton alloc] init];
        _multiplyButton.backgroundColor = [UIColor colorWithRed:0.97f green:0.58f blue:0.10f alpha:1.00f];
        [_multiplyButton setTitle:@"×" forState:UIControlStateNormal];
        _multiplyButton.titleLabel.font = [UIFont systemFontOfSize:50];
        _multiplyButton.tag = 8;
        [self addSubview:_multiplyButton];
        
        _fourButton = [[JKWMathButton alloc] init];
        [_fourButton setTitle:@"4" forState:UIControlStateNormal];
        _fourButton.tag = 9;
        [self addSubview:_fourButton];
        
        _fiveButton = [[JKWMathButton alloc] init];
        [_fiveButton setTitle:@"5" forState:UIControlStateNormal];
        _fiveButton.tag = 10;
        [self addSubview:_fiveButton];
        
        _sixButton = [[JKWMathButton alloc] init];
        [_sixButton setTitle:@"6" forState:UIControlStateNormal];
        _sixButton.tag = 11;
        [self addSubview:_sixButton];
        
        _minusButton = [[JKWMathButton alloc] init];
        _minusButton.backgroundColor = [UIColor colorWithRed:0.97f green:0.58f blue:0.10f alpha:1.00f];
        [_minusButton setTitle:@"-" forState:UIControlStateNormal];
        _minusButton.titleLabel.font = [UIFont systemFontOfSize:50];
        _minusButton.tag = 12;
        [self addSubview:_minusButton];
        
        _oneButton = [[JKWMathButton alloc] init];
        [_oneButton setTitle:@"1" forState:UIControlStateNormal];
        _oneButton.tag = 13;
        [self addSubview:_oneButton];
        
        _twoButton = [[JKWMathButton alloc] init];
        [_twoButton setTitle:@"2" forState:UIControlStateNormal];
        _twoButton.tag = 14;
        [self addSubview:_twoButton];
        
        _threeButton = [[JKWMathButton alloc] init];
        [_threeButton setTitle:@"3" forState:UIControlStateNormal];
        _threeButton.tag = 15;
        [self addSubview:_threeButton];
        
        _plusButton = [[JKWMathButton alloc] init];
        _plusButton.backgroundColor = [UIColor colorWithRed:0.97f green:0.58f blue:0.10f alpha:1.00f];
        [_plusButton setTitle:@"+" forState:UIControlStateNormal];
        _plusButton.titleLabel.font = [UIFont systemFontOfSize:50];
        _plusButton.tag = 16;
        [self addSubview:_plusButton];
        
        _zeroButton = [[JKWMathButton alloc] init];
        _zeroButton.titleLabel.textAlignment = NSTextAlignmentLeft;
        _zeroButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_zeroButton setTitle:@"    0" forState:UIControlStateNormal];
        _zeroButton.tag = 17;
        [self addSubview:_zeroButton];
        
        _dotButton = [[JKWMathButton alloc] init];
        [_dotButton setTitle:@"." forState:UIControlStateNormal];
        _dotButton.tag = 18;
        [self addSubview:_dotButton];
        
        _equalButton = [[JKWMathButton alloc] init];
        _equalButton.backgroundColor = [UIColor colorWithRed:0.97f green:0.58f blue:0.10f alpha:1.00f];
        [_equalButton setTitle:@"=" forState:UIControlStateNormal];
        _equalButton.titleLabel.font = [UIFont systemFontOfSize:50];
        _equalButton.tag = 19;
        [self addSubview:_equalButton];
        

        
        _buttonArr = [NSArray arrayWithObjects:_ACButton, _leftButton, _rightButton, _divisionButton, _sevenButton, _eightButton, _nineButton, _multiplyButton, _fourButton, _fiveButton, _sixButton, _minusButton, _oneButton, _twoButton, _threeButton, _plusButton, _zeroButton, _dotButton, _equalButton, nil];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _inputTextField.frame = CGRectMake(0, 0, JKWDeviceWidth, 200);
    int i = 0;
    int j = 0;
    _ACButton.frame = CGRectMake(14 + (88 + 12) * i, 230 + (88 + 12) * j, 88, 88);
    i++;
    _leftButton.frame = CGRectMake(14 + (88 + 12) * i, 230 + (88 + 12) * j, 88, 88);
    i++;
    _rightButton.frame = CGRectMake(14 + (88 + 12) * i, 230 + (88 + 12) * j, 88, 88);
    i++;
    _divisionButton.frame = CGRectMake(14 + (88 + 12) * i, 230 + (88 + 12) * j, 88, 88);
    i = 0;
    j++;
    _sevenButton.frame = CGRectMake(14 + (88 + 12) * i, 230 + (88 + 12) * j, 88, 88);
    i++;
    _eightButton.frame = CGRectMake(14 + (88 + 12) * i, 230 + (88 + 12) * j, 88, 88);
    i++;
    _nineButton.frame = CGRectMake(14 + (88 + 12) * i, 230 + (88 + 12) * j, 88, 88);
    i++;
    _multiplyButton.frame = CGRectMake(14 + (88 + 12) * i, 230 + (88 + 12) * j, 88, 88);
    i = 0;
    j++;
    _fourButton.frame = CGRectMake(14 + (88 + 12) * i, 230 + (88 + 12) * j, 88, 88);
    i++;
    _fiveButton.frame = CGRectMake(14 + (88 + 12) * i, 230 + (88 + 12) * j, 88, 88);
    i++;
    _sixButton.frame = CGRectMake(14 + (88 + 12) * i, 230 + (88 + 12) * j, 88, 88);
    i++;
    _minusButton.frame = CGRectMake(14 + (88 + 12) * i, 230 + (88 + 12) * j, 88, 88);
    i = 0;
    j++;
    _oneButton.frame = CGRectMake(14 + (88 + 12) * i, 230 + (88 + 12) * j, 88, 88);
    i++;
    _twoButton.frame = CGRectMake(14 + (88 + 12) * i, 230 + (88 + 12) * j, 88, 88);
    i++;
    _threeButton.frame = CGRectMake(14 + (88 + 12) * i, 230 + (88 + 12) * j, 88, 88);
    i++;
    _plusButton.frame = CGRectMake(14 + (88 + 12) * i, 230 + (88 + 12) * j, 88, 88);
    i = 2;
    j++;
    _dotButton.frame = CGRectMake(14 + (88 + 12) * i, 230 + (88 + 12) * j, 88, 88);
    i++;
    _equalButton.frame = CGRectMake(14 + (88 + 12) * i, 230 + (88 + 12) * j, 88, 88);
    _zeroButton.frame = CGRectMake(14, 230 + (88 + 12) * 4, 188, 88);
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
