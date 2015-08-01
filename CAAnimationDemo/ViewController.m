//
//  ViewController.m
//  CAAnimationDemo
//
//  Created by luyao's IMac on 7/31/15.
//  Copyright (c) 2015 luyao's IMac. All rights reserved.
//

#import "ViewController.h"
#import "LYViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *animationItems;
    UITableView *tableView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title =@"AnimationDemos";
    [self initilizeData];
    [self createTableView];
}

-(void)initilizeData
{
    
    animationItems =[NSMutableArray arrayWithObjects:@"CAKeyframeAnimation",@"CAAnimationGroup",@"UIViewAnimation",@"CABasicAnimation",nil];
    
}

-(void)createTableView
{
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.rowHeight=44.0;
    [self.view addSubview:tableView];
}

-(UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier =@"UITableViewStylePlain";
    UITableViewCell *cell =[_tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        cell.textLabel.text =[animationItems objectAtIndex:indexPath.row];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return animationItems.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYViewController *vc = [[LYViewController alloc] init];
    vc.navTitle =[animationItems objectAtIndex:indexPath.row];
    vc.animationType =(int)indexPath.row;
    [self.navigationController pushViewController:vc animated:YES];
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
