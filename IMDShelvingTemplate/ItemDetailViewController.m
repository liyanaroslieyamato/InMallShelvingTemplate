//
//  ItemDetailViewController.m
//  IMDShelvingTemplate
//
//  Created by Liyana Roslie on 23/8/16.
//  Copyright © 2016 Liyana Roslie. All rights reserved.
//

#import "ItemDetailViewController.h"

@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currQty = @[@"5", @"6", @"6", @"7", @"8"];
    self.receivedQty = @"10";
    self.unit = @"carton";
    self.remainQty = @[@"5", @"4", @"4", @"3", @"2"];
    self.shelvedTime = @[@"0900", @"1100", @"1230", @"1400", @"1600"];
    self.shelver = @[@"Tim Sui", @"Tim Sui", @"Tim Sui", @"Aaron Heng", @"Aaron Heng"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
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

#pragma mark - tableview

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.currQty count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if ([self.currQty count] > 0) {
        [self configureCell:cell atIndexPath:indexPath];
    }
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    if ([self.currQty count] > 0) {
        
        UILabel *currQtyLabel = (UILabel *)[cell viewWithTag:100];
        NSString *currQtyString = [self.currQty objectAtIndex:indexPath.row];
        currQtyLabel.text = [NSString stringWithFormat:@"Current Quantity: %@ %@ ", currQtyString, self.unit];
        
        UILabel *receivedQtyLabel = (UILabel *)[cell viewWithTag:200];
        receivedQtyLabel.text = [NSString stringWithFormat:@"Received Quantity: %@ %@", self.receivedQty, self.unit];
        
        UILabel *remainQtyLabel = (UILabel *) [cell viewWithTag:300];
        NSString *remainQty = [self.remainQty objectAtIndex:indexPath.row];
        remainQtyLabel.text = [NSString stringWithFormat:@"Remaining Quantity: %@ %@", remainQty, self.unit];
        
        UILabel *shelvingTimeLabel = (UILabel *) [cell viewWithTag:400];
        NSString *shelvingTimeString = [self.shelvedTime objectAtIndex:indexPath.row];
        shelvingTimeLabel.text = [NSString stringWithFormat:@"Shelving Time: %@", shelvingTimeString];
        
        UILabel *shelverLabel = (UILabel *) [cell viewWithTag:500];
        NSString *shelverString = [self.shelver objectAtIndex:indexPath.row];;
        shelverLabel.text = [NSString stringWithFormat:@"Shelver: %@", shelverString];
    }
}


@end
