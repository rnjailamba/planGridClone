//
//  NotificationsViewController.m
//  planGridClone
//
//  Created by Mr Ruby on 08/09/16.
//  Copyright © 2016 Rnjai Lamba. All rights reserved.
//

#import "NotificationsViewController.h"
#import "NotificationViewController.h"

@interface NotificationsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation NotificationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavBar];
}

-(void)setUpNavBar{
    self.navigationItem.title = @"Notifications";
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneClicked)];
    [self.navigationItem setRightBarButtonItem:barButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)doneClicked {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
