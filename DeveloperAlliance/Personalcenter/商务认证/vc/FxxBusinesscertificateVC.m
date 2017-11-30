//
//  FxxBusinesscertificateVC.m
//  DeveloperAlliance
//
//  Created by zs on 17/11/29.
//  Copyright © 2017年 wengxianshan. All rights reserved.
//

#import "FxxBusinesscertificateVC.h"

@interface FxxBusinesscertificateVC ()
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIButton *next;

@end

@implementation FxxBusinesscertificateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.backView.layer.cornerRadius=5;
    self.backView.layer.borderWidth=1;
    self.backView.layer.borderColor=RGB(221, 220, 223, 1.0).CGColor;
    self.next.layer.cornerRadius=5;
    
    // Do any additional setup after loading the view from its nib.
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
