//
//  JGImgGroup.h
//  AssetsLibraryImgChooseDemo
//
//  Created by jiangtd on 15/12/30.
//  Copyright © 2015年 jiangtd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface JGImgGroup : NSObject

@property(nonatomic,strong)ALAssetsGroup *group;
@property(nonatomic,assign)CGImageRef headImg;
@property(nonatomic,assign)NSUInteger numImgOfGroup;
@property(nonatomic,copy)NSString *groupName;

+(JGImgGroup*)imgGroupWithGroup:(ALAssetsGroup*)group;

@end
