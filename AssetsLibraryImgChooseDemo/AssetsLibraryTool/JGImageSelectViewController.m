//
//  JGImageSelectViewController.m
//  AssetsLibraryImgChooseDemo
//
//  Created by jiangtd on 15/12/30.
//  Copyright © 2015年 jiangtd. All rights reserved.
//

#import "JGImageSelectViewController.h"
#import "ClickedChapeChangeBtn.h"
#import "JGDisplayImgView.h"

@interface JGImageSelectViewController ()

@property(nonatomic,strong)NSMutableArray *alassetArr;
@property(nonatomic,strong)UIScrollView *contentScrollView;

@property(nonatomic,strong)NSMutableArray *imgViewArr;

@end

@implementation JGImageSelectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupAlAssetData];
}

-(NSString*)title
{
    return self.imgGroup.groupName;
}

-(void)setupAlAssetData
{
    if (self.imgGroup) {
        [self.imgGroup.group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            if (result) {
                [self.alassetArr addObject:result];
            }
        }];
    }
    [self setupUI];
}

-(void)setupUI
{
    UIBarButtonItem *cancenBtn = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelSelect:)];
    self.navigationItem.rightBarButtonItem = cancenBtn;
    
    if (self.alassetArr.count > 0) {
        
        UIScrollView  *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 45)];
        [self.view addSubview:scrollView];
        _contentScrollView = scrollView;
        
        CGFloat space = 5;
        CGFloat displayImgViewSize = ([UIScreen mainScreen].bounds.size.width - 5 * 3) / 4;
        for(int i = 0;i < self.alassetArr.count;i++)
        {
            JGDisplayImgView *displayImgView = [JGDisplayImgView displayImgView];
            displayImgView.backgroundColor = [UIColor redColor];
            displayImgView.frame = CGRectMake((i % 4) * displayImgViewSize + (i % 4) * space, (i / 4) * displayImgViewSize + (i / 4) * space, displayImgViewSize, displayImgViewSize);
            ALAsset *alasset = self.alassetArr[i];
            displayImgView.displayImg = [UIImage imageWithCGImage:alasset.thumbnail];
            [scrollView addSubview:displayImgView];
            
            [self.imgViewArr addObject:displayImgView];
        }
        
        _contentScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width,(self.alassetArr.count / 4 + 1) * displayImgViewSize + (self.alassetArr.count / 4 + 1) * space);
        
    }
    
    UIView *buttomView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 45, [UIScreen mainScreen].bounds.size.width, 45)];
    buttomView.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    selectBtn.backgroundColor = [UIColor lightGrayColor];
    [selectBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    selectBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 50 - 10, 10, 50, 25);
    [selectBtn setTitle:@"选择" forState:UIControlStateNormal];
    [selectBtn addTarget:self action:@selector(selectImg:) forControlEvents:UIControlEventTouchUpInside];
    [buttomView addSubview:selectBtn];
    
    [self.view addSubview:buttomView];
}

//选择图片回调
-(void)selectImg:(UIButton*)btn
{
    NSMutableArray *chooseImgs = [NSMutableArray array];
    
    if (self.chooseImgType == ChoosetImgTypeThumbnail) {
        
        for(int i = 0 ;i < self.alassetArr.count ; i++)
        {
            JGDisplayImgView *displayView = self.imgViewArr[i];
            if (displayView.isSelected) {
                ALAsset *alasset = self.alassetArr[i];
                UIImage *img = [UIImage imageWithCGImage:alasset.thumbnail];
                [chooseImgs addObject:img];
            }
        }
    }
    else
    {
        for(int i = 0 ;i < self.alassetArr.count ; i++)
        {
            JGDisplayImgView *displayView = self.imgViewArr[i];
            if (displayView.isSelected)
            {
                ALAsset *alasset = self.alassetArr[i];
                ALAssetRepresentation *alassetPresentation = [alasset defaultRepresentation];
                UIImage *img = nil;
                if (self.chooseImgType == ChoosetImgTypefullResolutionImage) {
                    img = [UIImage imageWithCGImage:[alassetPresentation fullResolutionImage]];
                }
                else if(self.chooseImgType == ChoosetImgTypefullScreenImage)
                {
                    img = [UIImage imageWithCGImage:[alassetPresentation fullScreenImage]];
                }
                if (img) {
                    [chooseImgs addObject:img];
                }
            }
        }
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectSecceedWithImgs:)]) {
        [self.delegate selectSecceedWithImgs:chooseImgs];
    }
    if (self.mainVc) {
        [self.mainVc dismissViewControllerAnimated:YES completion:nil];
    }
}

//取消选择图片
-(void)cancelSelect:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectCancel)]) {
        [self.delegate selectCancel];
    }
    if (self.mainVc) {
        [self.mainVc dismissViewControllerAnimated:YES completion:nil];
    }
}

-(NSMutableArray*)alassetArr
{
    if (!_alassetArr) {
        _alassetArr = [NSMutableArray array];
    }
    return _alassetArr;
}

-(NSMutableArray*)imgViewArr
{
    if (!_imgViewArr) {
        _imgViewArr = [NSMutableArray array];
    }
    return _imgViewArr;
}

@end









