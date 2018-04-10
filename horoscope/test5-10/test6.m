//
//  test6.m
//  horoscope
//
//  Created by LK on 2018/3/27.
//  Copyright © 2018年 LK. All rights reserved.
//

#import "test6.h"
#import "drawView6.h"
#import <objc/runtime.h>
#import "LKBigButton.h"

@interface test6 ()

@property(nonatomic, weak)drawView6 *drawView;


@property(nonatomic, weak)LKBigButton *bigBtn;

@end

@implementation test6

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.drawView.backgroundColor = [UIColor yellowColor];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(50, 200, 180, 200)];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    label1.text = @"ookk kkkdsallfhh;";
    [view1 addSubview:label1];
    
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(50, 250, 180, 200)];
    view2.backgroundColor = [UIColor greenColor];
    view2.opaque = NO;
    view2.alpha = 0.5;
    [self.view addSubview:view2];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 100, 180)];
    label2.text = @"ookkhjgfdsgfdsdsagdrythhhh;";
    [view2 addSubview:label2];
    
//    [self.view addSubview:self.bigBtn];
    
}


// Defining a block variable
BOOL (^isInputEven)(int) = ^(int input) {
    if (input % 2 == 0) {
        return YES;
    } else {
        return NO;
    }
};

-(LKBigButton *)bigBtn
{
    if (!_bigBtn) {
        LKBigButton *button = [LKBigButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(100, 200, 40, 40);
        //    button.titleLabel.textColor = [UIColor blackColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitle:@"custom" forState:UIControlStateNormal];
        button.tag = 200;
        [button addTarget:self action:@selector(customCLick) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundColor:kRandomColor];
        [self.view addSubview:button];
        
        _bigBtn = button;
    }
    return _bigBtn;
}

//-(void)customCLick
//{
//    NSLog(@"hfdhafdasfkdjsalfds");
//
//
//    UIImage *btnImg = [[UIImage imageNamed:@""] resizableImageWithCapInsets:<#(UIEdgeInsets)#> resizingMode:<#(UIImageResizingMode)#>]
//
//}

-(drawView6 *)drawView
{
    if (!_drawView) {
        drawView6 *tmpView = [[drawView6 alloc] initWithFrame:CGRectMake(50, 250, 180, 200)];
        
        [self.view addSubview:tmpView];
        _drawView = tmpView;
    }
    return _drawView;
}

-(void)buttonClick:(UIButton *)button
{
    NSLog(@"子类实现了-->>%@",@(button.tag));
    switch (button.tag) {
        case 100:
        {
            [self addClass];
        }
            break;
        case 101:
        {
            [self getCustomClass];
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
        }
            break;
        case 104:
        {
            
        }
            break;
        default:
        {
            
        }
            break;
    }
}

-(void)addClass
{
    Class newClass = objc_allocateClassPair([UIView class], "CustomView", 0);
    class_addMethod(newClass, @selector(report), (IMP)ReportFunction, "v@:");
    objc_registerClassPair(newClass);
    
    id instanceOnNewClass = [[newClass alloc] init];
    
    [instanceOnNewClass performSelector:@selector(report)];
    
    
    
}

void ReportFunction(id self, SEL _cmd)
{
    NSLog(@"this objece --->>%p",self);
    
    Class currentClass = [self class];
//    for (int i = 1; i < 5; i++) {
//
//        NSLog(@"this objece --->>%p",currentClass);
//
//        currentClass = objc_getClass(currentClass );
//    }
    
    NSLog(@"this objece --->>%p",self);
    
}


-(void)getCustomClass
{
    
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
