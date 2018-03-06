//
//  test3.m
//  horoscope
//
//  Created by LK on 2017/12/1.
//  Copyright © 2017年 LK. All rights reserved.
//

#import "test3.h"
//#import "ReactiveCocoa.h"
//#import "RACSiganl.h"

@interface test3 ()

@end

@implementation test3

+(void)load
{
    NSLog(@"test3-->>load");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"test3-->>viewDidLoad");
}

-(void)buttonClick:(UIButton *)button
{
    NSLog(@"子类实现了");
    switch (button.tag) {
        case 0:
        {
            [self runLoopClick];
        }
            break;
        case 1:
        {
           
        }
            break;
        case 2:
        {
            ;
        }
            break;
            
        default:
            break;
    }
    
}

-(void)doThings1
{
    

}

-(void)runLoopClick
{
//    NSMutableArray *mutableIndexPathsToBePrecached = [NSMutableArray array];
//    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopBeforeWaiting, true, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity _) {
//        if (mutableIndexPathsToBePrecached.count == 0) {
//            CFRunLoopRemoveObserver(runLoop, observer, runLoopMode);
//            CFRelease(observer); // 注意释放，否则会造成内存泄露
//            return;
//        }
//        NSIndexPath *indexPath = mutableIndexPathsToBePrecached.firstObject;
//        [mutableIndexPathsToBePrecached removeObject:indexPath];
//        [self performSelector:@selector(fd_precacheIndexPathIfNeeded:)
//                     onThread:[NSThread mainThread]
//                   withObject:indexPath
//                waitUntilDone:NO
//                        modes:@[NSDefaultRunLoopMode]];
//    });
}

-(void)fd_precacheIndexPathIfNeeded
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
