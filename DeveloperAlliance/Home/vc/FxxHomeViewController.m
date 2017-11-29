//
//  FxxHomeViewController.m
//  DeveloperAlliance
//
//  Created by zs on 17/11/28.
//  Copyright © 2017年 wengxianshan. All rights reserved.
//

#import "FxxHomeViewController.h"
#import "AdvertisementPlayView.h"
#import "DCTitleRolling.h"
@interface FxxHomeViewController ()<CDDRollingDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIView *PageView;
@property (strong,nonatomic) AdvertisementPlayView *Advertis;
@property (weak, nonatomic) IBOutlet UIView *advertising;
@property (strong , nonatomic)DCTitleRolling *gmRollingView;

@end

@implementation FxxHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"首页";
 
    self.Advertis=[[AdvertisementPlayView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 180)];
    self.Advertis.images=@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1511923654675&di=d0cea109b1edcd28426b4bc7350dbbeb&imgtype=0&src=http%3A%2F%2Fwww.bazhongol.com%2Fueditor%2Fphp%2Fupload%2Fimage%2F20160818%2F1471488797941750.png",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1511923654673&di=611ff3438800a1d2736a68c3a9da6410&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F16%2F97%2F70%2F14g58PICtBm_1024.jpg"];
    [self.Advertis startWithTapActionNeedAutoScro:YES Block:^(NSInteger Index) {
        NSLog(@"%ld",Index);

    }];
    [self.PageView addSubview:self.Advertis];
    [self setUpGMRolling];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark - GM
- (void)setUpGMRolling
{
    _gmRollingView = [[DCTitleRolling alloc] initWithFrame:CGRectMake(5, 0, ScreenWidth, 30) WithTitleData:^(CDDRollingGroupStyle *rollingGroupStyle, NSString *__autoreleasing *leftImage, NSArray *__autoreleasing *rolTitles, NSArray *__autoreleasing *rolTags, NSArray *__autoreleasing *rightImages, NSString *__autoreleasing *rightbuttonTitle, NSInteger *interval, float *rollingTime, NSInteger *titleFont, UIColor *__autoreleasing *titleColor, BOOL *isShowTagBorder) {
        //*leftImage = @"ggao";

        *rolTags = @[@"今日快讯",@"今日快讯",@"今日快讯"];
        *rolTitles = @[@"今日头条",@"腾讯新闻✨✨",@"科技新闻"];
        *interval = 3.0;
        *titleFont = 12.5;
        *titleColor = GlobalColor;
        *isShowTagBorder = YES;
    }];
    _gmRollingView.delegate = self;
    [_gmRollingView dc_beginRolling];
//    _gmRollingView.backgroundColor = [UIColor whiteColor];
    [self.advertising addSubview:_gmRollingView];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
