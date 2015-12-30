//
//  UIViewController+ALAssetVC.m
//  AssetsLibraryImgChooseDemo
//
//  Created by jiangtd on 15/12/30.
//  Copyright © 2015年 jiangtd. All rights reserved.
//

#import "UIViewController+ALAssetVC.h"
#import "JGImageGoupPickerViewController.h"
#import <objc/runtime.h>

@implementation UIViewController (ALAssetVC)

-(void)presentImgGroupViewController:(UIViewController*)viewController animated:(BOOL)animated completion:(void (^)())completeBlock
{
    Class navClass = objc_getClass([navClassName UTF8String]);
    if ([navClass isSubclassOfClass:[UINavigationController class]]) {
        UINavigationController *navVc = [[navClass alloc] initWithRootViewController:viewController];
        if ([viewController isKindOfClass:[JGImageGoupPickerViewController class]]) {
            ((JGImageGoupPickerViewController*)viewController).delegate = self;
        }
        [self presentViewController:navVc animated:YES completion:completeBlock];
    }
    
    
}

@end
