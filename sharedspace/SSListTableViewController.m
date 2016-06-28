//
//  SSListTableViewController.m
//  sharedspace
//
//  Created by Sid Jha on 2016-06-25.
//  Copyright © 2016 Mesh8. All rights reserved.
//

#import "SSListTableViewController.h"

@implementation SSListTableViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.sharedspaces = [NSArray arrayWithObjects:
                         @[@"You", @"Sid"],
                         @[@"You", @"Mark", @"Ravi"],
                         @[@"You", @"Radhika", @"Sid"], nil];
    
    // For replacing the row outlines of empty rows with blank space
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SSListCell" forIndexPath:indexPath];
    
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:2];
    imageView.image = [UIImage imageNamed:@"ss_avatar"];
    imageView.layer.borderWidth = 1.0f;
    imageView.layer.borderColor = [UIColor blackColor].CGColor;
    imageView.layer.cornerRadius = 30;
    imageView.layer.masksToBounds = YES;
    
    imageView.clipsToBounds = YES;
    
    
    // TODO: override label with one that can have padding.. https://gist.github.com/marcoarment/2596057
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    label.layer.borderWidth = 1.0f;
    label.layer.borderColor = [UIColor blackColor].CGColor;
    
    label.layer.cornerRadius = 5;
    
    
    // shuffle through sharedspace array and make strings out of each item,
    // like @[@"Tom", @"Dick", @"Harry"] --> "Sharedspace with Tom, Dick and Harry]
    
    label.text = @"Sharedspace with You, Mark and Ravi";
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
