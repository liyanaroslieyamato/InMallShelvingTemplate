//
//  AlertTableViewController.m
//  IMDShelvingTemplate
//
//  Created by Liyana Roslie on 26/8/16.
//  Copyright © 2016 Liyana Roslie. All rights reserved.
//

#import "AlertTableViewController.h"

@interface AlertTableViewController ()

@end

@implementation AlertTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style: UIBarButtonItemStyleBordered target:self action:@selector(Back)];
    self.navigationItem.leftBarButtonItem = backButton;
    
    //populate the array data
    self.tenantNameArray = @[@"Mini Toons", @"Hockhua Tonic", @"Hockhua Tonic", @"Aldo", @"Avenue Kids", @"BBQ Express"];
    self.unitNoArray = @[@"#03-19", @"#B1-13A/13", @"#B1-13A/13", @"#01-08/09", @"03-02", @"B1-K19"];
    self.itemNameArray = @[@"Brown Plush Teddy Special Edition", @"ACV - Blueberry", @"Organic White Coffee", @"Black Soft Pumps Diamond Edition (4)", @"Kids Adidas Sneakers - Superstar Edition (0-3)", @"Satay Chicken"];
    self.qtyReqArray = @[@"10 piece", @"3 cartons", @"3 cartons", @"2 parcel", @"1 parcel", @"5 parcel"];
    
}

- (IBAction)Back
{
    [self dismissViewControllerAnimated:YES completion:nil]; // ios 6
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tenantNameArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    UILabel *tenantNameLabel = (UILabel *)[cell viewWithTag:100];
    [tenantNameLabel setText:self.tenantNameArray[indexPath.row]];
    
    UILabel *unitNoLabel = (UILabel *)[cell viewWithTag:200];
    [unitNoLabel setText:self.unitNoArray[indexPath.row]];
    
    UILabel *itemNameLabel= (UILabel *)[cell viewWithTag:300];
    [itemNameLabel setText:self.itemNameArray[indexPath.row]];
    
    UILabel *qtyLabel= (UILabel *)[cell viewWithTag:400];
    [qtyLabel setText:self.qtyReqArray[indexPath.row]];
    
}

@end
