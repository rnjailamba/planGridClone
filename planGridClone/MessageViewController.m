//
//  MessageViewController.m
//  planGridClone
//
//  Created by Mr Ruby on 16/09/16.
//  Copyright © 2016 Rnjai Lamba. All rights reserved.
//

#import "MessageViewController.h"

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
