//
//  HORDefigns.h
//  HammerParkUnify
//
//  Created by WG on 2017/7/7.
//  Copyright © 2017年 HammerPark. All rights reserved.
//

#import <objc/runtime.h>
#import "UIViewController+HPExtension.h"
#import "UIColor+HexColor.h"
#import "UIButton+Action.h"
#import "WSProgressHUD.h"
#import "UIView+HPExtension.h"
#import "NSArray+category.h"


#define mNavBarHeight         44.0
#define mTabBarHeight         49.0
#define mScreenBounds         [UIScreen mainScreen].bounds
#define mScreenWidth          ([UIScreen mainScreen].bounds.size.width)
#define mScreenHeight         ([UIScreen mainScreen].bounds.size.height)
#define mStateBarHeight       ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define mNavAndStateBar       (mStateBarHeight + mNavBarHeight)

#define kScreenBounds   [UIScreen mainScreen].bounds
#define kScreenWidth  kScreenBounds.size.width*1.0
#define kScreenHeight kScreenBounds.size.height*1.0

#define mkeyWindow   [UIApplication sharedApplication].keyWindow

// 设备版本
#define kiOS7 [[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0
#define kiOS8 [[[UIDevice currentDevice]systemVersion] floatValue] >= 8.0
#define kiOS9 [[[UIDevice currentDevice]systemVersion] floatValue] >= 9.0
#define kiOS10 [[[UIDevice currentDevice]systemVersion] floatValue] >= 10.0
#define kiOS11 [[[UIDevice currentDevice]systemVersion] floatValue] >= 11.0
#define GreateIOS(a)   ([[[UIDevice currentDevice] systemVersion] intValue] >= a)

//#define IS_IPHONE_X (SCREEN_HEIGHT == 812)

#define kDeviceVersion [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]

#define mUserDefault    [NSUserDefaults standardUserDefaults]
#define mNotification   [NSNotificationCenter defaultCenter]

#define mStatusKeyValue     200
#define DiscoveryHeardHeight  90

#define WS(weakSelf)  __weak typeof(self)weakSelf = self;

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 \
alpha:(a)]
#define mRGB(X)    [UIColor colorWithHexRGB:(X)]


#define bTitleFont [UIFont boldSystemFontOfSize:18]
#define sTitleFont [UIFont systemFontOfSize:25]
#define sFont(x) [UIFont systemFontOfSize:x]
#define bFont(x)[UIFont boldSystemFontOfSize:x]

#define HORDataDefineFormat       [HORDataFormat dateFormatter]

#define AvenirFont(x) [UIFont boldSystemFontOfSize:x]//[UIFont fontWithName:@"AvenirLTStd-Heavy" size:x]
#define AvenirRomanFont(x) [UIFont systemFontOfSize:x] //[UIFont fontWithName:@"Avenir-Roman" size:x]
#define kAllProjectColor    @"c518f0"

//************************************************************************/

#define kMoreDetalFont  bFont(18)
#define kAllHeaderAverTag   10010

//************************************话题************************************/
#define kTopicReplyLabelFont     AvenirRomanFont(14)
#define kDateShowLabelFont              sFont(14)
#define kIntroduceLabelFont             AvenirRomanFont(14)
#define kTopicTopCellLabelFont          AvenirFont(18)

#define     kTopicContentViewWidth         (mScreenWidth - 30)          //content宽度
#define     kTopicBGImgViewWidth          (kTopicContentViewWidth - 30)    //背景图宽度

#define     kTopicDateLabelHeight           40  //日期高度
#define     kTopicLikeBtnHeight             45  //喜欢不喜欢的btn高度
#define     kTopicUserImgBgHeight           40        //底部用户栏的高度
#define     kHeadImgTag                      2352
#define     kTopImgBGTag            3252

#define kLuckTentdercyFont  sFont(16)
#define kLuckTentdercyTitleFont  bFont(18)
#define kLuckTentWidth  (mScreenWidth - 30)

#define kAllContentColor   mRGB(@"333333")
//************************************************************************/

#define  kGlobleBGColor         mRGB(@"f0f0f0")


#define pinkColor [UIColor colorWithRed:224/255.0 green:52/255.0 blue:210/255.0 alpha:1]
#define kLightGrayColor [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1]

#define kTopPinkColor(frame)   mRGB(@"7E008C")//[UIColor colorWithGradientStyle:UIGradientStyleLeftToRight withFrame:frame andColors:@[mRGB(@"8E00B5"),mRGB(@"961D8B"),mRGB(@"A11D9C")]]
#define kNavRedColork   mRGB(@"7E008C") //TopPinkColor(CGRectMake(0, 0, mScreenWidth, mNavAndStateBar))

#define mMainColor  [UIColor colorWithHexRGB:@"#02847c"]
#define mPSLightColor  [UIColor colorWithHexRGB:@"#EAEBEC"]
#define mPSSeparateColor  [UIColor colorWithHexRGB:@"#e5e5e5"]

#define kBuglyAppID         @"d9f8176e66"
#define kBuglyKey           @"ef97fa59-907e-4354-9bd9-99bf60a5c5c4"

#define kNofiticationPushToReport       @"kNofiticationPushToReport"
#define kNotificationLuckNumber         @"kNotificationLuckNumber"
#define kInboxUpdata                    @"kInboxUpdata"
#define mSelectIndexNum                 @"mSelectIndexNum"
#define kNumberOfShowTime           15
#define mNumberOfOpenApp                 @"mNumberOfOpenApp"

/**融云的token*/
#define kRongCloudToken             @"kRongCloudToken"
#define kUserName           @"kUserName"
#define kUserUserUrl        @"kUserUserUrl"
#define kUUID               [mUserDefault objectForKey:@"kSaveForUUID"]
#define kSaveForUUID         @"kSaveForUUID"

#define kHor_Userid_Social      @"kHor_Userid_Social"
#define HOR_USERID  [[mUserDefault valueForKey:kHor_Userid_Social]TrimString]   //项目用的userID
#define kNotificationTopicReply     @"kNotificationTopicReply"
//15：cell前后加content后面，15：tableview离contentview的距离，15是label离cell的距离
#define mTopicCellWidth     (mScreenWidth - 15 * 4  - 2 * 15)
#define kNotificationPublishImageSuccess @"kNotificationPublishImageSuccess" //发布照片成功通知

//  tab2
//查看话题新消息
#define kTopic_msg_count @"topic_msg_count"
//查看星座新消息
#define kGuess_msg_count @"guess_msg_count"
#define kIsShowSocialInApp  @"kIsShowSocialInApp"
#define kIsNewGuessMsg @"kIsNewGuessMsg"

#define kQuitAppInNewVersion    @"kQuitAppInNewVersion"

//下面区分Preprocessor Macros下   TARGET_VERSION_LITE=   1:horotrial   2：horoscoper
#if TARGET_VERSION_LITE == 1
//horotrial
#define SKProductIDSubscribeLevel1      @"com.hammerpark.horotrial.Basic"//基本付费订阅ID
#define  SKProductIDSubscribeLevel2   @"com.hammerpark.horotrial.Advanced"//高级付费订阅ID

#define TapJoy_key              @"ElIFe50CRMWEYBvzTN6I3AEBollv5fmjVWXgKGiIAWZvWH3um1kfDVoHwljH" //tapjoy key
#define TapJoy_Offerwall        @"offerwall"
#define TapJoy_video            @"video"

#define  kIsHoroscoperSoft      NO

#elif TARGET_VERSION_LITE == 2
//horoscoper   星座的
#define SKProductIDSubscribeLevel1      @"com.hammpark.horoscoper.100creditsPerMonth"//基本付费订阅ID
#define  SKProductIDSubscribeLevel2   @"com.hammpark.horoscoper.300creditsPerMonth"//高级付费订阅ID
#define TapJoy_key              @"VR7TLhzuR5C1LWtEVnVEVgEByXFzgJO1P9wXy8KfgF12YJdvKQBQ7x6qsoaU"
#define TapJoy_Offerwall        @"Offerwall"
#define TapJoy_video            @"Video"

#define  kIsHoroscoperSoft      YES

#endif

//******************************订阅模块******************************************/


#define  UserDefaultsKeySubscriptionValid   @"UserDefaultsKeySubscriptionValid" //表示是否订阅

#define kNotificationShowDubscribe      @"kNotificationShowDubscribe"
#define kNotificationUpDateFCreadit     @"kNotificationUpDateFCreadit"

#define kNotificationFreeUser       @"kNotificationFreeUser"
#define mTapjoySeeAdTimes        @"mTapjoySeeAdTimes"

#define kVideoSeeOutDate @"kVideoSeeOutDate"   //视频看完后保持3分钟可订阅
////************************************************************************/

//新建账号的key

#define kNotificationCriditRefresh  @"kNotificationCriditRefresh"


#define TapJoyCridet_5      5 //tabjoyVideo的五个积分
////************************************************************************/

// ----------设备系统相关---------
#define mRetina   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define miPhone5    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136),[[UIScreen mainScreen] currentMode].size) : NO)
#define miPhone6    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334),[[UIScreen mainScreen] currentMode].size) : NO)
#define miPhone6s   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 1920),[[UIScreen mainScreen] currentMode].size) : NO)
//*****************************其它******************************************/
//tabbar 融云的小红点
#define kTabbarRedDot  @"kTabbarRedDot"

#define kBaseCellEdgeLeft   15

static const NSInteger kMaxCachegetAgent = 60 * 60 * 24 ; // 1 day

//保存订阅列表的日期
#define kSubscibeListDate @"kSubscibeListDate"
//保存订阅列表
#define kSubscibeList @"kSubscibeList"
//保存我的订阅状态
#define UserDefaultsKeySubscribeInfo  @"UserDefaultsKeySubscribeInfo"


#define kIsHoroscoperToday      @"kIsHoroscoperToday"
#define LoginModel              @"LoginModel"
//*****************************适配*****************************************
#define __I6Width(_width) (([UIScreen mainScreen].bounds.size.width == 320)?((_width)* 320.0/375.0):(([UIScreen mainScreen].bounds.size.width==375)?(_width):((_width)*414.0/375.0)))
#define __I6Height(y) (([UIScreen mainScreen].bounds.size.width == 320)?((y)* 568/667.0):(([UIScreen mainScreen].bounds.size.width==375)?(y):((y)*736.0/667.0)))

#define kDiscribeSelf - (NSString *)description \
{\
    \
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];\
    \
    \
    uint count;\
    objc_property_t *properties = class_copyPropertyList([self class], &count);\
    \
    for (int i = 0; i<count; i++) {\
        objc_property_t property = properties[i];\
        NSString *name = @(property_getName(property));\
        id value = [self valueForKey:name]?:@"nil";\
        [dictionary setObject:value forKey:name];\
    }\
    \
    free(properties);\
    return [NSString stringWithFormat:@"<%@: %p> -- %@",[self class],self,dictionary];\
}

#define     kJudgeIsGuest       if ([HORTopicsTools isGuest:self]) return;//游客登录，弹出登录框

#define kDiscribeFunc   NSLog(@"currentFun-->>%s",__func__);
//拉伸
#define StretImage(image) [(image) stretchableImageWithLeftCapWidth:(image).size.width/2 topCapHeight:(image).size.height/2]

#define kEncoderDecoderSelf    -(void)encodeWithCoder:(NSCoder *)aCoder{\
unsigned int count = 0;\
Ivar *ivarLists = class_copyIvarList([self class], &count);\
for (int i = 0; i < count; i++) {\
    const char* name = ivar_getName(ivarLists[i]);\
    NSString* strName = [NSString stringWithUTF8String:name];\
    [aCoder encodeObject:[self valueForKey:strName] forKey:strName];\
}\
free(ivarLists);   \
}\
\
-(instancetype)initWithCoder:(NSCoder *)aDecoder{\
    if (self = [super init]) {\
        unsigned int count = 0;\
        Ivar *ivarLists = class_copyIvarList([self class], &count);\
        for (int i = 0; i < count; i++) {\
            const char* name = ivar_getName(ivarLists[i]);\
            NSString* strName = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];\
            id value = [aDecoder decodeObjectForKey:strName];\
            [self setValue:value forKey:strName];\
        }\
        free(ivarLists);\
    }\
    return self;\
}


//单例的简写
#define singleH(name) +(instancetype)share##name;

#define singleM(name) static id _instance;\
+(instancetype)allocWithZone:(struct _NSZone *)zone\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super allocWithZone:zone];\
});\
return _instance;\
}\
\
+(instancetype)share##name\
{\
return [[self alloc]init];\
}\
-(id)copyWithZone:(NSZone *)zone\
{\
return _instance;\
}\
\
-(id)mutableCopyWithZone:(NSZone *)zone\
{\
return _instance;\
}

