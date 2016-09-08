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
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"cell";
    NavigationCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if(indexPath.row == 0){
        cell.title.text = @"Architect Blueprints";
        cell.moreDetails.text = @"For first floor";
        cell.smallImage.image = [UIImage imageNamed:@"blueprint"];
    }
    else if(indexPath.row == 1){
        cell.title.text = @"Paint Job [Exterior]";
        cell.moreDetails.text = @"Weather proof job done";
        cell.smallImage.image = [UIImage imageNamed:@"roller"];

    }
    else if(indexPath.row == 2){
        cell.title.text = @"Garden Wall";
        cell.moreDetails.text = @"Wall ready";
        cell.smallImage.image = [UIImage imageNamed:@"wall"];

    }
    else if(indexPath.row == 3){
        cell.title.text = @"Room Plan";
        cell.moreDetails.text = @"Room plan done";
        cell.smallImage.image = [UIImage imageNamed:@"rooms"];

    }
    else if(indexPath.row == 4){
        cell.title.text = @"Civil Engineer Visiting";
        cell.moreDetails.text = @"Today 12:00 pm";
        cell.smallImage.image = [UIImage imageNamed:@"helmet"];

    }
    else if(indexPath.row == 5){
        cell.title.text = @"Garden Landscaping";
        cell.moreDetails.text = @"Today 1:00 pm";
        cell.smallImage.image = [UIImage imageNamed:@"trees"];
        
    }
    else if(indexPath.row == 6){
        cell.title.text = @"Fence Around Garden";
        cell.moreDetails.text = @"Today 1:00 pm";
        cell.smallImage.image = [UIImage imageNamed:@"fence"];
        
    }
    else if(indexPath.row == 7){
        cell.title.text = @"Fountain";
        cell.moreDetails.text = @"Today 1:00 pm";
        cell.smallImage.image = [UIImage imageNamed:@"fountain"];
        
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100.5f;
}


@end
