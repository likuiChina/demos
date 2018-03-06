//
//  test4.m
//  horoscope
//
//  Created by LK on 2017/12/15.
//  Copyright © 2017年 LK. All rights reserved.
//

#import "test4.h"
#import "testTools.h"


@interface test4 ()<UIScrollViewDelegate>

@property(nonatomic, strong)UIView *viewRed;
@property(nonatomic, strong)NSMutableArray *arrayView;
@property(nonatomic, assign)NSInteger showIdx;

@property(nonatomic, assign)float alphaView;
@property(nonatomic, strong)UIScrollView *scrollView;

@end

@implementation test4

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self.navigationController.navigationBar setTintColor:[UIColor yellowColor]];
    self.view.backgroundColor = [UIColor orangeColor];
    [self addViews];
    
    
    UIImageView *tmpImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, -64, mScreenWidth, 64)];
    tmpImg.backgroundColor = [UIColor redColor];
    [self.view addSubview:tmpImg];
    
    self.alphaView = 1;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.width, self.scrollView.height + 10);
    UIView *tmpView1 = [[UIView alloc]initWithFrame:CGRectMake(10, 80, 30, 40)];
    tmpView1.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:tmpView1];
    
    UIView *tmpView2 = [[UIView alloc]initWithFrame:CGRectMake(80, 10, 60, 40)];
    tmpView2.backgroundColor = [UIColor yellowColor];
    [self.scrollView addSubview:tmpView2];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float tmpAlpht =  scrollView.contentOffset.y/80;
    float topAlpha = 1;
    if (tmpAlpht <= 1) {
        topAlpha = 1 - tmpAlpht;
    }
    else if (tmpAlpht <= 0)
    {
        topAlpha = 1;
    }
    else if(tmpAlpht > 1)
    {
        topAlpha = 0;
    }
    [self setNeedsNavigationBackground:topAlpha];
    NSLog(@"scrollViewDelegate-->>%f",topAlpha);
    
}


-(UIScrollView *)scrollView
{
    if (!_scrollView)
    {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, 400)];
        _scrollView.backgroundColor = [UIColor greenColor];
        _scrollView.delegate = self;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

-(void)addViews
{
    float width = (mScreenWidth - 40)/3;
    
    for (NSInteger i = 0; i < 6; i++)
    {
        NSInteger vieRow = i / 3;
        NSInteger vieSec = i % 3;
        
        UIView *tmpView = [[UIView alloc]initWithFrame:CGRectMake(10 + vieSec*(10 + width), -100-width - vieRow * (width  + 20), width, width)];
        tmpView.backgroundColor = [UIColor redColor];
        [self.view addSubview:tmpView];
        [self.arrayView addObject:tmpView];
    }
}

-(NSMutableArray *)arrayView
{
    if (!_arrayView) {
        _arrayView = [NSMutableArray array];
    }
    return _arrayView;
}

-(void)showAnimal
{
    WS(weakSelf);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.03 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 弹簧动画，参数分别为：时长，延时，弹性（越小弹性越大），初始速度
        [UIView animateWithDuration: 0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            // 放大
            UIView *tmView = self.arrayView[self.showIdx];
            tmView.top += 300;
            
        } completion:^(BOOL finished) {
            
        }];
        
        ++weakSelf.showIdx;
        NSLog(@"++weakSelf.showIdx-->>%ld",weakSelf.showIdx);
        if (weakSelf.showIdx < weakSelf.arrayView.count)
        {
            [weakSelf showAnimal];
        }
        else
        {
            self.showIdx = 0;
            [self.arrayView removeAllObjects];
            [self addViews];
        }
    });
}

-(void)buttonClick:(UIButton *)button
{
    NSLog(@"子类实现了");
    switch (button.tag) {
        case 100:
        {
            for (UIView *tmpView in self.view.subviews) {
                
                if ([tmpView isKindOfClass:[UIButton class]]) {
                }
                else
                {
                    if (tmpView.bottom > 0) {
                        [tmpView removeFromSuperview];
                    }
                }
            }
            
            [self showAnimal];
            
        }
            break;
        case 101:
        {
            NSString *tmpUUID =  [testTools getUUID];
            NSLog(@"tmpUUID-->>%@",tmpUUID);
            NSLog(@"tmpUUID-->>%@",tmpUUID);
            //            [[googleADmanage sharegoogleADmanage]showAudio:self.navigationController];
        }
            break;
        case 102:
        {
            self.alphaView+=0.1;
            [self setNeedsNavigationBackground:self.alphaView];
            
        }
            break;
            
        case 103:
        {
            self.alphaView-=0.2;
            [self setNeedsNavigationBackground:self.alphaView];
        }
            break;
            
        default:
        {
            self.alphaView-=0.1;
            [self setNeedsNavigationBackground:self.alphaView];
        }
            break;
    }
    
}


- (void)setNeedsNavigationBackground:(CGFloat)alpha {
    // 导航栏背景透明度设置
    UIView *barBackgroundView = [[self.navigationController.navigationBar subviews] objectAtIndex:0];// _UIBarBackground
    UIImageView *backgroundImageView = [[barBackgroundView subviews] objectAtIndex:0];// UIImageView
    
    NSArray *arraySubView = [barBackgroundView subviews];
    /***/
//    UIVisualEffectView *effectView = [arraySubView objectAtIndex:1];
//    effectView.alpha = alpha;
    
    if (self.navigationController.navigationBar.isTranslucent) {
        if (backgroundImageView != nil && backgroundImageView.image != nil) {
            barBackgroundView.alpha = alpha;
        } else {
            UIView *backgroundEffectView = [[barBackgroundView subviews] objectAtIndex:1];// UIVisualEffectView
            if (backgroundEffectView != nil) {
                backgroundEffectView.alpha = alpha;
            }
        }
    } else {
        barBackgroundView.alpha = alpha;
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
