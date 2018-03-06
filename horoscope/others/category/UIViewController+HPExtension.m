//
//  UIViewController+HPExtension.m
//  HammerParkUnify
//
//  Created by NemoLee on 7/15/16.
//  Copyright © 2016 HammerPark. All rights reserved.
//

#import "UIViewController+HPExtension.h"

@implementation UIViewController (HPExtension)
- (void)willPopback {
    [self.view endEditing:YES];
}

- (BOOL)shouldPopback {
    return YES;
}

- (void)addSubview:(UIView *)aView
{
    [self.view addSubview:aView];
}

- (void)addDismissButtonForNavigationItem
{
    UIBarButtonItem * back = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"white_back"] style:UIBarButtonItemStylePlain target:self action:@selector(dismissNavigationViewController)];
    self.navigationItem.leftBarButtonItem = back;
}

- (void)dismissNavigationViewController
{
    [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
}

-(void)createWhiteBackBtn
{
    [self createLeftBtn:@"" withDone:@"popSelf" withImageName:@"white_back"];
}



// 快速创建左返回按钮
- (void)createBackBtn
{
    [self createLeftBtn:@"" withDone:@"popSelf" withImageName:@"white_back"];
}

// 快速创建左Dismiss按钮
- (void)createLeftDismissBtn
{
    [self createLeftBtn:@"" withDone:@"dismiss" withImageName:@"white_back"];
}


-(void)createUpDisMissBtn
{
    UIBarButtonItem *leftNavBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"white_back"] style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    self.navigationItem.leftBarButtonItem = leftNavBarItem;
}

-(void)createUpPopBtn
{
    UIBarButtonItem *leftNavBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"white_back"] style:UIBarButtonItemStylePlain target:self action:@selector(popSelf)];
    self.navigationItem.leftBarButtonItem = leftNavBarItem;
}

// 快速创建导航左按钮
- (UIButton *)createLeftBtn:(NSString *)btnTitle withDone:(NSString *)doneFunction withImageName:(NSString *)imageName
{
    
    UIImage * image = [UIImage imageNamed:imageName];
    SEL func = NSSelectorFromString(doneFunction);
    
    CGSize titleSize = [btnTitle sizeWithFont:[UIFont systemFontOfSize:16.0f]];
    CGFloat width = image.size.width + titleSize.width;
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, imageName ? width + 8 : width, 44);
    button.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [button setTitle:btnTitle forState:UIControlStateNormal];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0,5, 0, 0)];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button addTarget:self action:func forControlEvents:UIControlEventTouchUpInside];
//    button.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem * leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //省略号靠右侧
    button.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    UIBarButtonItem * negativeSpacer = [[UIBarButtonItem alloc]
                                        initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                        target:nil
                                        action:nil];
    
    negativeSpacer.width = -5;
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    [self.navigationItem setLeftBarButtonItems:@[negativeSpacer,leftBarButton]];
    
    return button;
}

//创建右侧多个按钮
- (void)createRightBtns:(NSArray *)arrayTitle withDone:(NSArray *)arrayFunction withImageName:(NSArray *)arrayImgs
{
    NSInteger btnNums;
    if (arrayTitle.count & arrayImgs.count)
    {
        btnNums = MIN(arrayTitle.count, arrayImgs.count);
    }
    else if (arrayTitle.count)
    {
        btnNums = arrayTitle.count;
    }
    else
    {
        btnNums = arrayImgs.count;
    }
    NSMutableArray *btnArrays = [NSMutableArray array];
    
    
    for (int i = 0 ; i < btnNums; i++)
    {
        UIImage * image = nil;
        NSString *imgName = @"";
        NSString *titName = @"";
        
        if (arrayImgs.count)
        {
            imgName = arrayImgs[i];
            image = [UIImage imageNamed:imgName];
        }
        if (arrayTitle.count)
        {
            titName = arrayTitle[i];
        }
        
        CGSize titleSize = [titName sizeWithFont:[UIFont systemFontOfSize:16.0f]];
        CGFloat width = image.size.width + titleSize.width;
        
        SEL func = NSSelectorFromString(arrayFunction[i]);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, imgName ? width + 8 : width, 44);
        button.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [button setTitle:titName forState:UIControlStateNormal];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0,5, 0, 0)];
        [button setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [button addTarget:self action:func forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        
        [button addTarget:self action:func forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:button];
        
        [btnArrays addObject:rightBarButton];
        
    }
    
    [self.navigationItem setRightBarButtonItems:btnArrays];
    
}

// 快速创建导航右按钮
- (UIButton *)createRightBtn:(NSString *)btnTitle withDone:(NSString *)doneFunction withImageName:(NSString *)imageName
{
    UIImage * image = [UIImage imageNamed:imageName];
    
    CGSize titleSize = [btnTitle sizeWithFont:[UIFont systemFontOfSize:16.0f]];
    CGFloat width = image.size.width + titleSize.width;
    
    
    SEL func = NSSelectorFromString(doneFunction);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, imageName ? width + 8 : width, 44);
    button.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [button setTitle:btnTitle forState:UIControlStateNormal];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0,5, 0, 0)];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [button addTarget:self action:func forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
//    if (![imageName isNotNil])
//    {
//        float buttonWidth = button.width;
//        CGSize titleSize = [btnTitle sizeWithFont:button.titleLabel.font];
//        button.width = titleSize.width > buttonWidth ? titleSize.width : buttonWidth;
//    }
    
    UIBarButtonItem * rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIBarButtonItem * negativeSpacer = [[UIBarButtonItem alloc]
                                        initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                        target:nil
                                        action:nil];
    
    negativeSpacer.width = 5;
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
    [self.navigationItem setRightBarButtonItems:@[negativeSpacer,rightBarButton]];
    return button;
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 
                             }];
}

// 返回上级
- (void)popRoot
{
    [((UINavigationController*)[[self.tabBarController viewControllers] objectAtIndex:0]) popToRootViewControllerAnimated:YES];
    self.tabBarController.selectedIndex = 0;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)popSelf
{
    if ([self.navigationController.viewControllers.firstObject isEqual:self])
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }  
//    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)setNavBarClear
{
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBarTintColor:[UIColor clearColor]];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17], NSForegroundColorAttributeName: [UIColor whiteColor]}];
}


-(void)setNavBarWhite
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}



- (UIViewController *)getCurrentViewControl
{
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

-(void)setBtnTag:(NSInteger)btnTag withName:(NSString *)name
{
    UIButton *tmpView = (UIButton *)[self.view viewWithTag:btnTag];
    [tmpView setTitle:name forState:UIControlStateNormal];
}

@end
