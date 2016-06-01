//
//  EditListViewController.m
//  sharedspace
//
//  Created by Sid Jha on 2016-06-01.
//  Copyright © 2016 Mesh8. All rights reserved.
//

#import "EditListViewController.h"

@interface EditListViewController ()

@end

@implementation EditListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // TODO: sense for tapping of the buttons
    
    self.listTextView.delegate = self;
    
    
    self.listTextView.text = @"\u2022 ";
}
- (IBAction)bulletsTapped:(id)sender {
    // TODO: switch TextView to bullets

    [self switchModeToBullets];
}

- (IBAction)numbersTapped:(id)sender {
    // TODO: switch TextView to numbers
    
    [self switchModeToNumbers];
    
}

- (IBAction)todosButton:(id)sender {
    // TODO: switch TextView to todos
    
    [self switchModeToTodos];
    
}

- (void) switchModeToBullets {
    
}

- (void) switchModeToNumbers {
    
}

- (void) switchModeToTodos {
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if ([text isEqualToString:@"\n"]) {
        
        
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
