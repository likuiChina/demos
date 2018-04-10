//
//  AppDelegate.m
//  horoscope
//
//  Created by LK on 2017/11/22.
//  Copyright © 2017年 LK. All rights reserved.
//

#import "AppDelegate.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "AdManager.h"
#import "googleADmanage.h"

@interface AppDelegate ()
{
    UIWindow *_topWindow;
}

@property(assign, nonatomic)UIBackgroundTaskIdentifier backGroundTask;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self setNavColor];
    
//    [[AdManager shareAdManager] stepUp];
//    [[googleADmanage sharegoogleADmanage] stepUp];
    
//    [[FBSDKApplicationDelegate sharedInstance] application:application
//                             didFinishLaunchingWithOptions:launchOptions];
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self createWindows];
//    });
    
    
    return YES;
}

-(void)createWindows
{
    _topWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _topWindow.windowLevel = UIWindowLevelNormal;
    _topWindow.backgroundColor = [UIColor redColor];
    _topWindow.hidden = NO;
    
    UIGestureRecognizer *gesture = [[UIGestureRecognizer alloc] init];
    [gesture addTarget:self action:@selector(hideWindow)];
    [_topWindow addGestureRecognizer:gesture];
    
    
    
}

-(void)hideWindow
{
    [_topWindow resignKeyWindow];
    _topWindow.hidden = YES;
}

-(void)showWindow
{
    [_topWindow makeKeyWindow];
    _topWindow.hidden = NO;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideWindow];
    });
    
}

-(void)setNavColor
{
    UINavigationBar * globleNavBar = [UINavigationBar appearance];
    [globleNavBar setTranslucent:NO];
    [globleNavBar setShadowImage:[UIImage new]];
//    [globleNavBar setTintColor:mRGB(@"cc2255")];
    [globleNavBar setTintColor:[UIColor orangeColor]];
    [globleNavBar setBarTintColor:mRGB(@"7E008C")];
    globleNavBar.barStyle = UIBarStyleBlack;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
//    return [[FBSDKApplicationDelegate sharedInstance] application:application
//                                                          openURL:url
//                                                sourceApplication:sourceApplication
//                                                       annotation:annotation
//            ];
    
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
//    [self beingBackendBackGround];
    
//    [self endBackUpdateTask];
}

-(void)beingBackendBackGround
{
    self.backGroundTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
    
        [self endBackUpdateTask];
        
    }];
}

-(void)endBackUpdateTask
{
    [[UIApplication sharedApplication] endBackgroundTask:self.backGroundTask];
    
    self.backGroundTask = UIBackgroundTaskInvalid;
    
//    [self performSelector:@selector(delayMethod) withObject:nil/*可传任意类型参数*/ afterDelay:2.0];
    
    [self delayMethod];
}
static int count = 0;

-(void)delayMethod
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"count---->>>>=%d",count++);
        [self delayMethod];
        
    });
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
//    [FBSDKAppEvents activateApp];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self showWindow];
//    });
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
