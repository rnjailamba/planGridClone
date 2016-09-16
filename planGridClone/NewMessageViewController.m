//
//  NewMessageViewController.m
//  planGridClone
//
//  Created by Mr Ruby on 16/09/16.
//  Copyright © 2016 Rnjai Lamba. All rights reserved.
//

#import "NewMessageViewController.h"

#define cellHt1 50
#define cellHt2 50
#define cellHt3 80

@interface NewMessageViewController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong) UITableView *tableView;
@property (strong) UITableView *chatTableView;
@property (strong) NSString *currentSearch;

@end

@implementation NewMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = [[UIScreen mainScreen]bounds];
    NSLog(@"%f",[UIScreen mainScreen].bounds.size.width);
    [self setUpNavBar];
    [self setUpSearchBar];
    [self setUpTableView];
    [self setUpChatTableView];
}

-(void)setUpChatTableView{
    self.chatTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 108, self.view.frame.size.width, self.view.frame.size.height-108) style:UITableViewStylePlain];
    self.chatTableView.delegate = self;
    self.chatTableView.dataSource =self;
    [self.view addSubview:self.chatTableView];
    self.chatTableView.hidden = YES;
    self.chatTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self registerChatNib];
    
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

-(void)registerChatNib{
    [self.chatTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"chatCell"];
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
    if(tableView == self.tableView){
        return 1;
    }
    else if(tableView == self.chatTableView){
        return 1;
    }
    else{
        return 0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == self.tableView){
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
    else if(tableView == self.chatTableView){
        static NSString *MyIdentifier = @"chatCell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        
        for(UIView *view in cell.contentView.subviews){
            [view removeFromSuperview];
        }
        UIView *chatView;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 230, 20)];
        if(indexPath.row == 0){
            chatView = [[UIView alloc]initWithFrame:CGRectMake(20, 10, 250, cellHt1)];
            label.text = @"hi i wanted to ask a question.";
            
        }
        else if(indexPath.row == 1){
            chatView = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 220, 10, 200, cellHt2)];
            label.text = @"yes please go ahead";
            label.textAlignment = NSTextAlignmentLeft;
            
        }
        else if(indexPath.row == 2){
            chatView = [[UIView alloc]initWithFrame:CGRectMake(20, 10, 250, cellHt3)];
            label.text = @"i wanted to know more about the material being used for the roofing.";
            label.numberOfLines = 0; //will wrap text in new line
            [label sizeToFit];
        }
        CALayer *upperBorder = [CALayer layer];
        upperBorder.backgroundColor = [[UIColor blackColor] CGColor];
        upperBorder.frame = CGRectMake(0, 0, chatView.frame.size.width, 1.0f);
        [chatView.layer addSublayer:upperBorder];
        
        CALayer *bottom = [CALayer layer];
        bottom.backgroundColor = [[UIColor blackColor] CGColor];
        bottom.frame = CGRectMake(0, chatView.frame.size.height - 1, chatView.frame.size.width, 1.0f);
        [chatView.layer addSublayer:bottom];

        CALayer *left = [CALayer layer];
        left.backgroundColor = [[UIColor blackColor] CGColor];
        left.frame = CGRectMake(0, 0, 1.0f, chatView.frame.size.height);
        [chatView.layer addSublayer:left];

        CALayer *right = [CALayer layer];
        right.backgroundColor = [[UIColor blackColor] CGColor];
        right.frame = CGRectMake(chatView.frame.size.width - 1, 0, 1.0f, chatView.frame.size.height);
        [chatView.layer addSublayer:right];
        
        [chatView addSubview:label];
        [cell.contentView addSubview:chatView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else{
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView == self.tableView){
        return 40;
    }
    else if(tableView == self.chatTableView){
        if(indexPath.row == 0){
            return cellHt1;
        }
        else if(indexPath.row == 1){
            return cellHt2;
        }
        else if(indexPath.row == 2){
            return cellHt3;
        }
        else{
            return 0;
        }
    }
    else{
        return 0;
    }
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
    self.chatTableView.hidden = NO;
}



@end
