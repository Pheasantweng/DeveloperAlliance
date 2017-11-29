//
//  FxxDeveloperProfileVC.m
//  DeveloperAlliance
//
//  Created by zs on 17/11/29.
//  Copyright © 2017年 wengxianshan. All rights reserved.
//

#import "FxxDeveloperProfileVC.h"
#import "RongyunImMethods.h"
#import "ChatViewController.h"
@interface FxxDeveloperProfileVC ()
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIButton *next;

@end

@implementation FxxDeveloperProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.backView.layer.cornerRadius=5;
    self.backView.layer.borderWidth=1;
    self.backView.layer.borderColor=RGB(221, 220, 223, 1.0).CGColor;
    self.next.layer.cornerRadius=5;
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)next:(UIButton *)sender {
    
    [[RongyunImMethods sharedInstance]Enterthechatpage:self
                                              targetId:@"180"
                                                 title:@"专家" sessiontype:ConversationType_PRIVATE];
    
//    [[RongyunImMethods sharedInstance]SetpersonaluserInformation:@"160" name:@"翁晓明" portrait:@"http://img1.imgtn.bdimg.com/it/u=2764371306,3467823016&fm=214&gp=0.jpg"];
    
    
    //  开始聊天
//    ChatViewController * conversationVC = [[ChatViewController alloc] init];
//    conversationVC.conversationType = ConversationType_PRIVATE;
//    conversationVC.targetId = self.model.ChatId;
//    conversationVC.ChatName = self.model.ChatName;
//    conversationVC.ChatImg = self.model.ChatImg;
//    conversationVC.OrderId = self.orderId;
//    conversationVC.orderType = @"b";
//    conversationVC.title = weakSelf.model.LawName;
//    conversationVC.unReadMessage = 0;
//    conversationVC.enableNewComingMessageIcon = YES; //开启消息提醒
//    conversationVC.enableUnreadMessageIcon = YES;
//    [weakSelf.navigationController pushViewController:conversationVC animated:YES];
////
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
