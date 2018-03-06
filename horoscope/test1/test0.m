//
//  test0.m
//  horoscope
//
//  Created by LK on 2017/12/1.
//  Copyright © 2017年 LK. All rights reserved.
//

#import "test0.h"
#import "AdManager.h"

@interface test0 ()


@end

@implementation test0

-(instancetype)init
{
    if (self = [super init]) {
        self.arrayTitle = @[@"PLAY vedio",@"New Video",@"offwall"];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
}



-(void)buttonClick:(UIButton *)button
{
    NSLog(@"子类实现了");
    switch (button.tag) {
            case 0:
            {
                [[AdManager shareAdManager] playVideo:self.navigationController];
            }
            break;
            case 1:
        {
            [[AdManager shareAdManager] showNewVideo:self.navigationController];
        }
            break;
            case 2:
        {
            [[AdManager shareAdManager] showOfferWall:self.navigationController];
        }
            break;
            
        default:
            break;
    }
    
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
