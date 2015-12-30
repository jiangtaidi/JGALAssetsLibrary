//
//  JGImageGoupDisplayViewController.m
//  AssetsLibraryImgChooseDemo
//
//  Created by jiangtd on 15/12/30.
//  Copyright © 2015年 jiangtd. All rights reserved.
//

#import "JGImageGoupPickerViewController.h"
#import "JGImageSelectViewController.h"
#import "JGImgGroup.h"

@interface JGImageGoupPickerViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray *groupArr;
@property(nonatomic,strong)ALAssetsLibrary *library;

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation JGImageGoupPickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupGroupArr];
    [self setupUI];
}

-(NSString*)title
{
    return @"照片";
}

-(void)setupGroupArr
{
    [self.library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group) {
            JGImgGroup *imgGroup = [JGImgGroup imgGroupWithGroup:group];
            [self.groupArr addObject:imgGroup];
            [self.tableView reloadData];
        }
    } failureBlock:^(NSError *error) {
        
    }];
}

-(void)setupUI
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 55;
    [self.view addSubview:tableView];
    
    _tableView = tableView;
}


-(NSMutableArray*)groupArr
{
    if (!_groupArr) {
        _groupArr = [NSMutableArray array];
    }
    return _groupArr;
}

-(ALAssetsLibrary*)library
{
    if (!_library) {
        _library = [[ALAssetsLibrary alloc] init];
    }
    return _library;
}

#pragma mark ===============Delegate=================

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.groupArr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseId];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    JGImgGroup *group = self.groupArr[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@(%ld)",group.groupName,group.numImgOfGroup];
    cell.imageView.image = [UIImage imageWithCGImage:[group.group posterImage]];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JGImgGroup *group = self.groupArr[indexPath.row];
    JGImageSelectViewController *selectImgVc = [[JGImageSelectViewController alloc] init];
    selectImgVc.imgGroup = group;
    selectImgVc.delegate = _delegate;
    selectImgVc.mainVc = self;
    selectImgVc.chooseImgType = self.choosetImgType;
    [self.navigationController pushViewController:selectImgVc animated:YES];
}

@end
















