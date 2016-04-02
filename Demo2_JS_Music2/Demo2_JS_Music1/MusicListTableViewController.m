//
//  MusicListTableViewController.m
//  Demo2_JS_Music1
//
//  Created by  江苏 on 16/3/13.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "MusicListTableViewController.h"
#import "ViewController.h"
@interface MusicListTableViewController ()
@end

@implementation MusicListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.musicFiles=[NSMutableArray array];
    NSString* path=@"/Users/jiangsu/Music/QQ音乐";
    NSFileManager* fm=[NSFileManager defaultManager];
    NSArray* fileNames=[fm contentsOfDirectoryAtPath:path error:nil];
    for (NSString* name in fileNames) {
        if ([name hasSuffix:@"mp3"]) {
            NSString* newPath=[path stringByAppendingPathComponent:name];
            [self.musicFiles addObject:newPath];
        }
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.musicFiles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text=[[self.musicFiles[indexPath.row] lastPathComponent]componentsSeparatedByString:@"."][0];
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

#pragma mark - Navigation
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* path=self.musicFiles[indexPath.row];
    NSNumber* number=[NSNumber numberWithInt:(int)indexPath.row];
    [self performSegueWithIdentifier:@"pvc" sender:@[path,number]];
}
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ViewController* vc=segue.destinationViewController;
    vc.mlTvc=self;
    vc.path=sender[0];
    vc.musicNumber=sender[1];
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
