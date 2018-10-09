//
//  CalculatorViewController.h
//  Calculator——iPhone
//
//  Created by mac on 2018/9/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorView.h"
#import "CalculatorModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorViewController : UIViewController

@property (nonatomic, strong)CalculatorView *calculatorView;

@property CalculatorModel *calculatorModel;
@property (nonatomic) NSString *inputStr;

@end

NS_ASSUME_NONNULL_END
