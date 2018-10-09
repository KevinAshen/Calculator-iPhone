//
//  CalculatorModel.m
//  Calculator——iPhone
//
//  Created by mac on 2018/9/29.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "CalculatorModel.h"

@implementation CalculatorModel

int priority[7][7] = {1,1,-1,-1,-1,1,1, 1,1,-1,-1,-1,1,1, 1,1,1,1,-1,1,1, 1,1,1,1,-1,1,1,-1,-1,-1,-1,-1,0,-2,1,1,1,1,-2,1,1,-1,-1,-1,-1,-1,-2,0};    //存储优先级关系

- (instancetype)init {
    self = [super init];
    if (self) {
        _flag = 0;
        _inputMut = [[NSMutableArray alloc] init];
    }
    return self;
}

- (int)goldenMethodCheck:(NSString *)str {
    NSString *str1 = [NSString stringWithFormat:@"%@#", str];
    
    
    //操作符栈
    StackSymbol *stackSymbol = malloc(sizeof(StackSymbol));
    stackSymbol->top = -1;
    //pushSymbol(stackSymbol, '#');
    
    char x;
    int i = 0;
    int flag = 0;
    NSLog(@"str是%@", str1);
    x = [str1 characterAtIndex:i];
    NSLog(@"%d^^1", stackSymbol->top);
    while (x != '#' ) {
        if (isBracket(x)) {
            NSLog(@"%d^^2", stackSymbol->top);
            flag = 1;
            NSLog(@"%d^^3", stackSymbol->top);
            NSLog(@"--1--");
            if (x == '(') {
                pushSymbol(stackSymbol, x);
                NSLog(@"--x--");
            } else {
                NSLog(@"--2--");
                NSLog(@"%d^^4", stackSymbol->top);
                if (popSymbolTop(stackSymbol) == 0) {
                    NSLog(@"--3--");
                    return 0;
                }
            }
        }
        //NSLog(@"--4--");
        i++;
        x = [str1 characterAtIndex:i];
        NSLog(@"%d && %c", i, x);
    }
//    if (flag == 1) {
//        return 1;
//    } else {
//        return 0;
//    }
    return 1;

}

-(float)goldenMethod:(NSString *)str{
    str = [str stringByAppendingString:@"#"];
    
    //操作符栈
    StackSymbol *stackSymbol = malloc(sizeof(StackSymbol));
    stackSymbol->top = -1;
    pushSymbol(stackSymbol,'#');
    //操作数栈
    StackNum *stackNum;
    stackNum = malloc(sizeof(StackNum));
    stackNum->top = -1;
    
    char x;
    int i = 0;
    x = [str characterAtIndex:i];
    while (x != '#' || getSymbolTop(stackSymbol) != '#') {
        if (isnumber(x)) {             //取到数字
            float data = 0;
            float v = 10;
            while (isnumber(x) || x == '.'){       //取到操作符结束
                if (x == '.') {
                    i++;
                    x = [str characterAtIndex:i];
                    while (isNumber(x)) {
                        data = data + (x-'0')/v;    //小数处理
                        v = v * 10;
                        i++;
                        x = [str characterAtIndex:i];
                    }
                }else{
                    data = data * 10 + x - '0';
                    i++;
                    x = [str characterAtIndex:i];
                }
            }
            pushNum(stackNum, data);
        }else{                          //取到操作符
            switch (compare(getSymbolTop(stackSymbol),x)) {   //与栈顶操作符比较
                case -1:
                    pushSymbol(stackSymbol, x);  
                    i++;
                    x = [str characterAtIndex:i];
                    
                    break;
                case 1:{
                    float x = getNumTop(stackNum);
                    popNum(stackNum);
                    float y = getNumTop(stackNum);
                    popNum(stackNum);
                    pushNum(stackNum, goldenValue(x, getSymbolTop(stackSymbol), y));  //计算
                    popSymbolTop(stackSymbol);
                    break;
                }
                case 0:
                    popSymbolTop(stackSymbol);
                    i++;
                    x = [str characterAtIndex:i];
                    break;
                default:
                    break;
            }
        }
    }
    return getNumTop(stackNum);
}

int isBracket(char x){
    if (x == '(' || x == ')') {
        return 1;
    } else {
        return 0;
    }
}


//是否为数字
int isNumber(char x){
    if (x >= '0' && x <= '9') {
        return 1;
    }else{
        return 0;
    }
}

int compare(char a, char b) {
    int i = -1;
    int j = -1;
    switch(a) {
        case '#':
            i++;
        case ')':
            i++;
        case '(':
            i++;
        case '/':
            i++;
        case '*':
            i++;
        case '-':
            i++;
        case '+':
            i++;
        default:
            break;
    }
    
    switch(b) {
        case '#':
            j++;
        case ')':
            j++;
        case '(':
            j++;
        case '/':
            j++;
        case '*':
            j++;
        case '-':
            j++;
        case '+':
            j++;
        default:
            break;
    }
    
    if(i >= 0 && j >= 0) {
        return priority[i][j];
    } else {
        return -2;
    }
}
float goldenValue(float x, char symbol,float y){     //计算
    switch (symbol) {
        case '+':
            return y + x;
        case '-':
            return y - x;
        case '*':
            return y * x;
        case '/':
            return y / x;
        default:
            return 0;
            break;
    }
}

//取栈顶元素
char getSymbolTop(StackSymbol *stackSymbol){
    if (stackSymbol -> top == -1) {
        return '0';
    }else{
        return stackSymbol->data[stackSymbol->top];
    }
}

float getNumTop(StackNum *stackNum){
    if (stackNum->top == -1) {
        return 0;
    }else{
        return stackNum->data[stackNum->top];
    }
}

int pushSymbol(StackSymbol *stackSymbol,char symbol){
    if (stackSymbol -> top == Max - 1) {
        return 0 ;
    }else{
        stackSymbol -> top++;
        stackSymbol -> data[stackSymbol->top] = symbol;
        return 1;
    }
}
//操作数
int pushNum(StackNum *stackNum,float number){
    if (stackNum->top == Max - 1) {
        return 0 ;
    }else{
        stackNum->top++;
        stackNum->data[stackNum->top] = number;
        return 1;
    }
}


//栈顶退栈
int popSymbolTop(StackSymbol *stackSymbol){
    if (stackSymbol->top == -1) {
        return 0;
    }else{
        stackSymbol->top = stackSymbol->top-1;
        return 1;
    }
}

int popNum(StackNum *stackNum){
    if (stackNum->top == -1) {
        return 0;
    }else{
        stackNum->top = stackNum->top-1;
        return 1;
    }
}

@end
