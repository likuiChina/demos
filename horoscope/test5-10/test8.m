//
//  test8.m
//  horoscope
//
//  Created by LK on 2018/4/10.
//  Copyright © 2018年 LK. All rights reserved.
//

#import "test8.h"

@interface test8 ()

@property(nonatomic, strong)UICollectionView *collectionView;
//@property(nonatomic, strong)CustomCollectionViewLayout *customLayout;

@end

@implementation test8

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadCollectionView
{
//    _customLayout = [[CustomCollectionViewLayout alloc] init]; // 自定义的布局对象
//    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:_customLayout];
//    _collectionView.backgroundColor = [UIColor whiteColor];
//    _collectionView.dataSource = self;
//    _collectionView.delegate = self;
//    [self.view addSubview:_collectionView];
    
    // 注册cell、sectionHeader、sectionFooter
//    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellId];
//    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
//    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerId];
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
            
        }
            break;
        default:
        {
            
        }
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
