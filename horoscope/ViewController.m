//
//  ViewController.m
//  horoscope
//
//  Created by LK on 2017/11/22.
//  Copyright © 2017年 LK. All rights reserved.
//

#import "ViewController.h"
#import "test0.h"
#import "test1.h"
#import "test2.h"
#import "test3.h"
#import "test5.h"
//#import "horoscope-Bridging-Header.h"

static NSInteger createBtnNum = 9;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i < createBtnNum; i++)
    {
        [self createBtntag:i];
    }
    
//    [self setBtnTag:100 withName:@"tapjoy"];
    [self setBtnTag:101 withName:@"facebookLogin"];
    [self setBtnTag:102 withName:@"google AD"];
    [self setBtnTag:103 withName:@"searchBar"];
    [self setBtnTag:104 withName:@"pop animal"];
}

-(void)createBtntag:(NSInteger)tag
{
    NSString *strName = [NSString stringWithFormat:@"test%@",@(tag)];
    
    float numWidth = 80;
    float edgeWidth = 10;
    NSInteger allNumber = mScreenWidth/(numWidth + edgeWidth);
    
    NSInteger section = tag%allNumber;
    NSInteger row = tag/allNumber;
    
    UIButton *btn1 = [UIButton initWitFrame:CGRectZero tag:(100 + tag) title:strName targer:self action:@selector(buttonClick:)];
    btn1.frame = CGRectMake(edgeWidth + section*(numWidth + edgeWidth), 40 + numWidth * row , numWidth, 40);
    [btn1 setBackgroundColor:kRandomColor];
    [self.view addSubview:btn1];
}

-(void)buttonClick:(UIButton *)button
{
    NSInteger btnTag = button.tag - 100;
    if (btnTag == 5) {
        
//        Stest6 *test6 = [[Stest6 alloc]init];
//        [test6 testshow]
    }
    
    NSString *strName = [NSString stringWithFormat:@"test%@",@(btnTag)];
    
    Class tmpClass = NSClassFromString(strName);
    UIViewController *tmpVtrl = [[tmpClass alloc] init];
    tmpVtrl.title = strName;
    UINavigationController *tmpNav = [[UINavigationController alloc]initWithRootViewController:tmpVtrl];
    [self presentViewController:tmpNav animated:YES completion:^{
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
