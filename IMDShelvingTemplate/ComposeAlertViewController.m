//
//  ComposeAlertViewController.m
//  IMDShelvingTemplate
//
//  Created by Liyana Roslie on 26/8/16.
//  Copyright © 2016 Liyana Roslie. All rights reserved.
//

#import "ComposeAlertViewController.h"

@interface ComposeAlertViewController () {
    NSArray *images;
}
@end

@implementation ComposeAlertViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //adjust scrollview position
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style: UIBarButtonItemStyleBordered target:self action:@selector(Back)];
    self.navigationItem.leftBarButtonItem = backButton;
    
    images = [NSArray arrayWithObjects:@"shelf1.jpg", @"shelf2.jpg", @"shelf3.jpg", nil];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

- (IBAction)Back
{
    [self dismissViewControllerAnimated:YES completion:nil]; // ios 6
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:100];
    imageView.image = [UIImage imageNamed:[images objectAtIndex:indexPath.row]];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"large_foto_frame1.jpg"]];
    
    return cell;
}

- (IBAction)selectUnit:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Please select a Unit"
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"Parcel"
                                                          style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                              //NSLog(@"You pressed Parcel");
                                                              [_unitBtnOutlet setTitle:@"Parcel" forState:UIControlStateNormal];
                                                          }];
    UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"Carton"
                                                           style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                               //NSLog(@"You pressed Carton");
                                                               [_unitBtnOutlet setTitle:@"Carton" forState:UIControlStateNormal];
                                                           }];
    UIAlertAction *thirdAction = [UIAlertAction actionWithTitle:@"Piece"
                                                          style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                              //NSLog(@"You pressed Piece");
                                                              [_unitBtnOutlet setTitle:@"Piece" forState:UIControlStateNormal];
                                                          }];
    
    
    [alert addAction:firstAction];
    [alert addAction:secondAction];
    [alert addAction:thirdAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}
@end
