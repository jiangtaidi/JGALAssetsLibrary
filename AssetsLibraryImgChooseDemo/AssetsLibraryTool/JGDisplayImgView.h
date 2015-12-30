//
//  JGDisplayImgView.h
//  AssetsLibraryImgChooseDemo
//
//  Created by jiangtd on 15/12/30.
//  Copyright © 2015年 jiangtd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JGDisplayImgView : UIView

@property(nonatomic,strong)UIImage *displayImg;

@property(nonatomic,assign)BOOL isSelected;

+(JGDisplayImgView*)displayImgView;

@end
