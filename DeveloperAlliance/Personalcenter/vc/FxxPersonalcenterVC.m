//
//  FxxPersonalcenterVC.m
//  DeveloperAlliance
//
//  Created by zs on 17/11/28.
//  Copyright © 2017年 wengxianshan. All rights reserved.
//

#import "FxxPersonalcenterVC.h"
#import "FxxDeveloperProfileVC.h"
@interface FxxPersonalcenterVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *Image;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation FxxPersonalcenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"个人中心";
    self.Image.layer.cornerRadius=5;
    self.tableview.tableFooterView=[UIView new];
    // Do any additional setup after loading the view from its nib.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 4;
    }else{
        return 1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        UITableViewCell *Cell =[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        if (Cell==nil) {
            Cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
        }
        Cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        Cell.imageView.image=[UIImage imageNamed:@[@"p_0",@"p_1",@"p_2",@"p_3"][indexPath.row]];
        Cell.textLabel.text=@[@"开发者认证",@"商户认证",@"我的钱包",@"关于我们"][indexPath.row];
        Cell.detailTextLabel.text=@[@"开发者未认证",@"商户未认证",@"",@""][indexPath.row];
        Cell.detailTextLabel.textColor=[UIColor redColor];
        return Cell;

    }else{
        UITableViewCell *Cell =[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell3"];
        if (Cell==nil) {
            Cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell3"];
            Cell.selectionStyle=UITableViewCellSelectionStyleNone;
            UILabel *title =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
            title.text=@"退出";
            title.font=[UIFont fontWithName:@"" size:15];
            title.textAlignment=1;
            [Cell addSubview:title];
        }
        return Cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0) {
        switch (indexPath.row) {
            case 0:
            {
                FxxDeveloperProfileVC *Vc =[[FxxDeveloperProfileVC alloc]init];
                Vc.navigationItem.title=@"开发者资质认证";
                [self.navigationController pushViewController:Vc animated:YES];
            }
                break;
            case 1:
            {
            }
                break;
            case 2:
            {
                
            }
                break;
                
            default:
                break;
        }
    }
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
