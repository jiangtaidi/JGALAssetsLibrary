//
//  JGImageGoupDisplayViewController.h
//  AssetsLibraryImgChooseDemo
//
//  Created by jiangtd on 15/12/30.
//  Copyright © 2015年 jiangtd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "JGImgSelectDelegate.h"

@interface JGImageGoupPickerViewController : UIViewController

//代理，处理图片选择的结果
@property(nonatomic,weak)id<JGImgSelectDelegate> delegate;
//选择图片的类型
@property(nonatomic,assign)ChoosetImgType choosetImgType;

@end
