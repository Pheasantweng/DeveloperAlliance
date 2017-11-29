//
//  FxxChoosetypeVc.m
//  DeveloperAlliance
//
//  Created by zs on 17/11/28.
//  Copyright © 2017年 wengxianshan. All rights reserved.
//

#import "FxxChoosetypeVc.h"
#import "FxxChoosetypeCell.h"
#import "FxxRegistrationVc.h"
@interface FxxChoosetypeVc ()<UITableViewDelegate,UITableViewDataSource>{
    NSInteger Index;
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation FxxChoosetypeVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"选择注册类型";
    [self.tableview registerNib:[UINib nibWithNibName:@"FxxChoosetypeCell"
                                               bundle:[NSBundle mainBundle]]
                               forCellReuseIdentifier:@"FxxChoosetypeCell"];
    self.tableview.tableFooterView=[UIView new];
    Index=0;
    [self Rightbutton];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark 右边导航栏按钮

-(void)Rightbutton{
    UIButton *RightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    RightBtn.frame=CGRectMake(20, 0, 100, 44);
    RightBtn.titleLabel.textAlignment=2;
    [RightBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [RightBtn addTarget:self action:@selector(Next) forControlEvents:UIControlEventTouchUpInside];
    [RightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *RightButton =[[UIBarButtonItem alloc]initWithCustomView:RightBtn];
    self.navigationItem.rightBarButtonItem=RightButton;
}
-(void)Next{
    FxxRegistrationVc *Vc =[[FxxRegistrationVc alloc]init];
    Vc.UserType=Index;
    Vc.Pagetype=0;
    Vc.navigationItem.title=@"账号注册";
    [self.navigationController pushViewController:Vc animated:YES];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FxxChoosetypeCell *Cell =[tableView dequeueReusableCellWithIdentifier:@"FxxChoosetypeCell"];
    Cell.userImage.image=[UIImage imageNamed:@[@"developers",@"demanders"][indexPath.row]];
    Cell.ElectImage.image=[UIImage imageNamed:@[@"gou",@"gou"][indexPath.row]];
    Cell.userType.text=@[@"开发者",@"需求者"][indexPath.row];
    if (Index==indexPath.row) {
        Cell.ElectImage.hidden=NO;
    }else{
        Cell.ElectImage.hidden=YES;
    }
    return Cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Index=indexPath.row;
    [self.tableview reloadData];
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
