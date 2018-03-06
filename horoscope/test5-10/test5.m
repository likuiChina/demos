//
//  test5.m
//  horoscope
//
//  Created by LK on 2018/3/6.
//  Copyright © 2018年 LK. All rights reserved.
//

#import "test5.h"
#import <objc/runtime.h>

static NSString *key = @"kShowObjcRunTime";
static char kUITableViewIndexKey;

@interface test5 ()

@property(nonatomic, strong)UIButton *btnTest;

@end

@implementation test5

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.btnTest = [UIButton initWitFrame:CGRectMake(170, 250, 75, 40) tag:3 title:@"btn3" targer:self action:@selector(testClick)];
    [self.view addSubview:self.btnTest];
}



-(void)buttonClick:(UIButton *)button
{
    NSLog(@"子类实现了-->>%@",@(button.tag));
    switch (button.tag) {
        case 100:
        {
            [self setSomeThing];
        }
            break;
        case 101:
        {
            [self getSomeThing];
        }
            break;
        case 102:
        {
            
        }
            break;
        case 103:
        {
            
        }
            break;
        case 104:
        {
            
        }
            break;
            
        default:
            break;
    }
    
}

-(void)setSomeThing
{
//    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(key), @"100", OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self.btnTest, &kUITableViewIndexKey, @"100", OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    
}

-(void)testClick
{
    
}

-(void)getSomeThing
{
    NSString *showSome = objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(key));
    NSLog(@"showKey-->>%@",showSome);
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
