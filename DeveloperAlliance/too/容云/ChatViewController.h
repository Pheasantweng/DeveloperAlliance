//
//  ChatViewController.h
//  RoyunDemo
//
//  Created by zs on 17/7/31.
//  Copyright © 2017年 wengxianshan. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>

@interface ChatViewController : RCConversationViewController

@property (nonatomic, copy)NSString * ChatId;
@property (nonatomic, copy)NSString * ChatImg;
@property (nonatomic, copy)NSString * ChatName;
@property (nonatomic, copy)NSString * OrderId;
@property (nonatomic, copy)NSString * orderType;

@end
