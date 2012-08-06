//
//  MainDetailViewController.m
//  cheese
//
//  Created by 酒井 邦也 on 12/06/15.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import "MainDetailViewController.h"

#define TABLE_LANDSCAPE_WIDTH		195
#define TABLE_PORTRAIT_WIDTH        563
#define TABLE_LANDSCAPE_HEIGHT      200
#define TABLE_PORTRAIT_HEIGHT       200

@interface MainDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation MainDetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize categoryTable = _categoryTable;
@synthesize masterPopoverController = _masterPopoverController;
@synthesize section = _section;
@synthesize arr = _arr;
@synthesize splitViewController = _splitViewController;
@synthesize orientation = _orientation;
@synthesize orientations = _orientations;
@synthesize product = _product;

#pragma mark - Managing the detail item

- (void)setSection:(NSInteger)section{
    
    NSLog(@"%d",section);
    _section = section;
    
    if(section  == -1){
        _categoryTable.hidden =YES;
    }else{    
        def = [NSUserDefaults standardUserDefaults];
        item = [def objectForKey:@"PRODUCT"]; 
        self.title = [[item objectAtIndex:section]objectForKey:@"TITLE"];
        
        if(![Entity getInstance].detailFlag){
         _categoryTable.hidden =NO;
        [UIView animateWithDuration:1.5f 
                              delay:0.0f 
                            options:UIViewAnimationCurveEaseIn 
                         animations:^(void) 
         {     		 
             
             
             [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp
                                    forView:detail_top
                                      cache:YES];
             detail_top.hidden = YES;
         } completion:^(BOOL finished) {
             [Entity getInstance].detailFlag = YES;
            
         }];
        
        }else {
        
        //[self.categoryTable reloadData];
        [UIView animateWithDuration:1.5f 
                              delay:0.0f 
                            options:UIViewAnimationCurveEaseIn 
                         animations:^(void) 
         {     		 
             
             [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp
                                    forView:self.categoryTable
                                      cache:YES];
         } completion:^(BOOL finished) {
             
         }];
                
        }
        
    }    
    
}

- (void)setArr:(NSArray *)arr{
    
    _arr = arr;
    //[self.categoryTable reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _categoryTable.delegate = self;
    _categoryTable.dataSource = self;
    _categoryTable.hidden =YES;
    [self.categoryTable reloadData];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [self.categoryTable reloadData];
    /*
     [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
     [[NSNotificationCenter defaultCenter] addObserver:self
     selector:@selector(didRotate:)
     name:UIDeviceOrientationDidChangeNotification
     object:nil];
     */
    def = [NSUserDefaults standardUserDefaults];
    item = [def objectForKey:@"PRODUCT"];
}

- (void)viewDidUnload
{
    _categoryTable = nil;
    [self setCategoryTable:nil];
    detail_top = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.detailDescriptionLabel = nil;
}

- (float)splitViewController:(MGSplitViewController *)svc constrainSplitPosition:(float)proposedPosition splitViewSize:(CGSize)viewSize
{
	//NSLog(@"%@", NSStringFromSelector(_cmd));
	return proposedPosition;
}

- (BOOL)splitViewController: (UISplitViewController*)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation  __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_5_0){
    
    return YES;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"商品紹介", @"商品紹介");
        if([[Entity getInstance].orientations isEqualToString:@"Portrait"]){
            _categoryTable.rowHeight = 150.0f;
        }else{
            _categoryTable.rowHeight = 187.5f;
        }
    }
    return self;
}

#pragma mark - Table view data source
//セクションの数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [[[item objectAtIndex:self.section] objectForKey:@"ITEM"]count];
}

//各セクションのセルの数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    
    return 1;
    
}
//各セクションのタイトル
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    //NSLog(@"%@",[key_ objectAtIndex:section]);
    
    return @"";
}

//各セルの内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier0 = @"TableViewCellCustomCell";
    // NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    cell = (TableViewCellCustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier0];
    if(cell == nil){
        UIViewController* viewController = [[UIViewController alloc] initWithNibName:CellIdentifier0 bundle:nil];
        
        cell = (TableViewCellCustomCell*)viewController.view;
        
    }
    
    //   dataSource = [[NSMutableDictionary alloc]initWithObjects:all forKeys:key_];
    // Configure the cell...
    /*
     DefaultUserHelper *infos  = [NSKeyedUnarchiver unarchiveObjectWithData:[[_array objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
     
     NSLog(@"%@ %d",infos.section_title,indexPath.section);
     
     NSDateFormatter *df = [[NSDateFormatter alloc] init];
     df.dateFormat  = @"yyyy/MM/dd HH:mm:ss";
     
     cell.detailTextLabel.textAlignment = UITextAlignmentRight;
     cell.textLabel.textAlignment = UITextAlignmentRight;
     cell.textLabel.textColor = [UIColor blackColor];
     cell.detailTextLabel.textColor = [UIColor grayColor];
     cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@",infos.detail_text , [df stringFromDate:infos.date]];
     cell.textLabel.text =  infos.text;
     cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
     cell.selectionStyle = UITableViewCellSelectionStyleGray;
     */
    
    NSLog(@"%@",[Entity getInstance].orientations);
    NSLog(@"%f",_categoryTable.rowHeight);
    
    if(indexPath.section%2){
        cell.cell_back.image = [UIImage imageNamed:@"detail_cell_back"];
    }else{
        cell.cell_back.image = [UIImage imageNamed:@"detail_cell_back1"];
    }
    
    /*
    if ([[Entity getInstance].orientations isEqualToString:@"Portrait"]) {
        
        _categoryTable.frame = CGRectMake(0, 0, 563, _categoryTable.frame.size.height);
        cell.bounds = CGRectMake(0, 0, TABLE_PORTRAIT_WIDTH, 150);
        
        cell.label1.font = [UIFont systemFontOfSize:24];
        cell.label1.frame = CGRectMake(215, 5, 333, 32);
        cell.label2.frame = CGRectMake(215, 43, 333, 35);
        cell.label3.frame = CGRectMake(215,90, 333, 48);
        cell.imageView.center = CGPointMake(100, 75);
        cell.imageView.bounds = CGRectMake(0, 0, 200, 150);
        
    } else {
        _categoryTable.frame = CGRectMake(0, 0, 699, _categoryTable.frame.size.height);
        
        cell.bounds = CGRectMake(0, 0, TABLE_LANDSCAPE_WIDTH, 187.5);
        
        cell.label1.font = [UIFont systemFontOfSize:30];
        cell.label1.frame = CGRectMake(257, 5, 427, 52);
        cell.label2.frame = CGRectMake(257, 50, 427, 55);
        cell.label3.frame = CGRectMake(257,100, 422, 80);
        cell.imageView.center = CGPointMake(125, 93.75);
        cell.imageView.bounds = CGRectMake(0, 0, 250, 187.5);
        
        
    }
    */
    
    
    ProductUserDefaults *item1 = [NSKeyedUnarchiver unarchiveObjectWithData:[[[item objectAtIndex:self.section]objectForKey:@"ITEM"]objectAtIndex:indexPath.section]];
    
    
    cell.imageView.image = [[UIImage alloc] initWithData:item1.mainIMG];
    
    NSLog(@"%d",self.section);
    
    cell.label1.text = item1.name;
    cell.label2.text = [NSString stringWithFormat:@"価格 %@円",item1.price02_min];
    cell.label3.text = item1.main_list_comment;
    //[cell.webview loadHTMLString:item1.main_comment baseURL:nil];
    return cell;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    NSLog(@"tes");
    
    
}

- (void)Notifi:(NSString *)orien{
    
    [Entity getInstance].orientations = orien;
    
    [self.categoryTable reloadData];
}

- (void)cellChage:(UIInterfaceOrientation)toInterfaceOrientation{
    
    
    
    
}


-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)FromInterfaceOrientation {  
    [self.categoryTable reloadData];
    if(FromInterfaceOrientation == UIInterfaceOrientationPortrait || FromInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown){  
        // 横向き
        _categoryTable.rowHeight = 200.0; 
        cell.label1.font = [UIFont systemFontOfSize:20];
    } else {  
        // 縦向き
        _categoryTable.rowHeight = 250.0;
    }  
}  
/*
 
 - (void) didRotate:(NSNotification *)notification {
 orientation = [[notification object] orientation];
 [self.categoryTable reloadData];
 
 }
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ProductUserDefaults *item1 = [NSKeyedUnarchiver unarchiveObjectWithData:[[[item objectAtIndex:self.section]objectForKey:@"ITEM"]objectAtIndex:indexPath.section]];
    
    ProductDetailViewController *product = [[ProductDetailViewController alloc]initWithNibName:@"ProductDetailViewController" bundle:nil item:item1];
    
    
    [self.navigationController pushViewController:product animated:YES];
    
    
}



#pragma mark - Split view
/*
 - (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
 {
 barButtonItem.title = NSLocalizedString(@"カテゴリ", @"カテゴリ");
 [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
 self.masterPopoverController = popoverController;
 }
 
 - (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
 {
 // Called when the view is shown again in the split view, invalidating the button and popover controller.
 [self.navigationItem setLeftBarButtonItem:nil animated:YES];
 self.masterPopoverController = nil;
 }
 */
@end
