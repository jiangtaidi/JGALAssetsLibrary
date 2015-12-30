//
//  UIViewController+ALAssetVC.h
//  AssetsLibraryImgChooseDemo
//
//  Created by jiangtd on 15/12/30.
//  Copyright © 2015年 jiangtd. All rights reserved.
//


#import <UIKit/UIKit.h>

//可以替换类名
static const NSString *navClassName = @"UINavigationController";

@interface UIViewController (ALAssetVC)

-(void)presentImgGroupViewController:(UIViewController*)viewController animated:(BOOL)animated completion:(void (^)())completeBlock;

@end
