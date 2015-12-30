//
//  JGImageSelectViewController.h
//  AssetsLibraryImgChooseDemo
//
//  Created by jiangtd on 15/12/30.
//  Copyright © 2015年 jiangtd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JGImgGroup.h"
#import "JGImgSelectDelegate.h"

@interface JGImageSelectViewController : UIViewController

@property(nonatomic,strong)JGImgGroup *imgGroup;
//代理，处理图片选择的结果
@property(nonatomic,weak)id<JGImgSelectDelegate> delegate;
//模态进来的控制器，用于dismiss推出模态
@property(nonatomic,weak)UIViewController *mainVc;
//选择图片的类型
@property(nonatomic,assign)ChoosetImgType chooseImgType;

@end
