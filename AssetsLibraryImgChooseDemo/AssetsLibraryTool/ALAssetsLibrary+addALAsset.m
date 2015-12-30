//
//  ALAssetsLibrary+addALAsset.m
//  AssetsLibraryImgChooseDemo
//
//  Created by jiangtd on 15/12/30.
//  Copyright © 2015年 jiangtd. All rights reserved.
//

#import "ALAssetsLibrary+addALAsset.h"

@implementation ALAssetsLibrary (addALAsset)

- (void)toolWriteImageToSavedPhotosAlbum:(CGImageRef)imageRef orientation:(ALAssetOrientation)orientation completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock groupName:(NSString*)groupName
{
    ALAssetsLibraryWriteImageCompletionBlock block = [self compositionBlock:completionBlock withGroupName:groupName];
    [self writeImageToSavedPhotosAlbum:imageRef orientation:orientation completionBlock:block];
}

- (void)toolWriteImageToSavedPhotosAlbum:(CGImageRef)imageRef metadata:(NSDictionary *)metadata completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock groupName:(NSString*)groupName
{
    ALAssetsLibraryWriteImageCompletionBlock block = [self compositionBlock:completionBlock withGroupName:groupName];
    [self writeImageToSavedPhotosAlbum:imageRef metadata:metadata completionBlock:block];
}

- (void)toolWriteImageDataToSavedPhotosAlbum:(NSData *)imageData metadata:(NSDictionary *)metadata completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock groupName:(NSString*)groupName
{
    ALAssetsLibraryWriteImageCompletionBlock block = [self compositionBlock:completionBlock withGroupName:groupName];
    [self writeImageDataToSavedPhotosAlbum:imageData metadata:metadata completionBlock:block];
}

- (void)toolWriteVideoAtPathToSavedPhotosAlbum:(NSURL *)videoPathURL completionBlock:(ALAssetsLibraryWriteVideoCompletionBlock)completionBlock groupName:(NSString*)groupName
{
    if ([self videoAtPathIsCompatibleWithSavedPhotosAlbum:videoPathURL]) {
        ALAssetsLibraryWriteVideoCompletionBlock block = [self compositionBlock:completionBlock withGroupName:groupName];
        [self writeVideoAtPathToSavedPhotosAlbum:videoPathURL completionBlock:block];
    }
    else
    {
        NSLog(@"video could not export to alssetlibrary");
    }
}

-(void (^)(NSURL *assetURL, NSError *error))compositionBlock:(void (^)(NSURL *assetURL, NSError *error))block withGroupName:(NSString*)groupName
{
    void (^completionBlok)(NSURL *assetURL, NSError *error) = ^(NSURL *assetURL, NSError *error)
    {
        
        [self addAssetsGroupAlbumWithName:groupName resultBlock:^(ALAssetsGroup *group) {
            //图片中没有该相册,创建成功
            if (group) {
                
                [self assetForURL:assetURL resultBlock:^(ALAsset *asset) {
                    [group addAsset:asset];
                    
                } failureBlock:^(NSError *error) {
                    //没有授权或者其他失败
                }];
                
            }//由同名的创建失败
            else
            {
                [self enumerateGroupsWithTypes:ALAssetsGroupAlbum usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                    
                    if([[group valueForProperty:ALAssetsGroupPropertyName] isEqualToString:groupName])
                    {
                        [self assetForURL:assetURL resultBlock:^(ALAsset *asset) {
                            [group addAsset:asset];
                            
                        } failureBlock:^(NSError *error) {
                            
                        }];
                        
                        *stop = YES;
                    }
                    
                } failureBlock:^(NSError *error) {
                    //没有授权或者其他失败
                }];

            }
            
        } failureBlock:^(NSError *error) {
            //没有授权或者其他失败
        }];
        
        block(assetURL,error);
    };
    return [completionBlok copy];

}
@end










