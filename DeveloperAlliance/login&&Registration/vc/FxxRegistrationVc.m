//
//  FxxRegistrationVc.m
//  DeveloperAlliance
//
//  Created by zs on 17/11/28.
//  Copyright © 2017年 wengxianshan. All rights reserved.
//

#import "FxxRegistrationVc.h"

@interface FxxRegistrationVc ()
@property (weak, nonatomic) IBOutlet UITextField *PhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *Code;
@property (weak, nonatomic) IBOutlet UIButton *getcode;
@property (weak, nonatomic) IBOutlet UITextField *psw;
@property (weak, nonatomic) IBOutlet UITextField *Repeatpassword;
@property (weak, nonatomic) IBOutlet UIButton *submit;

@end

@implementation FxxRegistrationVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.submit.layer.cornerRadius=17.5;
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)submit:(UIButton *)sender {
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
