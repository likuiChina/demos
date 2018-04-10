//
//  NSArray+category.m
//  horoscope
//
//  Created by LK on 2018/4/8.
//  Copyright © 2018年 LK. All rights reserved.
//

#import "NSArray+category.h"
#import <objc/runtime.h>


@implementation NSArray (category)

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class myClass = NSClassFromString(@"__NSArrayI");
        Method safeMethod=class_getInstanceMethod (self, @selector(objectAtSafeIndexI:));
        Method unsafeMethod=class_getInstanceMethod (myClass, @selector(objectAtIndex:));
        method_exchangeImplementations(unsafeMethod, safeMethod);
        
        Class myClass0 = NSClassFromString(@"__NSSingleObjectArrayI");
        Method safeMethod0 = class_getInstanceMethod (self, @selector(safeObjectAtIndex:));
        Method unsafeMethod0 = class_getInstanceMethod (myClass0, @selector(objectAtIndex:));
        method_exchangeImplementations(safeMethod0, unsafeMethod0);
        
        
        Class myClass1 = NSClassFromString(@"__NSArray0");
        Method safeMethod1 = class_getInstanceMethod (self, @selector(objectAtSafeIndex0:));
        Method unsafeMethod1 = class_getInstanceMethod (myClass1, @selector(objectAtIndex:));
        method_exchangeImplementations(safeMethod1, unsafeMethod1);
        
        Method old = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(insertObject:atIndex:));
        Method new = class_getInstanceMethod(self, @selector(insertSaveObject:atIndex:));
        if (!old || !new) {
            return;
        }
        method_exchangeImplementations(old, new);
    });
}

-(id)objectAtSafeIndexI:(NSUInteger)index
{
    if (index<self.count) {
        return [self objectAtSafeIndexI:index];
    }
//    NSAssert(NO, @"数组为空I");
    return nil;
}

-(id)objectAtSafeIndex0:(NSUInteger)index
{
    if (index<self.count) {
        return [self objectAtSafeIndex0:index];
    }
    NSLog(@"objectAtSafeIndex0-->>%@--->>%@",@(index),@(self.count));
//    NSAssert(NO, @"数组为空I");
    return nil;
}


+(void)swizzeInstert
{
    Method old = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(insertObject:atIndex:));
    Method new = class_getInstanceMethod(self, @selector(insertSaveObject:atIndex:));
    if (!old || !new) {
        return;
    }
    method_exchangeImplementations(old, new);
}

-(void)insertSaveObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject!=nil) {
        [self insertSaveObject:anObject atIndex:index];
    }
}

-(id)safeObjectAtIndex:(NSUInteger)index{
    
    NSLog(@"safeObjectAtIndex-->>%@--->>%@",@(index),@(self.count));
    
    if (index > (self.count - 1)) {
//        NSAssert(NO, @"beyond the boundary");
        return nil;
    }
    else{
        return [self safeObjectAtIndex:index];
    }
}

- (id)lx_GetObjAtIndex:(NSUInteger)index
{
    NSLog(@"---lx_GetObjAtIndex--->>%@",@(self.count));
    
    if (self.count && self.count > index) {
        return [self lx_GetObjAtIndex:index];
    }
    return nil;
    
//    if (index > self.count - 1 || !self.count){
//        @try {
//            return [self lx_GetObjAtIndex:index];
//        } @catch (NSException *exception) {
//            //__throwOutException  抛出异常
//            return nil;
//        } @finally {
//
//        }
//    }
}

@end
