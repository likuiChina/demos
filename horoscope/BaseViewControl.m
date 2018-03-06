//
//  BaseViewControl.m
//  horoscope
//
//  Created by LK on 2017/11/22.
//  Copyright © 2017年 LK. All rights reserved.
//

#import "BaseViewControl.h"

@interface BaseViewControl ()

@end

@implementation BaseViewControl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createLeftDismissBtn];
    [self createNormolBtn];
}

-(NSArray *)arrayTitle
{
    if (!_arrayTitle) {
        _arrayTitle = [NSArray array];
    }
    return _arrayTitle;
}


-(void)createNormolBtn
{
    if (self.arrayTitle.count)
    {
        [self createBtnNumber:self.arrayTitle.count];
    }
    else
    {
        [self createBtnNumber:5];
    }
}

-(void)createBtnNumber:(NSInteger)btnNum
{
    for (int i = 0; i < btnNum; i++)
    {
        [self createBtntag:i];
    }
}

-(void)createBtntag:(NSInteger)tag
{
    NSString *strName = [NSString stringWithFormat:@"test%@",@(tag)];
    if (self.arrayTitle.count > tag)
    {
        strName = [_arrayTitle objectAtIndex:tag];
    }
    
    float numWidth = 80;
    float edgeWidth = 10;
    NSInteger allNumber = mScreenWidth/(numWidth + edgeWidth);
    
    NSInteger section = tag%allNumber;
    NSInteger row = tag/allNumber;
    
    UIButton *btn1 = [UIButton initWitFrame:CGRectZero tag:tag title:strName targer:self action:@selector(buttonClick:)];
    btn1.frame = CGRectMake(edgeWidth + section*(numWidth + edgeWidth), 15 + numWidth * row , numWidth, 40);
    [btn1 setBackgroundColor:kRandomColor];
    [btn1.titleLabel setFont:sFont(14)];
    btn1.tag = (100 + tag);
    [self.view addSubview:btn1];
}



-(void)buttonClick:(UIButton *)button
{
    NSLog(@"---->>>到子类实现此方法");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
