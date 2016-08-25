//
//  ItemListViewController.h
//  IMDShelvingTemplate
//
//  Created by Liyana Roslie on 15/8/16.
//  Copyright © 2016 Liyana Roslie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property NSArray * itemNameList;
@property NSArray * itemNoList;
@property NSArray * itemQtyList;
@property NSString *unit;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
