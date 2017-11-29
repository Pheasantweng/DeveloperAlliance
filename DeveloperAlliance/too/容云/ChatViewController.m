//
//  ChatViewController.m
//  RoyunDemo
//
//  Created by zs on 17/7/31.
//  Copyright © 2017年 wengxianshan. All rights reserved.
//

#import "ChatViewController.h"
#import "IQKeyboardManager.h"

@interface ChatViewController ()

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.chatSessionInputBarControl.pluginBoardView removeItemAtIndex:2];
    
//    if (self.OrderId) {
//        [ZSuserInfo sharedInstance].CurrentConversationOrderId = self.OrderId;
//        NSMutableArray * messages = [[NSMutableArray alloc] init];
//        for (LocationRCMessageModel * model in [LocationRCMessageModel findAll]) {
//            NSArray * msg = [model.orderMessage componentsSeparatedByString:@"#"];
//            NSString * orderId;
//            if (msg.count == 2) {
//                orderId = msg.firstObject;
//            }else {
//                orderId = model.orderMessage;
//            }
//            if ([orderId isEqualToString:self.OrderId]) {
//                [messages addObject:model];
//            }
//        }
//        for (LocationRCMessageModel * model in messages) {
//            [model deleteObject];
//        }
//        messages = nil;
//        
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"DidEnterOrderChatNotificationCenter" object:self.OrderId];
//    }
//    
    // Do any additional setup after loading the view.
}

- (void)sendMessage:(RCMessageContent *)messageContent pushContent:(NSString *)pushContent {
    NSLog(@"%@", pushContent);
    if ([messageContent isKindOfClass:[RCTextMessage class]]) {
        RCTextMessage *textMessage = (RCTextMessage *)messageContent;
//        pushContent = [NSString stringWithFormat:@"%@:%@", [ZSuserInfo sharedInstance].Name, textMessage.content];
        
        [super sendMessage:messageContent pushContent:pushContent];
    }else {
        [super sendMessage:messageContent pushContent:pushContent];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    [IQKeyboardManager sharedManager].enable = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    [IQKeyboardManager sharedManager].enable = YES;
}

//- (void)dealloc {
//    NSLog(@"ChatViewController dealloc");
//    [ZSuserInfo sharedInstance].CurrentConversationOrderId = nil;
//}

- (RCMessageContent *)willSendMessage:(RCMessageContent *)messageContent {
    if ([messageContent isKindOfClass:[RCTextMessage class]]) {
        RCTextMessage *textMessage = (RCTextMessage *)messageContent;
        
        textMessage.extra = [NSString stringWithFormat:@"%@#%@", self.OrderId, self.orderType];
        return textMessage;
    }
    return messageContent;
}
/*!
 点击Cell中头像的回调
 
 @param userId  点击头像对应的用户ID
 */
- (void)didTapCellPortrait:(NSString *)userId;{
    
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
