//
//  ItemDetailViewController.h
//  IMDShelvingTemplate
//
//  Created by Liyana Roslie on 23/8/16.
//  Copyright © 2016 Liyana Roslie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSArray * currQty;
@property NSString * receivedQty;
@property NSString * unit;
@property NSArray * remainQty;
@property NSArray * shelvedTime;
@property NSArray * shelver;

@end
