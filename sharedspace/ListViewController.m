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

NSString * mode; // mode - bullets/numbers/todos
int counter;

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navCollectionView.delegate = self;
    self.navCollectionView.dataSource = self;
    
    self.listTitles = [NSArray arrayWithObjects:@"Ideas", @"Interesting companies", @"Architecture", @"Hello", @"Places", nil];
    
    
    self.listTextView.delegate = self;
    self.listTextView.text = @"\u2022 ";
    
    self.activeList = 1;

   // self.navCollectionView.contentInset.top = max((self.navCollectionView.frame.height - self.navCollectionView.contentSize.height) / 2, 0)
    [self.navCollectionView reloadData];
    
    self.bulletsButton.layer.borderWidth = 1.0f;
    self.bulletsButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.bulletsButton.layer.cornerRadius = 5.0f;
    self.bulletsButton.layer.backgroundColor = [UIColor blueColor].CGColor;
    self.bulletsButton.tintColor = [UIColor whiteColor];

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
        /*if (indexPath.row == self.activeList) {
            label.textColor = [UIColor whiteColor];
            label.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightBold];
        } else {
            label.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightBold];
            label.textColor = [UIColor colorWithWhite: 0.70 alpha:1];
        } */
        
        label.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightBold];
        label.textColor = [UIColor colorWithWhite: 0.70 alpha:1];
        
        [label sizeToFit];
        
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
    
    s = CGSizeMake(label.intrinsicContentSize.width, 30.0);
    
    NSLog(@"Width of cell: %f, height of cell: %f", s.width, s.height);
    return s;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // update the currently active list
    self.activeList = indexPath.row;
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    UILabel *label = (UILabel *)[cell viewWithTag:99];
    
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightBold];
    
    //TODO: update cell size to fit new font
    
    //TODO: switch view
    [self switchViews];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    UILabel *label = (UILabel *)[cell viewWithTag:99];
    
    label.textColor = [UIColor colorWithWhite: 0.70 alpha:1];
    label.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightBold];
}

- (void) switchViews {
    // Do nothing
}

- (IBAction)bulletsTapped:(id)sender {
    
    [self switchModeToBullets];
}

- (IBAction)numbersTapped:(id)sender {
    
    [self switchModeToNumbers];
}

- (IBAction)todosButton:(id)sender {
    // TODO: switch TextView to todos
    [self switchModeToTodos];
}

- (void) switchModeToBullets {
    self.bulletsButton.layer.borderWidth = 1.0f;
    self.bulletsButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.bulletsButton.layer.cornerRadius = 5.0f;
    self.bulletsButton.layer.backgroundColor = [UIColor blueColor].CGColor;
    self.bulletsButton.tintColor = [UIColor whiteColor];
    
    self.numbersButton.layer.borderWidth = 0.0f;
    self.numbersButton.layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.numbersButton.tintColor = [UIColor blackColor];
    
    self.todosButton.layer.borderWidth = 0.0f;
    self.todosButton.layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.todosButton.tintColor = [UIColor blackColor];
    
    mode = @"bullets";
}

- (void) switchModeToNumbers {
    self.numbersButton.layer.borderWidth = 1.0f;
    self.numbersButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.numbersButton.layer.cornerRadius = 5.0f;
    self.numbersButton.layer.backgroundColor = [UIColor blueColor].CGColor;
    self.numbersButton.tintColor = [UIColor whiteColor];
    
    self.bulletsButton.layer.borderWidth = 0.0f;
    self.bulletsButton.layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.bulletsButton.tintColor = [UIColor blackColor];
    
    self.todosButton.layer.borderWidth = 0.0f;
    self.todosButton.layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.todosButton.tintColor = [UIColor blackColor];
    
    mode = @"numbers";
}

- (void) switchModeToTodos {

}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    // TODO: modify condition to check for flags for bullet/numbers/todos
    
    if ([text isEqualToString:@"\n"]) {
        /* everything here only executes when there is an explicit new line character..
         but won't execute if there are no NEW newline characters.. so previous items
         stay the same. need some reference to line 0 of list.
         
         
         */
        if ([mode isEqualToString:@"bullets"]) {
            
            if (range.location == textView.text.length) {
                // Simply add the newline and bullet point to the end
                NSString *updatedText = [textView.text stringByAppendingString:@"\n\u2022 "];
                [textView setText:updatedText];
            }
            
            // Else if the replacement text is being added in the middle of
            // the text view's text...
            else {
                
                // Get the replacement range of the UITextView
                UITextPosition *beginning = textView.beginningOfDocument;
                UITextPosition *start = [textView positionFromPosition:beginning offset:range.location];
                UITextPosition *end = [textView positionFromPosition:start offset:range.length];
                UITextRange *textRange = [textView textRangeFromPosition:start toPosition:end];
                
                // Insert that newline character *and* a bullet point
                // at the point at which the user inputted just the
                // newline character
                [textView replaceRange:textRange withText:@"\n\u2022 "];
                
                // Update the cursor position accordingly
                NSRange cursor = NSMakeRange(range.location + @"\n\u2022 ".length, 0);
                textView.selectedRange = cursor;
                
            }
            // Then return "NO, don't change the characters in range" since
            // you've just done the work already
            return NO;
            
        } else if ([mode isEqualToString:@"numbers"]) {
            if (range.location == textView.text.length) {
                // Simply add the newline and bullet point to the end
                NSString *updatedText = [textView.text stringByAppendingString:[NSString stringWithFormat:@"\n%d ", counter++]];
                [textView setText:updatedText];
            }
            
            // Else if the replacement text is being added in the middle of
            // the text view's text...
            else {
                
                // Get the replacement range of the UITextView
                UITextPosition *beginning = textView.beginningOfDocument;
                UITextPosition *start = [textView positionFromPosition:beginning offset:range.location];
                UITextPosition *end = [textView positionFromPosition:start offset:range.length];
                UITextRange *textRange = [textView textRangeFromPosition:start toPosition:end];
                
                // Insert that newline character *and* a bullet point
                // at the point at which the user inputted just the
                // newline character
                [textView replaceRange:textRange withText:[NSString stringWithFormat:@"\n%d ", counter++]];
                
                NSString *str = [NSString stringWithFormat:@"\n%d ", counter];
                // Update the cursor position accordingly
                NSRange cursor = NSMakeRange(range.location + str.length, 0);
                textView.selectedRange = cursor;
                
            }
            // Then return "NO, don't change the characters in range" since
            // you've just done the work already
            return NO;
            
        } else {
            if (range.location == textView.text.length) {
                // Simply add the newline and bullet point to the end
                NSString *updatedText = [textView.text stringByAppendingString:@"\n\u2022 "];
                [textView setText:updatedText];
            }
            
            // Else if the replacement text is being added in the middle of
            // the text view's text...
            else {
                
                // Get the replacement range of the UITextView
                UITextPosition *beginning = textView.beginningOfDocument;
                UITextPosition *start = [textView positionFromPosition:beginning offset:range.location];
                UITextPosition *end = [textView positionFromPosition:start offset:range.length];
                UITextRange *textRange = [textView textRangeFromPosition:start toPosition:end];
                
                // Insert that newline character *and* a bullet point
                // at the point at which the user inputted just the
                // newline character
                [textView replaceRange:textRange withText:@"\n\u2022 "];
                
                // Update the cursor position accordingly
                NSRange cursor = NSMakeRange(range.location + @"\n\u2022 ".length, 0);
                textView.selectedRange = cursor;
                
            }
            // Then return "NO, don't change the characters in range" since
            // you've just done the work already
            return NO;
            
        }
        
    }
    
    // Else return yes
    return YES;
    
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
