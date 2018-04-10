//
//  test2.m
//  horoscope
//
//  Created by LK on 2017/12/1.
//  Copyright © 2017年 LK. All rights reserved.
//

#import "test2.h"
#import "googleADmanage.h"
//#import "LkSdk.h"


@interface test2 ()

@property(nonatomic, strong)UIView *redView;

@end

@implementation test2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _redView = [[UIView alloc]initWithFrame:CGRectMake(150, 250, 100, 100)];
    _redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_redView];
    
    self.title = @"googleTitle";
    
    [self setBtnTag:100 withName:@"测试"];
    [self setBtnTag:101 withName:@"vedioAD"];
    [self setBtnTag:102 withName:@"插屏ad"];
    
    [[googleADmanage sharegoogleADmanage] requestScreenAd];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonClick:(UIButton *)button
{
    NSLog(@"子类实现了");
    switch (button.tag) {
        case 100:
        {
//            [WSProgressHUD showWithStatus:@"000"];
//            [LkSdk showAlert];

        }
            break;
        case 101:
        {
            
//            [[googleADmanage sharegoogleADmanage]showAudio:self.navigationController];
        }
            break;
        case 102:
        {

            [[googleADmanage sharegoogleADmanage] showScreenAD:self.navigationController];
            
        }
            break;
            
        case 103:
        {
            self.redView.transform = CGAffineTransformIdentity;
        }
            break;
            
        default:
            break;
    }
    
}

//            self.redView.transform = CGAffineTransformScale(self.redView.transform,1.5,1.5);
//            self.redView.transform = CGAffineTransformScale(self.redView.transform,2.5,2.5);
//            self.redView.transform = CGAffineTransformScale(self.redView.transform,0.5,0.5);

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
