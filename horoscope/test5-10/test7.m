//
//  test7.m
//  horoscope
//
//  Created by LK on 2018/3/27.
//  Copyright © 2018年 LK. All rights reserved.
//

#import "test7.h"
#import <objc/runtime.h>
#import "NSArray+category.h"

@interface test7 ()

@property(nonatomic, copy)NSArray *test7Array;
@property(nonatomic, copy)NSDictionary *test7Dic;

@end

@implementation test7

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.test7Array = [[NSArray alloc] init];
//    self.test7Array = [[NSArray alloc] initWithObjects:@"12", nil];
    
    self.test7Dic = [[NSDictionary alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonClick:(UIButton *)button
{
    NSLog(@"子类实现了-->>%@",@(button.tag));
    switch (button.tag) {
        case 100:
        {
            [self performSelector:@selector(hahha) withObject:nil afterDelay:0.1];
            
        }
            break;
        case 101:
        {
//            [self getCustomClass];
            
            
            
            
        }
            break;
        case 102:
        {
            //            [self testSegiel];
        }
            break;
        case 103:
        {
            //            [self testRac];
            
            NSArray *placeholder = [NSArray alloc];
            NSArray *arr1 = [placeholder init];
            NSArray *arr2 = [placeholder initWithObjects:@0, nil];
            NSArray *arr3 = [placeholder initWithObjects:@0, @1, nil];
            NSArray *arr4 = [placeholder initWithObjects:@0, @1, @2, nil];
            
            NSLog(@"placeholder: %s", object_getClassName(placeholder));    // placeholder: __NSPlaceholderArray
            NSLog(@"arr1: %s", object_getClassName(arr1));                  // arr1: __NSArray0
            NSLog(@"arr2: %s", object_getClassName(arr2));                  // arr2: __NSSingleObjectArrayI
            NSLog(@"arr3: %s", object_getClassName(arr3));                  // arr3: __NSArrayI
            NSLog(@"arr4: %s", object_getClassName(arr4));                  // arr4: __NSArrayI
            
        }
            break;
        case 104:
        {
            
            id number = [self.test7Array objectAtIndex:4];
            
            NSLog(@"-->>%@",number);
        }
            break;
        default:
        {
            
        }
            break;
    }
}

+(BOOL)resolveInstanceMethod:(SEL)sel
{
//    NSLog((@"\n[文件名:%s]\n""[函数名:%s]\n""[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
    
    NSLog(@"resolveInstanceMethod>>>>%@",[NSString stringWithFormat:@"%@：%@ \n%s \n%s \n%d",[self class],NSStringFromSelector(_cmd),__FILE__, __FUNCTION__, __LINE__]);
    return NO;
}

-(void)forwardInvocation:(NSInvocation *)invocation
{
    NSLog(@"forwardInvocation>>>%@",[NSString stringWithFormat:@"%@：%@ \n%s \n%s \n%d",[self class],NSStringFromSelector(_cmd),__FILE__, __FUNCTION__, __LINE__]);
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
