//
//  RongyunImMethods.m
//  RoyunDemo
//
//  Created by zs on 17/8/4.
//  Copyright © 2017年 wengxianshan. All rights reserved.
//

#import "RongyunImMethods.h"
#import <RongCallKit/RongCallKit.h>
#import "ChatViewController.h"
//#import "LocationRCMessageModel.h"
@interface RongyunImMethods()
@property (copy,nonatomic) MsgBlock MsgModel;
@end
@implementation RongyunImMethods
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static id instance;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

/**
 初始化SDK
 */
-(void)InitSDK;{
    
    /*SDK初始化*/
    [[RCIM sharedRCIM] initWithAppKey:@"8luwapkv8rm2l"];
    /*容云相关*/
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveMessageNotification:)
                                                 name:RCKitDispatchMessageNotification
                                               object:nil];
    
    [RCIM sharedRCIM].receiveMessageDelegate = self;
    [[RCIM sharedRCIM] setUserInfoDataSource:self];
}

- (void)didReceiveMessageNotification:(NSNotification *)notification {
    
    NSNumber *left = [notification.userInfo objectForKey:@"left"];
    if ([RCIMClient sharedRCIMClient].sdkRunningMode ==
        RCSDKRunningMode_Backgroud &&
        0 == left.integerValue) {
        int unreadMsgCount = [[RCIMClient sharedRCIMClient] getUnreadCount:@[
                                                                             @(ConversationType_PRIVATE),
                                                                             @(ConversationType_DISCUSSION),
                                                                             @(ConversationType_APPSERVICE),
                                                                             @(ConversationType_PUBLICSERVICE),
                                                                             @(ConversationType_GROUP)
                                                                             ]];
        [UIApplication sharedApplication].applicationIconBadgeNumber =
        unreadMsgCount;
    }
}
/**
 容云登录
 
 @param Token Token (由服务器返回)
 @param success 登录成功
 @param error 登录失败
 */
-(void)login:(NSString *)Token
     success:(void(^)(NSString*success))success
       error:(void (^)(NSString *error))error;{
    [[RCIM sharedRCIM] connectWithToken:Token success:^(NSString *userId) {
        
        
        
        if (success) {
            success(userId);
        }
    } error:^(RCConnectErrorCode status) {
        if (error) {
            error([NSString stringWithFormat:@"%ld", (long)status]);
        }
    } tokenIncorrect:^{
        if (error) {
            error(@"Token错误");
        }
    }];
}

/**
 设置个人用户信息
 
 @param userId 用户Id
 @param userName 设置昵称
 @param ImageUrl 设置显示头像
 */
-(void)SetpersonaluserInformation:(NSString *)userId
                             name:(NSString *)userName
                         portrait:(NSString *)ImageUrl{
    [RCIM sharedRCIM].currentUserInfo = [[RCUserInfo alloc]
                               initWithUserId:userId
                                         name:userName
                                         portrait:ImageUrl];
}

/**
 清空SDK用户信息
 */
-(void)clearUserInfoCache;{
    [[RCIM sharedRCIM]clearUserInfoCache];
}

/**
 进入会话界面

 @param Vc 当前视图控制器
 @param targetId 会话Id (如果会话类型不是单聊 传递对应Id 例如群组Id)
 @param title 导航栏显示的标题
 @param RCConversationType 会话类型
 */
-(void)Enterthechatpage:(UIViewController *)Vc
               targetId:(NSString *)targetId
                  title:(NSString *)title
            sessiontype:(RCConversationType )RCConversationType{
    
    //新建一个聊天会话View Controller对象,建议这样初始化
    ChatViewController *chat = [[ChatViewController alloc]initWithConversationType:RCConversationType
                                                                          targetId:targetId];
    //设置会话的类型，如单聊、讨论组、群聊、聊天室、客服、公众服务会话等
    chat.conversationType = RCConversationType;
    //设置会话的目标会话ID。（单聊、客服、公众服务会话为对方的ID，讨论组、群聊、聊天室为会话的ID）
    chat.targetId = targetId;
    //设置聊天会话界面要显示的标题
    chat.title = title;
    chat.enableNewComingMessageIcon = YES; //开启消息提醒
    chat.enableUnreadMessageIcon = YES;
    chat.displayUserNameInCell=YES;
    //显示聊天会话界面
    [Vc.navigationController pushViewController:chat animated:YES];
}

/**
 监听接收到的消息回调
 */
-(void)Monitormessagesreceivedcallback:(MsgBlock )Msg{
   self.MsgModel=Msg;
}

/**
 接受到本地消息回调
 
 @param message 消息题
 @param left ni
 */
- (void)onRCIMReceiveMessage:(RCMessage *)message
                        left:(int)left;{
//    if ([ZSuserInfo sharedInstance].CurrentConversationOrderId) {
//        if ([message.content isKindOfClass:[RCTextMessage class]]) {
//            RCTextMessage * textMessage = (RCTextMessage *)message.content;
//            NSArray * msg = [textMessage.extra componentsSeparatedByString:@","];
//            if (msg.count == 2) {
//                if (![msg.firstObject isEqualToString:[ZSuserInfo sharedInstance].CurrentConversationOrderId]) {
//                    LocationRCMessageModel * model;
//                    for (LocationRCMessageModel * messageModel in [LocationRCMessageModel findAll]) {
//                        if ([messageModel.orderMessage isEqualToString:textMessage.extra]) {
//                            model = messageModel;
//                            break;
//                        }
//                    }
//                    if (model) {
//                        model.count += 1;
//                        [model update];
//                    }else {
//                        LocationRCMessageModel * model = [[LocationRCMessageModel alloc] init];
//                        model.senderId = message.senderUserId;
//                        model.orderMessage = textMessage.extra;
//                        model.count = 1;
//                        [model save];
//                    }
//                }
//            }
//        }
//    }else {
//        if ([message.content isKindOfClass:[RCTextMessage class]]) {
//            RCTextMessage * textMessage = (RCTextMessage *)message.content;
//            LocationRCMessageModel * model;
//            for (LocationRCMessageModel * messageModel in [LocationRCMessageModel findAll]) {
//                if ([messageModel.orderMessage isEqualToString:textMessage.extra]) {
//                    model = messageModel;
//                    break;
//                }
//            }
//            if (model) {
//                model.count += 1;
//                [model update];
//            }else {
//                LocationRCMessageModel * model = [[LocationRCMessageModel alloc] init];
//                model.senderId = message.senderUserId;
//                model.orderMessage = textMessage.extra;
//                model.count = 1;
//                [model save];
//            }
//        }
//    }
//    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"ShouldUpdateBadgeNotificationCenter" object:nil];
    
    if (self.MsgModel) {
        self.MsgModel(message);
    }
}

/**
 创建一个讨论组
 
 @param name 讨论组名次
 @param userIdList 用户数组
 @param success 创建成功回调 （ RCDiscussion ）
 @param error 错误回调
 */
-(void)Createagroupdiscussion:(NSString *)name
                   userIdList:(NSArray *)userIdList
                      success:(void(^)(RCDiscussion* discussion))success
                        error:(void (^)(NSString *error))error;{

    [[RCIMClient sharedRCIMClient]createDiscussion:name
                                        userIdList:userIdList
                                          success:^(RCDiscussion *discussion)
    {
        if (success) {
            success(discussion);
        }
    } error:^(RCErrorCode status) {
        if (error) {
            error(@"创建失败");
        }
    }];
}
/**
 邀请成员加入讨论组
 
 @param discussionId 讨论组Id
 @param userIdList 用户Id数组
 @param success  成功回调
 @param error 失败回调
 */
-(void)Joinadiscussiongroup:(NSString*)discussionId
                 userIdList:(NSArray<NSString*>*)userIdList
                    success:(void (^)(RCDiscussion *discussion))success
                      error:(void(^)(NSString*error))error;{
    
    [[RCIMClient sharedRCIMClient]addMemberToDiscussion:discussionId
                                             userIdList:userIdList
                                                success:^(RCDiscussion *discussion) {
                                                    if (success) {
                                                        success(discussion);
                                                    }
                                                } error:^(RCErrorCode status) {
                                                    if (error) {
                                                        error(@"加入失败");
                                                    }
                                                }];
}

/**
 退出讨论组

 @param discussionId 讨论组Id
 @param success 成功回调
 @param error 失败回调
 */
-(void)Exitdiscussiongroup:(NSString*)discussionId
                   success:(void (^)(RCDiscussion *discussion))success
                     error:(void(^)(NSString *error))error {

    [[RCIMClient sharedRCIMClient]quitDiscussion:discussionId
                                         success:^(RCDiscussion *discussion) {
                                             if (success) {
                                                 success(discussion);
                                             }
    } error:^(RCErrorCode status) {
        if (error) {
            error(@"退出失败");
        }
    }];
}

- (void)getUserInfoWithUserId:(NSString *)userId
                   completion:(void (^)(RCUserInfo *userInfo))completion
{
    return completion([[RCUserInfo alloc] initWithUserId:@"160" name:@"BBBB" portrait:@"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1837685271,966827501&fm=27&gp=0.jpg"]);
}

@end
