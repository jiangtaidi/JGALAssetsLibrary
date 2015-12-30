//
//  ALAssetsLibrary+addALAsset.h
//  AssetsLibraryImgChooseDemo
//
//  Created by jiangtd on 15/12/30.
//  Copyright © 2015年 jiangtd. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>

@interface ALAssetsLibrary (addALAsset)

- (void)toolWriteImageToSavedPhotosAlbum:(CGImageRef)imageRef orientation:(ALAssetOrientation)orientation completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock groupName:(NSString*)groupName;

- (void)toolWriteImageToSavedPhotosAlbum:(CGImageRef)imageRef metadata:(NSDictionary *)metadata completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock groupName:(NSString*)groupName;

- (void)toolWriteImageDataToSavedPhotosAlbum:(NSData *)imageData metadata:(NSDictionary *)metadata completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock groupName:(NSString*)groupName;

- (void)toolWriteVideoAtPathToSavedPhotosAlbum:(NSURL *)videoPathURL completionBlock:(ALAssetsLibraryWriteVideoCompletionBlock)completionBlock groupName:(NSString*)groupName;


@end
