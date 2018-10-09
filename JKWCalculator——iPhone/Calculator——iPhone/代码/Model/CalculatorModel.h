//
//  CalculatorModel.h
//  Calculator——iPhone
//
//  Created by mac on 2018/9/29.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <Foundation/Foundation.h>
#define Max 100
NS_ASSUME_NONNULL_BEGIN

@interface CalculatorModel : NSObject

typedef struct{
    char data[Max];
    int top;
}StackSymbol;
typedef struct{
    float data[Max];
    int top;
}StackNum;
-(float)goldenMethod:(NSString *)str;
-(int)goldenMethodCheck:(NSString *)str;

@property (nonatomic, strong) NSMutableArray *inputMut;
@property int flag;


@end

NS_ASSUME_NONNULL_END
