//
//  NotificationsViewController.m
//  planGridClone
//
//  Created by Mr Ruby on 08/09/16.
//  Copyright © 2016 Rnjai Lamba. All rights reserved.
//

#import "NotificationsViewController.h"
#import "NotificationViewController.h"
#import "NavigationCell.h"

@interface NotificationsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation NotificationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavBar];
    [self setUpTableView];
    [self registerNib];
}

-(void)setUpTableView{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)registerNib{
    [self.tableView registerNib:[UINib nibWithNibName:@"NavigationCell" bundle:nil] forCellReuseIdentifier:@"cell"];
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

#pragma UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100.5f;
}


@end
