//
//  ListViewController.h
//  sharedspace
//
//  Created by Sid Jha on 2016-06-28.
//  Copyright © 2016 Mesh8. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *navCollectionView;
@property (nonatomic, strong) NSArray *listTitles;
@property (nonatomic, assign) int activeList;
@property (weak, nonatomic) IBOutlet UIButton *bulletsButton;
@property (weak, nonatomic) IBOutlet UIButton *numbersButton;
@property (weak, nonatomic) IBOutlet UIButton *todosButton;
@property (weak, nonatomic) IBOutlet UITextView *listTextView;


@end
