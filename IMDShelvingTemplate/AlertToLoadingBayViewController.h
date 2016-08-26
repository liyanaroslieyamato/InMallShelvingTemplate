//
//  ComposeAlertViewController.h
//  IMDShelvingTemplate
//
//  Created by Liyana Roslie on 26/8/16.
//  Copyright © 2016 Liyana Roslie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertToLoadingBayViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *unitBtnOutlet;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

- (IBAction)selectUnit:(id)sender;

@end
