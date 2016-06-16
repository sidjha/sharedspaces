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

int counter;
NSString * mode;

@implementation EditListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // TODO: sense for tapping of the buttons
    
    self.listTextView.delegate = self;
    
    self.listTextView.text = @"\u2022 ";
    
    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleDone target:self action:@selector(closePage)];
    
    self.navigationItem.leftBarButtonItem = closeButton;
    
    self.bulletButton.layer.borderWidth = 1.0f;
    self.bulletButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.bulletButton.layer.cornerRadius = 5.0f;
    self.bulletButton.layer.backgroundColor = [UIColor blueColor].CGColor;
    self.bulletButton.tintColor = [UIColor whiteColor];
}

- (void) closePage {
    [self dismissViewControllerAnimated:YES completion:nil];
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
    self.bulletButton.layer.borderWidth = 1.0f;
    self.bulletButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.bulletButton.layer.cornerRadius = 5.0f;
    self.bulletButton.layer.backgroundColor = [UIColor blueColor].CGColor;
    self.bulletButton.tintColor = [UIColor whiteColor];
    
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
    
    self.bulletButton.layer.borderWidth = 0.0f;
    self.bulletButton.layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.bulletButton.tintColor = [UIColor blackColor];
    
    self.todosButton.layer.borderWidth = 0.0f;
    self.todosButton.layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.todosButton.tintColor = [UIColor blackColor];

    mode = @"numbers";
}

- (void) switchModeToTodos {
    self.todosButton.layer.borderWidth = 1.0f;
    self.todosButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.todosButton.layer.cornerRadius = 5.0f;
    self.todosButton.layer.backgroundColor = [UIColor blueColor].CGColor;
    self.todosButton.tintColor = [UIColor whiteColor];
    
    self.numbersButton.layer.borderWidth = 0.0f;
    self.numbersButton.layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.numbersButton.tintColor = [UIColor blackColor];
    
    self.bulletButton.layer.borderWidth = 0.0f;
    self.bulletButton.layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.bulletButton.tintColor = [UIColor blackColor];
    
    mode = @"todos";
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    // TODO: modify condition to check for flags for bullet/numbers/todos
    
    if ([text isEqualToString:@"\n"]) {
        
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
