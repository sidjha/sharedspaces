//
//  ListViewController.m
//  sharedspace
//
//  Created by Sid Jha on 2016-06-28.
//  Copyright © 2016 Mesh8. All rights reserved.
//

#import "ListViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navCollectionView.delegate = self;
    self.navCollectionView.dataSource = self;
    
    self.listTitles = [NSArray arrayWithObjects:@"Ideas", @"Interesting companies", @"Architecture", @"Hello", @"Places", nil];

    [self.navCollectionView reloadData];
    
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"navCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blackColor];
    
    // Reuse labels
    UILabel *label = [cell viewWithTag:99];
    
    if (!label) {
        label = [[UILabel alloc] initWithFrame:cell.bounds];
        label.tag = 99;
        label.text = [self.listTitles objectAtIndex:indexPath.row];
        label.textColor = [UIColor whiteColor];
        [label sizeToFit];
        
        //TODO: set bounds of UILabel
        //TODO: set text style of UILabel
        [cell.contentView addSubview:label];
    }

    //cell.layer.borderWidth=1.0f;
    //cell.layer.borderColor=[UIColor blueColor].CGColor;
    
    return cell;
}

/*
 // http://stackoverflow.com/questions/13588283/how-to-center-align-the-cells-of-a-uicollectionview
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 100, 0, 0);
}
 
 */

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    
    return [self.listTitles count];
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    label.text = [self.listTitles objectAtIndex:indexPath.row];
    [label sizeToFit];
    
    CGSize s;
    
    // http://stackoverflow.com/a/23135433/4489928
    //s = [(NSString*)[self.listTitles objectAtIndex:indexPath.row] sizeWithAttributes:NULL];
    
    //s = CGSizeMake(100.0, 20.0);
    
    s = CGSizeMake(label.intrinsicContentSize.width, label.intrinsicContentSize.height);
    
    NSLog(@"Width of cell: %f, height of cell: %f", s.width, s.height);
    return s;
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

@end