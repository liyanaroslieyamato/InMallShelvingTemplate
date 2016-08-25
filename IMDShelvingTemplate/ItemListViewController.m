//
//  ItemListViewController.m
//  IMDShelvingTemplate
//
//  Created by Liyana Roslie on 15/8/16.
//  Copyright © 2016 Liyana Roslie. All rights reserved.
//

#import "ItemListViewController.h"
#import "ItemDetailViewController.h"

@interface ItemListViewController ()

@end

@implementation ItemListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.itemNameList = @[@"ACV - Promegenate", @"ACV - Apple", @"ACV - Blueberry", @"Organic White Coffee", @"Organic Cappacino", @"Premium Vitamin C"];
    self.itemNoList = @[@"18001123", @"18001124", @"18001125", @"19001167", @"19001168", @"11071123"];
    self.itemQtyList = @[@"5", @"3", @"7", @"6", @"4", @"10"];
    self.unit = @"carton";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"goToItemDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        UINavigationController *navigationController = segue.destinationViewController;
        ItemDetailViewController *detailVC = [[navigationController viewControllers] objectAtIndex:0];
    }
}

#pragma mark - tableview

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.itemNameList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if ([self.itemNameList count] > 0) {
        [self configureCell:cell atIndexPath:indexPath];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [self performSegueWithIdentifier: @"goToItemDetail" sender: self];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    if ([self.itemNameList count] > 0) {
        
        UILabel *itemNameLabel = (UILabel *)[cell viewWithTag:100];
        itemNameLabel.text = [self.itemNameList objectAtIndex:indexPath.row];
        
        UILabel *itemQtyLabel = (UILabel *)[cell viewWithTag:200];
        NSString *qty = [self.itemQtyList objectAtIndex:indexPath.row];
        itemQtyLabel.text = [NSString stringWithFormat:@" %@ %@", qty, self.unit];
        
        UILabel *itemNoLabel = (UILabel *) [cell viewWithTag:300];
        itemNoLabel.text = [self.itemNoList objectAtIndex:indexPath.row];
    }
}



@end
