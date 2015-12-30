//
//  JGImgGroup.m
//  AssetsLibraryImgChooseDemo
//
//  Created by jiangtd on 15/12/30.
//  Copyright © 2015年 jiangtd. All rights reserved.
//

#import "JGImgGroup.h"

@implementation JGImgGroup

+(JGImgGroup*)imgGroupWithGroup:(ALAssetsGroup*)group
{
    return [[self alloc] initWithGroup:group];
}

-(id)initWithGroup:(ALAssetsGroup*)group
{
    self = [super init];
    if (self) {
        self.group = group;
    }
    return self;
}

-(void)setGroup:(ALAssetsGroup *)group
{
    if (group) {
        _group = group;
        _numImgOfGroup = _group.numberOfAssets;
        _headImg = [_group posterImage];
        _groupName = [_group valueForProperty:ALAssetsGroupPropertyName];

    }
}
@end











