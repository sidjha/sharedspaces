//
//  ListViewController.h
//  sharedspace
//
//  Created by Sid Jha on 2016-06-28.
//  Copyright © 2016 Mesh8. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *navCollectionView;
@property (nonatomic, strong) NSArray *listTitles;
@property (nonatomic, assign) int activeList;

@end
