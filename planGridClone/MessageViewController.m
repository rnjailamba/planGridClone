//
//  MessageViewController.m
//  planGridClone
//
//  Created by Mr Ruby on 16/09/16.
//  Copyright © 2016 Rnjai Lamba. All rights reserved.
//

#import "MessageViewController.h"
#import "NewMessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavBar];
    // Do any additional setup after loading the view from its nib.
}

-(void)setUpNavBar{
    self.navigationItem.title = @"Messages";
    UIButton *buttonView1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
    [buttonView1 addTarget:self action:@selector(newMessageClicked) forControlEvents:UIControlEventTouchUpInside];
    [buttonView1 setBackgroundImage:[UIImage imageNamed:@"edit.png"] forState:UIControlStateNormal];
    UIBarButtonItem *barButton1 = [[UIBarButtonItem alloc] initWithCustomView:buttonView1];
    
    [self.navigationItem setRightBarButtonItem:barButton1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)newMessageClicked{
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:[[NewMessageViewController alloc]initWithNibName:@"NewMessageViewController" bundle:nil]];
    [self.navigationController presentViewController:navController animated:YES completion:nil];
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
