//
//  RongyunImMethods.h
//  RoyunDemo
//
//  Created by zs on 17/8/4.
//  Copyright © 2017年 wengxianshan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RongCallKit/RongCallKit.h>
typedef void (^MsgBlock)(RCMessage *msg);
@interface RongyunImMethods : NSObject<RCIMReceiveMessageDelegate, RCIMUserInfoDataSource>

//pod 'RongCloudIM/IMLib', '2.8.0'
//pod 'RongCloudIM/IMKit', '2.8.0'
//pod 'RongCloudIM/CallLib', '2.8.0'
//pod 'RongCloudIM/CallKit', '2.8.0'

+ (instancetype)sharedInstance;

/**
 初始化SDK
 */
-(void)InitSDK;

/**
 容云登录

 @param Token Token (由服务器返回)
 @param success 登录成功
 @param error 登录失败
 */
-(void)login:(NSString *)Token
     success:(void(^)(NSString*success))success
       error:(void (^)(NSString *error))error;

/**
 设置个人用户信息

 @param userId 用户Id
 @param userName 设置昵称
 @param ImageUrl 设置显示头像
 */
-(void)SetpersonaluserInformation:(NSString *)userId
                             name:(NSString *)userName
                         portrait:(NSString *)ImageUrl;

/**
 清空SDK用户信息
 */
-(void)clearUserInfoCache;

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
            sessiontype:(RCConversationType )RCConversationType;

#pragma mark 接收消息回调
/**
 监听接收到的消息回调
 */
-(void)Monitormessagesreceivedcallback:(MsgBlock )Msg;

#pragma mark 讨论组
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
                        error:(void (^)(NSString *error))error;

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
                      error:(void(^)(NSString*error))error;

/**
 退出讨论组
 
 @param discussionId 讨论组Id
 @param success 成功回调
 @param error 失败回调
 */
-(void)Exitdiscussiongroup:(NSString*)discussionId
                   success:(void (^)(RCDiscussion *discussion))success
                     error:(void(^)(NSString *error))error;


@end
