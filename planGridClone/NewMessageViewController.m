//
//  NewMessageViewController.m
//  planGridClone
//
//  Created by Mr Ruby on 16/09/16.
//  Copyright © 2016 Rnjai Lamba. All rights reserved.
//

#import "NewMessageViewController.h"

@interface NewMessageViewController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong) UITableView *tableView;
@property (strong) NSString *currentSearch;

@end

@implementation NewMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavBar];
    [self setUpSearchBar];
    [self setUpTableView];
}

-(void)setUpTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 108, self.view.frame.size.width, self.view.frame.size.height-108) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
    [self.view addSubview:self.tableView];
    self.tableView.hidden = YES;
    [self registerNib];

}

-(void)registerNib{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

-(void)setUpSearchBar{
    [self.searchBar becomeFirstResponder];
    self.searchBar.delegate = self;
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

#pragma UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"%@",searchBar.text);
    if(searchBar.text.length > 0){
        [self handleSearch:searchBar.text];
    }
    else{
        self.tableView.hidden = YES;
    }
}

-(void)handleSearch:(NSString *)searchText{
    self.currentSearch = searchText;
    [self.tableView reloadData];
    [self.tableView setHidden:NO];
    
}

#pragma UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    for(UIView *view in cell.contentView.subviews){
        [view removeFromSuperview];
    }
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, self.view.frame.size.width, 20)];
    if(indexPath.row == 0){
        label.text = [NSString stringWithFormat:@"architect@%@.com",self.currentSearch];

    }
    else if(indexPath.row == 1){
        label.text = [NSString stringWithFormat:@"constructionExpert@%@.com",self.currentSearch];

    }
    else if(indexPath.row == 2){
        label.text = [NSString stringWithFormat:@"civilEngineer@%@.com",self.currentSearch];
        
    }
    
    [cell.contentView addSubview:label];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 40;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"did select %ld",(long)indexPath.row);
    self.tableView.hidden = YES;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 44)];
    view.backgroundColor = [UIColor lightGrayColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 12, self.view.frame.size.width, 20)];
    if(indexPath.row == 0){
        label.text = [NSString stringWithFormat:@"To: architect@%@.com",self.currentSearch];;
    }
    else if(indexPath.row == 1){
        label.text = [NSString stringWithFormat:@"To: constructionExpert@%@.com",self.currentSearch];
    }
    else if(indexPath.row == 2){
        label.text = [NSString stringWithFormat:@"To: civilEngineer@%@.com",self.currentSearch];
    }
    [view addSubview:label];
    [self.view addSubview:view];
}



@end
