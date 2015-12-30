//
//  ViewController.m
//  AssetsLibraryImgChooseDemo
//
//  Created by jiangtd on 15/12/30.
//  Copyright © 2015年 jiangtd. All rights reserved.
//

#import "ViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "JGImgChoose.h"

@interface ViewController ()<JGImgSelectDelegate>

@property(nonatomic,strong)ALAssetsLibrary *library;
@property(nonatomic,strong)NSMutableArray *groupArr;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self enumAllImg];
}

-(void)enumAllImg
{
    _library = [[ALAssetsLibrary alloc]init];
    [_library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        
        if (group) {
            [self.groupArr addObject:group];
        }
        
    } failureBlock:^(NSError *error) {
        
        NSLog(@"failed");
        
    }];
    
    
}

//选择图片
-(void)selectSecceedWithImgs:(NSArray*)imgs
{
    if(_imgView.isAnimating)
    {
        [_imgView stopAnimating];
    }
    
    _imgView.animationImages = imgs;
    _imgView.animationDuration = imgs.count;
    _imgView.animationRepeatCount = 0;
    
    [_imgView startAnimating];
    NSLog(@"selectIMg:%@",imgs);
}
//取消选择图片
-(void)selectCancel
{
    NSLog(@"cancel selectImg");
}

- (IBAction)addImgToJtdGroup:(id)sender
{
    JGImageGoupPickerViewController *jgImgVc = [[JGImageGoupPickerViewController alloc] init];
    jgImgVc.choosetImgType = ChoosetImgTypefullScreenImage;
    [self presentImgGroupViewController:jgImgVc animated:YES completion:nil];
    
}

-(NSMutableArray*)groupArr
{
    if (!_groupArr) {
        _groupArr = [NSMutableArray array];
    }
    return _groupArr;
}

@end




















