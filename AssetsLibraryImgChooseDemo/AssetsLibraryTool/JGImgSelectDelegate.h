//
//  JGImgSelectDelegate.h
//  AssetsLibraryImgChooseDemo
//
//  Created by jiangtd on 15/12/30.
//  Copyright © 2015年 jiangtd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,ChoosetImgType)
{
    //缩略图,默认为缩略图
    ChoosetImgTypeThumbnail=0,
    //图片的高清图
    ChoosetImgTypefullResolutionImage=1,
    //图片的全屏图
    ChoosetImgTypefullScreenImage=2,
};
@protocol JGImgSelectDelegate <NSObject>

@optional

//选择图片
-(void)selectSecceedWithImgs:(NSArray*)imgs;
//取消选择图片
-(void)selectCancel;

@end
