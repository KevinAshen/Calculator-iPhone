//
//  JKWMathButton.m
//  Calculator——iPhone
//
//  Created by mac on 2018/9/29.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "JKWMathButton.h"

@implementation JKWMathButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 44;
        self.titleLabel.font = [UIFont systemFontOfSize:40];
        self.backgroundColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
        [self setTitleColor:[UIColor whiteColor] forState:normal];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
