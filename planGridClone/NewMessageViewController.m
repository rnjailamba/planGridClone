//
//  NewMessageViewController.m
//  planGridClone
//
//  Created by Mr Ruby on 16/09/16.
//  Copyright © 2016 Rnjai Lamba. All rights reserved.
//

#import "NewMessageViewController.h"

@interface NewMessageViewController ()

@end

@implementation NewMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavBar];
//    [self setUpTableView];
//    [self registerNib];
}

-(void)setUpNavBar{
    self.navigationItem.title = @"New Message";
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(doneClicked)];
    [self.navigationItem setRightBarButtonItem:barButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)doneClicked{
    [self dismissViewControllerAnimated:YES completion:nil];
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
