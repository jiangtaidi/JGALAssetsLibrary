//
//  JGDisplayImgView.m
//  AssetsLibraryImgChooseDemo
//
//  Created by jiangtd on 15/12/30.
//  Copyright © 2015年 jiangtd. All rights reserved.
//

#import "JGDisplayImgView.h"
#import "ClickedChapeChangeBtn.h"

@interface JGDisplayImgView ()

@property(nonatomic,weak)ClickedChapeChangeBtn *selectBtn;
@property(nonatomic,weak)UIImageView *imgView;

@end

@implementation JGDisplayImgView

+(JGDisplayImgView*)displayImgView
{
    return [[self alloc] init];
}

-(id)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(BOOL)isSelected
{
    return self.selectBtn.selected;
}

-(void)setupUI
{
    UIImageView *imgView = [[UIImageView alloc] init];
    [self addSubview:imgView];
    _imgView = imgView;
    
    ClickedChapeChangeBtn *selectBtn = [ClickedChapeChangeBtn clickedChapeChangeBtn];
    [selectBtn addTarget:self action:@selector(selectBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    selectBtn.backgroundColor = [UIColor grayColor];
    [self addSubview:selectBtn];
    _selectBtn = selectBtn;
}

-(void)setDisplayImg:(UIImage *)displayImg
{
    _imgView.image = displayImg;
}

-(void)selectBtnClicked:(UIButton*)btn
{
    btn.selected = !btn.selected;
}

-(void)layoutSubviews
{
    _imgView.frame = self.bounds;
    _selectBtn.frame = CGRectMake(0, 0, 30, 30);
    _selectBtn.center = CGPointMake(self.bounds.size.width - 15 - 5, self.bounds.size.height - 15 - 5);
}

@end























