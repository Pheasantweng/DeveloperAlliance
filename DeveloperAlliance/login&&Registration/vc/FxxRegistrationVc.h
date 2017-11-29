//
//  FxxRegistrationVc.h
//  DeveloperAlliance
//
//  Created by zs on 17/11/28.
//  Copyright © 2017年 wengxianshan. All rights reserved.
//

#import "BaseViewController.h"

@interface FxxRegistrationVc : BaseViewController
@property (assign,nonatomic) NSInteger UserType;/*0开发者、1需求者*/
@property (assign,nonatomic) NSInteger Pagetype;/*0注册、1修改密码*/

@end
