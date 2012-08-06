//
//  MainMasterViewController.m
//  cheese
//
//  Created by 酒井 邦也 on 12/06/15.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import "MainMasterViewController.h"

#import "MainDetailViewController.h"
#import "MainTableViewCell.h"

#define TABLE_LANDSCAPE_WIDTH    320
#define TABLE_PORTRAIT_WIDTH     200

@interface MainMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MainMasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize kategoryTaboe = _kategoryTaboe;
@synthesize data = _data;
@synthesize leftItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"カテゴリ", @"カテゴリ");
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 400.0);
        
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path = [bundle pathForResource:@"data_list" ofType:@"plist"];
        NSDictionary *questions = [NSDictionary dictionaryWithContentsOfFile:path];
        _data = [questions objectForKey:@"category"];
        
        UIBarButtonItem* leftItem = 
        [[UIBarButtonItem alloc] initWithTitle:@"TOPへ" 
                                         style:UIBarButtonItemStylePlain
                                        target:self 
                                        action:@selector(clickDone)];
        self.navigationItem.leftBarButtonItem = leftItem;
        
        self.data = _data;
        
    }
    return self;
}

- (void)clickDone{
    
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;
    def = [NSUserDefaults standardUserDefaults];
    item = [def objectForKey:@"PRODUCT"]; 
    _kategoryTable.frame = CGRectMake(0, 0, 200, _kategoryTable.frame.size.height);
    
}

- (void)viewDidUnload
{
    _kategoryTable = nil;
    [self setKategoryTaboe:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }/*
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
      */
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [item count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier0 = @"MainTableViewCell";
    // NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    MainTableViewCell *cell = (MainTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier0];
    if(cell == nil){
        UIViewController* viewController = [[UIViewController alloc] initWithNibName:CellIdentifier0 bundle:nil];
        
        cell = (MainTableViewCell*)viewController.view;
        
    }
    
    if ([[Entity getInstance].orientations isEqualToString:@"Portrait"]) {
        _kategoryTable.frame = CGRectMake(0, 0, TABLE_PORTRAIT_WIDTH, 962);
        
        
//        cell.label1.font = [UIFont systemFontOfSize:24];
//        cell.label1.frame = CGRectMake(10, 39, 180, 116);
        cell.images.center = CGPointMake(TABLE_PORTRAIT_WIDTH/2, 97.5);
        cell.images.bounds = CGRectMake(0, 0, 200, 130);
        
    } else {
        NSLog(@"%f",_kategoryTable.frame.size.height);
        _kategoryTable.frame = CGRectMake(0, 0, TABLE_LANDSCAPE_WIDTH, 703);
        
//        cell.label1.font = [UIFont systemFontOfSize:30];
//        cell.label1.frame = CGRectMake(44, 39, 232, 116);
        cell.images.center = CGPointMake(TABLE_LANDSCAPE_WIDTH/2, 97.5);
        cell.images.bounds = CGRectMake(0, 0, 320, 195);
        
        
    }

    
    
    //cell.label1.text = [[item objectAtIndex:indexPath.section]objectForKey:@"TITLE"];
    cell.images.image = [UIImage imageNamed:[[item objectAtIndex:indexPath.section]objectForKey:@"TITLE"]];
    
    return cell;
}




- (void) _deselectTableRow:(UITableView *)tableView {
    [_kategoryTable deselectRowAtIndexPath:[_kategoryTable indexPathForSelectedRow] animated:YES];
}
/*
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
 */
/*
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
*/
/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[_kategoryTable reloadData];
    [self performSelector:@selector(_deselectTableRow:) withObject:tableView afterDelay:0.1f];
    
    [self.detailViewController.navigationController popToRootViewControllerAnimated:YES];
    NSLog(@"%d",self.detailViewController.section);
    //NSDate *object = [_objects objectAtIndex:indexPath.row];
    self.detailViewController.arr = _data;
    [self.detailViewController.categoryTable reloadData];
    self.detailViewController.section = indexPath.section;
    if([[Entity getInstance].orientations isEqualToString:@"Portrait"]){
        self.detailViewController.categoryTable.rowHeight = 150.0f;
        [self.detailViewController.categoryTable reloadData];
    }else{
        self.detailViewController.categoryTable.rowHeight = 187.5f;
        [self.detailViewController.categoryTable reloadData];
    }
   
}

@end
