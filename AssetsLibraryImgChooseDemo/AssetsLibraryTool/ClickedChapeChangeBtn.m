//
//  clickedChapeChangeBtn.m
//  AssetsLibraryImgChooseDemo
//
//  Created by jiangtd on 15/12/30.
//  Copyright © 2015年 jiangtd. All rights reserved.
//

#import "ClickedChapeChangeBtn.h"

@interface ClickedChapeChangeBtn ()

@property(nonatomic,assign)NSInteger count;

@end

@implementation ClickedChapeChangeBtn

+(ClickedChapeChangeBtn*)clickedChapeChangeBtn
{
    ClickedChapeChangeBtn *btn = [ClickedChapeChangeBtn buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"checked"] forState:UIControlStateSelected];
    btn.layer.cornerRadius = 15;
    btn.layer.masksToBounds = YES;
    btn.layer.borderColor = [UIColor clearColor].CGColor;
    btn.layer.borderWidth = 2.0f;
    btn.count = 0;
    return btn;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (selected) {
        self.count = 0;
        [self enlargeAndReduceShape];
    }
}

-(void)enlargeAndReduceShape
{
    self.count++;
    [UIView animateWithDuration:0.1 animations:^{
        CGFloat scale = [self scale];
        self.transform = CGAffineTransformMakeScale(scale,scale);
        
    } completion:^(BOOL finished) {
        sleep(.1);
        if (self.count < 6) {
            [self enlargeAndReduceShape];
        }
        
    }];
}

-(CGFloat)scale
{
    CGFloat scales[]={1.1,0.8,1.0,1.1,0.8,1.0};
    if (self.count>=0 && self.count <5) {
        return scales[self.count - 1];
    }
    return 1;
    
}


@end
























