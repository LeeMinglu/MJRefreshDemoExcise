//
//  MLTableViewController.m
//  MJRefreshDemoExcise
//
//  Created by 李明禄 on 15/12/24.
//  Copyright © 2015年 SocererGroup. All rights reserved.
//

#import "MLTableViewController.h"
#import "MJRefresh.h"
#import "MLPerson.h"
#import "Person.h"

@interface MLTableViewController ()
@property (nonatomic, strong) NSMutableArray *persons;

@end

@implementation MLTableViewController

//1.懒加载
- (NSMutableArray *)persons {
    if (!_persons) {
        _persons = [NSMutableArray array];
    }
    return _persons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i < 40; i ++) {
        Person *person = [[Person alloc] init];
        NSString *name = [NSString stringWithFormat:@"lala %d",i+1];
        NSString *age = [NSString stringWithFormat:@"年龄：%d", i+1];
        
        person.name = name;
        person.age = age;
        
        
        [self.persons addObject:person];
    }
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 马上进入刷新状态
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];

}

- (void)loadNewData {
    NSLog(@"刷新数据");
    //开始刷新数据
    [self.tableView.mj_header beginRefreshing];
    NSMutableArray *newArray = [NSMutableArray array];
    
    for (int i = 0; i < 10; i ++) {
        Person *person = [[Person alloc] init];
        NSString *name = [NSString stringWithFormat:@"wowo%d",i+1];
        NSString *age = [NSString stringWithFormat:@"年龄：%d", i+1];
        
        person.name = name;
        person.age = age;
        
        [newArray addObject:person];
    }
    NSRange range = NSMakeRange(0, newArray.count);
    
    NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:range];
    
    [self.persons insertObjects:newArray atIndexes:set];
    
    [self.tableView reloadData];

    
    [self.tableView.mj_header endRefreshing];
}

- (void)loadMoreData {
    NSLog(@"刷新底部数据");
    
    NSMutableArray *newArray = [NSMutableArray array];
    
    for (int i = 0; i < 10; i ++) {
        Person *person = [[Person alloc] init];
        NSString *name = [NSString stringWithFormat:@"bottomData%d",i+1];
        NSString *age = [NSString stringWithFormat:@"年龄：%d", i+1];
        
        person.name = name;
        person.age = age;
        
        [newArray addObject:person];
    }
//    NSRange range = NSMakeRange(0, newArray.count);
//    
//    NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:range];
//    
//    [self.persons insertObjects:newArray atIndexes:set];
    
    [self.persons addObjectsFromArray:newArray];
    
    [self.tableView reloadData];
    

    [self.tableView.mj_footer endRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.persons.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    MLPerson *person = self.persons[indexPath.row];
    
    cell.textLabel.text = person.name;
    cell.detailTextLabel.text = person.age;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
