//
//  BaseViewControl.h
//  horoscope
//
//  Created by LK on 2017/11/22.
//  Copyright © 2017年 LK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewControl : UIViewController

@property(nonatomic, strong)NSArray *arrayTitle;

-(void)createBtnNumber:(NSInteger)btnNum;
-(void)createNormolBtn;

//-(void)setBtnTag:(NSInteger)btnTag withName:(NSString *)name;

@end
