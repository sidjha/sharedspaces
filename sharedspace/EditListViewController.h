//
//  EditListViewController.h
//  sharedspace
//
//  Created by Sid Jha on 2016-06-01.
//  Copyright © 2016 Mesh8. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditListViewController : UIViewController <UITextViewDelegate>


@property (weak, nonatomic) IBOutlet UIButton *bulletButton;
@property (weak, nonatomic) IBOutlet UIButton *numbersButton;
@property (weak, nonatomic) IBOutlet UIButton *todosButton;
@property (weak, nonatomic) IBOutlet UITextView *listTextView;

@end
