//
//  test1.m
//  horoscope
//
//  Created by LK on 2017/11/22.
//  Copyright © 2017年 LK. All rights reserved.
//

#import "test1.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface test1 ()


@property(nonatomic, copy)NSString *strTest;
@property(nonatomic, assign)NSInteger intBlock;

@property(nonatomic, copy)NSString *strTest2;
@property(nonatomic, assign)NSInteger intBlock2;

@end

@implementation test1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn1 = [UIButton initWitFrame:CGRectMake(10, 50, 75, 40) tag:1 title:@"facebookLogin" targer:self action:@selector(buttonClick:)];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton initWitFrame:CGRectMake(90, 50, 75, 40) tag:2 title:@"btn2" targer:self action:@selector(buttonClick:)];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton initWitFrame:CGRectMake(170, 50, 75, 40) tag:3 title:@"btn3" targer:self action:@selector(buttonClick:)];
    [self.view addSubview:btn3];
    
    [self initModel];
}

-(void)initModel
{
    self.intBlock = 10;
    self.strTest = @"10";
    
    self.intBlock2 = 10;
    self.strTest2 = @"10";
}

-(void)buttonClick:(UIButton *)button
{
    switch (button.tag) {
        case 1:
            {
                [self btnLogin];
            }
            break;
        case 2:
        {
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                [self testFlage];
            });
            
        }
            break;
        case 3:
        {
            [self textResult];;
        }
            break;
            
        default:
            break;
    }
}

-(void)testFlage
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.intBlock = 20;
        self.strTest = @"20";
    });
    
    [UIView animateWithDuration:0.2 animations:^{
        
    } completion:^(BOOL finished) {
        self.intBlock2 = 20;
        self.strTest2 = @"20";
    }];
    
}

-(void)textResult
{
    NSLog(@"intBlock-->>%@  strTest-->>%@  intBlock2-->>%@  strTest2-->>%@",@(self.intBlock),self.strTest,@(self.intBlock2),self.strTest2);
}



-(void)btnLogin
{
    
//    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
//    // Optional: Place the button in the center of your view.
//    loginButton.center = self.view.center;
//    [self.view addSubview:loginButton];
//    loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
//    return;
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logOut];//这个一定要写，不然会出现换一个帐号就无法获取信息的错误  @"user_about_me"
    
//    NSArray *arrayPermission = @[@"public_profile",@"email",@"user_friends"];
    NSArray *arrayPermission = @[@"public_profile",@"email"];
    
    [login logInWithReadPermissions: arrayPermission fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        
        if (error) {
            
            NSLog(@"Process error");
            
        } else if (result.isCancelled) {
            
            NSLog(@"Cancelled");
            
        } else {
            
            NSLog(@"succeed-->>%@",result);//fields
            
            FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                          initWithGraphPath:result.token.userID
                                          parameters:@{@"fields": @"id,cover,name,first_name,last_name,age_range,link,gender,locale,picture,timezone,updated_time,verified,email"}
                                          HTTPMethod:@"GET"];
            
            [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result,NSError *error) {
                
                // Handle the result
                NSLog(@"result-->>%@",result);
                NSLog(@"%@,%@,%@",result[@"id"],result[@"name"],result[@"email"]);
                
            }];
            
        }
    }];
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
