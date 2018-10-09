//
//  CalculatorViewController.m
//  Calculator——iPhone
//
//  Created by mac on 2018/9/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "CalculatorViewController.h"

#define JKWDeviceWidth [UIScreen mainScreen].bounds.size.width
#define JKWDeviceHeight [UIScreen mainScreen].bounds.size.height

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _inputStr = @"0";
    
    _calculatorView = [[CalculatorView alloc] initWithFrame:CGRectMake(0, 0, JKWDeviceWidth, JKWDeviceHeight)];
    [self.view addSubview:_calculatorView];
    
    _calculatorModel = [[CalculatorModel alloc] init];
    for (UIButton *everyButton in _calculatorView.buttonArr) {
        [everyButton addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    

}

- (void)touchButton:(UIButton *)seclectButton {
    //NSLog(@"%lu", seclectButton.tag);
    NSArray *symbolArr = @[@"(", @")", @"/", @"7", @"8", @"9", @"*", @"4", @"5", @"6", @"-", @"1", @"2", @"3", @"+", @"0", @".", @"="];
    if (seclectButton.tag == 1) {
        [_calculatorModel.inputMut removeAllObjects];
        _inputStr = [NSString stringWithFormat:@""];
    } else if (seclectButton.tag == 19) {
        //_calculatorModel.flag = 0;
        float tempFloat = [_calculatorModel goldenMethod:_inputStr];
        _inputStr = [NSString stringWithFormat:@""];
        _inputStr = [NSString stringWithFormat:@"%.2f", tempFloat];
    } else if (seclectButton.tag == 4 || seclectButton.tag == 8 || seclectButton.tag == 12 || seclectButton.tag == 16) {
        if ([_calculatorModel.inputMut.lastObject isEqualToString:symbolArr[4 - 2]] || [_calculatorModel.inputMut.lastObject isEqualToString:symbolArr[8 - 2]] ||[_calculatorModel.inputMut.lastObject isEqualToString:symbolArr[12 - 2]] ||[_calculatorModel.inputMut.lastObject isEqualToString:symbolArr[16 - 2]] || [_calculatorModel.inputMut.lastObject isEqualToString:symbolArr[18 - 2]]) {
            
        } else {
            _calculatorModel.flag = 0;
             [_calculatorModel.inputMut addObject:symbolArr[seclectButton.tag - 2]];
        }
        _inputStr = [NSString stringWithFormat:@""];
        for (int  i = 0; i < [_calculatorModel.inputMut count] ; i++ ) {
            _inputStr  = [_inputStr stringByAppendingString:[_calculatorModel.inputMut objectAtIndex:i]];
        }
    } else if (seclectButton.tag == 2 || seclectButton.tag == 3) {
        _inputStr = [NSString stringWithFormat:@""];
        for (int  i = 0; i < [_calculatorModel.inputMut count] ; i++ ) {
            _inputStr  = [_inputStr stringByAppendingString:[_calculatorModel.inputMut objectAtIndex:i]];
        }
        NSString *str1 = [NSString stringWithFormat:@"%@%@", _inputStr, symbolArr[seclectButton.tag - 2]];
        NSLog(@"%@", str1);
        if ([_calculatorModel goldenMethodCheck:str1]) {
            [_calculatorModel.inputMut addObject:symbolArr[seclectButton.tag - 2]];
        }
        _inputStr = [NSString stringWithFormat:@""];
        for (int  i = 0; i < [_calculatorModel.inputMut count] ; i++ ) {
            _inputStr  = [_inputStr stringByAppendingString:[_calculatorModel.inputMut objectAtIndex:i]];
        }
    } else {
        if([symbolArr[seclectButton.tag - 2] isEqualToString:@"."] && ([_calculatorModel.inputMut.lastObject isEqualToString:symbolArr[4 - 2]] || [_calculatorModel.inputMut.lastObject isEqualToString:symbolArr[8 - 2]] || [_calculatorModel.inputMut.lastObject isEqualToString:symbolArr[12 - 2]] || [_calculatorModel.inputMut.lastObject isEqualToString:symbolArr[16 - 2]] || [_calculatorModel.inputMut.lastObject isEqualToString:symbolArr[18 - 2]])) {
            
        } else if ([symbolArr[seclectButton.tag - 2] isEqualToString:@"."] && _calculatorModel.flag == 0){
            [_calculatorModel.inputMut addObject:symbolArr[seclectButton.tag - 2]];
            _calculatorModel.flag = 1;
        } else if ([symbolArr[seclectButton.tag - 2] isEqualToString:@"."]) {
            
        } else {
            [_calculatorModel.inputMut addObject:symbolArr[seclectButton.tag - 2]];
        }
        _inputStr = [NSString stringWithFormat:@""];
        for (int  i = 0; i < [_calculatorModel.inputMut count] ; i++ ) {
            _inputStr  = [_inputStr stringByAppendingString:[_calculatorModel.inputMut objectAtIndex:i]];
        }
    }
    _calculatorView.inputTextField.text = _inputStr;
   
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
