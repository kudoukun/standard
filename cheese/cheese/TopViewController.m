//
//  TopViewController.m
//  cheese
//
//  Created by 酒井 邦也 on 12/06/18.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import "TopViewController.h"
#import "SBJson.h"



@interface TopViewController ()

@end

@implementation TopViewController
@synthesize mainView;
@synthesize next;
@synthesize splitViewController = _splitViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    def = [NSUserDefaults standardUserDefaults];
    NSArray *item = [def objectForKey:@"PRODUCT"]; 
    
    if(item == nil){
        
        self.mainView.hidden = YES;
        
        
        image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"server_recive"]];
        [image setCenter:CGPointMake(512.0f, 374.0f)];
        [self.view addSubview:image];
        
        // インジケータの準備をする
        m_indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 200.0f)];
        [m_indicator setCenter:CGPointMake(512.0f, 374.0f)];
        m_indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [self.view addSubview: m_indicator];
        // インジケータを表示する
        [m_indicator startAnimating];
        
        [NSThread detachNewThreadSelector:@selector(connectThread)
                                 toTarget:self
                               withObject:nil];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setValue:[NSDate date] forKey:@"CURRENT_TIME"];
        [defaults synchronize];
        
        
    }else {
        
    }
    
}

- (void)connectThread{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://cheesecake.co.jp/api/?action=product_search&format=json"]cachePolicy:NSURLRequestUseProtocolCachePolicy
                                         timeoutInterval:60.0];
    
    
    NSError *error = nil;
    NSURLResponse *response = nil;
    NSData *jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if(error){
        NSLog(@"エラー発生");
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"ネットワークエラー"
                              message:@"サーバに接続できません"
                              delegate:self
                              cancelButtonTitle:@"閉じる"
                              otherButtonTitles:nil
                              ];
        [alert show];
        
    }else if(response){
        NSLog(@"接続成功");
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSDictionary *jsonDic = [parser objectWithData: jsonData];
        //NSLog(@"JSON dictionary=%@", [jsonDic description]);
        
        getJson =[[NSMutableArray alloc]init];
        
        //NSArray *arr = [jsonDic objectForKey:@"items"];
        NSLog(@"%d",[[[jsonDic objectForKey:@"response"] objectForKey:@"items"]count]);
        NSLog(@"%@",[[[[[jsonDic objectForKey:@"response"] objectForKey:@"items"]objectAtIndex:0]objectForKey:@"categories"]objectAtIndex:0]);
        
        
        for (int x=0; x< [[[jsonDic objectForKey:@"response"] objectForKey:@"items"]count]; x++) {
            ProductClass *pdt = [[ProductClass alloc]initWithDic:[[[jsonDic objectForKey:@"response"] objectForKey:@"items"]objectAtIndex:x]];
            for (int y=0; y<[[[[[jsonDic objectForKey:@"response"] objectForKey:@"items"]objectAtIndex:x]objectForKey:@"categories"]count];y++){
                [pdt setCT:[[[[[jsonDic objectForKey:@"response"] objectForKey:@"items"]objectAtIndex:x]objectForKey:@"categories"]objectAtIndex:y]];
                [getJson addObject:pdt];                        
            }
        }
        NSLog(@"%d",[getJson count]);
        ProductClass *pd = [getJson objectAtIndex:0];
        NSLog(@"%@",pd.name);
        
        for(int x = 0; x < [getJson count]; x++){
            
            pud = [[ProductUserDefaults alloc]initWithObj:[getJson objectAtIndex:x]];
            [pud userDefaults:pud];
            
        }
        [pud removeArray];
        
        [image removeFromSuperview];
        [m_indicator stopAnimating];
        [m_indicator removeFromSuperview];
        mainView.hidden = NO;
        [self dbOpen];
        
        [self dbBegin];
        
        //処理
        
        
        if(@"処理成功"){
            [self dbCommit];
        }else {
            [self dbRollback];
        }
        
        // DB切断
        [self dbClose];
    }
    
}

- (void)viewDidUnload
{
    [self setNext:nil];
    [self setMainView:nil];
    main_image = nil;
    sub_image1 = nil;
    sub_image2 = nil;
    update = nil;
    topImage = nil;
    product = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationLandscapeRight
            || interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    [detailViewController.product interraction:toInterfaceOrientation];
    
    
    if(toInterfaceOrientation == UIInterfaceOrientationPortrait ||
	   toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown){  
        // 縦
        [Entity getInstance].orientations = @"Portrait";
        
        
        
        [[MainDetailViewController alloc]Notifi:@"Portrait"];
        [UIView animateWithDuration:duration 
                              delay:0.0f 
                            options:UIViewAnimationCurveEaseIn 
                         animations:^(void) 
         {     		  
             self.splitViewController.splitPosition = 200.0;
             detailViewController.categoryTable.rowHeight = 150.0f;
             [detailViewController.categoryTable reloadData];
             [masterViewController.kategoryTaboe reloadData];
         } completion:^(BOOL finished) {
             
         }];
        
        
    } else {  
        // 横  
        
        [Entity getInstance].orientations = @"Landscape";
        [UIView animateWithDuration:duration 
                              delay:0.0f 
                            options:UIViewAnimationCurveEaseIn 
                         animations:^(void) 
         {     		  
             self.splitViewController.splitPosition = 320.0;
             detailViewController.categoryTable.rowHeight = 187.5f;
             [detailViewController.categoryTable reloadData];
             [masterViewController.kategoryTaboe reloadData];
         } completion:^(BOOL finished) {
             
         }];
        
        
        [[MainDetailViewController alloc]Notifi:@"Landscape"];
        [detailViewController.categoryTable reloadData];
        [UIView animateWithDuration:duration 
                              delay:0.0f 
                            options:UIViewAnimationCurveEaseIn 
                         animations:^(void) 
         {     		  self.mainView.frame = CGRectMake(0, 0, 1024, 1024); 
         } completion:^(BOOL finished) {
             
         }];
        
                
        
    } 
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"----didReceiveData----");
    
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"----connectionDidFinishLoading----");
}

-(void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error{ 
    NSLog(@"----Connection failed! Error - %@ %d %@----", 
          
          [error domain], 
          [error code], 
          [error localizedDescription]); 
    [m_indicator stopAnimating];
    [m_indicator removeFromSuperview];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"ネットワークエラー"
                          message:@"サーバに接続できません"
                          delegate:self
                          cancelButtonTitle:@"閉じる"
                          otherButtonTitles:nil
                          ];
    [alert show];
    [def setObject:nil forKey:@"PRODUCT"];
    [def synchronize];
    
    if([error code] ==  NSURLErrorNotConnectedToInternet){
        return; 
    } 
} 

// アラートのボタンが押された時に呼ばれるデリゲート例文
-(void)alertView:(UIAlertView*)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    
    
    switch (buttonIndex) {
        case 0:
            //１番目のボタンが押されたときの処理を記述する
            if([alertView.message isEqualToString:@"サーバに接続できません"]){
                exit(0);
            }else{
                
            }
            break;
        case 1:
            //２番目のボタンが押されたときの処理を記述する
            break;
    }
    
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"didReceiveResponse");
    
    //NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    //NSLog(@"%@", [httpResponse allHeaderFields] );
    
}

-(BOOL)checkNetwork:(NSString *)host {
    NSLog(@"---checkNetwork---");
    NSURLRequest *reqest = [NSURLRequest requestWithURL:[NSURL URLWithString:host]
                                            cachePolicy:NSURLRequestUseProtocolCachePolicy
                                        timeoutInterval:60.0];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:reqest delegate:self];
    if (connection) {
        NSLog(@"Success");
        return YES;
    } else {
        NSLog(@"Error");
        return NO;
    }
}

/*
 -(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)FromInterfaceOrientation {  
 
 if(FromInterfaceOrientation == UIInterfaceOrientationPortrait){  
 // 横向き
 self.mainView.frame = CGRectMake(0, 0, 1024, 748);   
 } else {  
 // 縦向き  
 self.mainView.frame = CGRectMake(0, 0, 768, 1004);   
 
 
 }  
 
 }  
 */


- (IBAction)next:(id)sender {
    
    if(self.splitViewController == nil){
        
        if([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown ||[UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait){
            [Entity getInstance].orientations = @"Portrait";
            self.splitViewController.splitPosition = 200.0;
            detailViewController.categoryTable.rowHeight = 150.0f; 
            [detailViewController.categoryTable reloadData];
        }else{
            [Entity getInstance].orientations = @"Landscape"; 
            self.splitViewController.splitPosition = 320.0;
            detailViewController.categoryTable.rowHeight = 187.5f; 
            [detailViewController.categoryTable reloadData];
        }
        
        masterViewController = [[MainMasterViewController alloc] initWithNibName:@"MainMasterViewController" bundle:nil];
        
        UIBarButtonItem* leftItem = 
        [[UIBarButtonItem alloc] initWithTitle:@"TOPへ" 
                                         style:UIBarButtonItemStylePlain
                                        target:self 
                                        action:@selector(clickDone)];
        masterViewController.navigationItem.leftBarButtonItem = leftItem;
        
        UINavigationController *masterNavigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
        
        detailViewController = [[MainDetailViewController alloc] initWithNibName:@"MainDetailViewController" bundle:nil];
        
        if([[Entity getInstance].orientations isEqualToString:@"Portrait"]){
            detailViewController.categoryTable.rowHeight = 150.0f;
        }else {
            detailViewController.categoryTable.rowHeight = 187.5f;
        }
        
        
        UINavigationController *detailNavigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
        
        masterViewController.detailViewController = detailViewController;
        
        self.splitViewController = [[MGSplitViewController alloc]initWithNibName:@"MGSplitViewController" bundle:nil];
        self.splitViewController.delegate = self.splitViewController;
        detailViewController.splitViewController = self.splitViewController;
        
        
        
        
        
        self.splitViewController.viewControllers = [NSArray arrayWithObjects:masterNavigationController, detailNavigationController, nil];
        self.splitViewController.view.frame = self.mainView.bounds;
    }
    [self.mainView addSubview:self.splitViewController.view];
    
    [UIView animateWithDuration:1.5f 
						  delay:0.0f 
						options:UIViewAnimationCurveEaseIn 
					 animations:^(void) 
	 {     		 
         [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp
                                forView:self.mainView
                                  cache:YES];
	 } completion:^(BOOL finished) {
		 [self.navigationController pushViewController:self.splitViewController animated:YES];
	 }];
    
    
}
- (void)clickDone{
    [self.mainView bringSubviewToFront:topImage];
    [self.mainView bringSubviewToFront:update];
    [self.mainView bringSubviewToFront:product];
    [UIView animateWithDuration:1.5f 
						  delay:0.0f 
						options:UIViewAnimationCurveEaseIn 
					 animations:^(void) 
	 {     		 
         [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown
                                forView:self.mainView
                                  cache:YES];
	 } completion:^(BOOL finished) {
		 [self.navigationController pushViewController:self.navigationController animated:YES];
	 }];
    
    
}

- (void)sqliteCreate{
    
    database_filename = @"cheese_cake.sqlite";
    work_path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES) objectAtIndex:0];
    database_path = [NSString stringWithFormat:@"%@/%@",work_path,database_path];
    
    NSFileManager *manager = [NSFileManager defaultManager ];
    
    if(![manager fileExistsAtPath:database_path]){
        NSError *error = nil;
        
        template_path = [[[NSBundle mainBundle]resourcePath ]stringByAppendingPathComponent:database_filename];
        
        if (![manager copyItemAtPath:template_path toPath:database_path error:&error])
            
        {
            
            // データベースファイルのコピーに失敗した場合の処理
            
        }
        
        // 文書フォルダーに用意されたデータベースファイルを開く
        
        if (sqlite3_open([database_path UTF8String], &db_) == SQLITE_OK)
            
        {
            
            // データベースファイルを SQLite で開くことに成功しました。
            [self insertInto];
            
        }
        
    }    
}

-(void)dbOpen {
	NSLog(@"DB Open");
       
	// データベース名
	database_filename = @"twitterDB.sqlite";
    
	// データベースファイルを格納するために文書フォルダーを取得します。
	work_path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
	// データベースファイルのパスを取得します。
	database_path = [NSString stringWithFormat:@"%@/%@", work_path, database_filename];
    
	// 文書フォルダーにデータベースファイルが存在しているかを確認します。
	NSFileManager* manager = [NSFileManager defaultManager];
    
	if (![manager fileExistsAtPath:database_path])
	{
		NSError* error = nil;
        
		// 文書フォルダーに存在しない場合は、データベースの複製元をバンドルから取得します。
		template_path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:database_filename];
        
		// バンドルから取得したデータベースファイルを文書フォルダーにコピーします。
		if (![manager copyItemAtPath:template_path toPath:database_path error:&error])
		{
			// データベースファイルのコピーに失敗した場合の処理です。
			// 保留
		}
	}
    
	// 文書フォルダーに用意されたデータベースファイルを開きます。
	if (sqlite3_open([database_path UTF8String], &db_) != SQLITE_OK)
	{
		// データベースファイルを SQLite で開くことに失敗しました。
		// 保留
	}
}

-(void)dbClose {
	NSLog(@"DB Close");
    
	if (db_) {
		// DB Close
		sqlite3_close(db_);
	}
	db_ = nil;
}

-(void)dbBegin {
	sqlite3_exec(db_, "BEGIN", NULL, NULL, NULL );
}

-(void)dbCommit {
	sqlite3_exec(db_, "COMMIT", NULL, NULL, NULL );
}

-(void)dbRollback {
	sqlite3_exec(db_, "ROLLBACK", NULL, NULL, NULL );
}

- (void)insertInto{
    
    char *sql = "insert into dtb_products(product_id,price02_min,stock,time_limit,material,allergy,name,main_comment,main_image,sub_image1,sub_image2,category,main_list_comment,create,update,mainIMG,subIMG1,subIMG2)values   (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    
    
}

- (void)indication{
    
    m_indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 200.0f)];
    [m_indicator setCenter:CGPointMake(759.0f, 20.0f)];
    m_indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    // インジケータを表示する
    [self.mainView addSubview: m_indicator];
    [m_indicator startAnimating];
}


- (IBAction)update:(id)sender {
    
    [NSThread detachNewThreadSelector:@selector(indication)
                             toTarget:self
                           withObject:nil];
    
    
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    NSDate *strings = [defs objectForKey:@"CURRENT_TIME"]; 
    /*
     ProductUserDefaults *item1 = [NSKeyedUnarchiver unarchiveObjectWithData:[[[item objectAtIndex:0]objectForKey:@"ITEM"]objectAtIndex:0]];
     */
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://cheesecake.co.jp/api/?action=product_search&format=json"]cachePolicy:NSURLRequestUseProtocolCachePolicy
                                         timeoutInterval:10.0];
    
    
    NSError *error = nil;
    NSURLResponse *response = nil;
    NSData *jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if(error){
        NSLog(@"エラー発生");
        UIAlertView *alert1 = [[UIAlertView alloc]
                              initWithTitle:@""
                              message:@"通信エラー"
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil
                              ];

        [alert1 show];
        
        [m_indicator stopAnimating];
        [m_indicator removeFromSuperview];
        
    }else if(response){
        NSLog(@"接続成功");
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSDictionary *jsonDic = [parser objectWithData: jsonData];
        //NSLog(@"JSON dictionary=%@", [jsonDic description]);
        
        getJson =[[NSMutableArray alloc]init];
        
        NSMutableArray *update = [[NSMutableArray alloc]init];
        int i=0;
        
        for (int x=0; x< [[[jsonDic objectForKey:@"response"] objectForKey:@"items"]count]; x++) {
            ProductClass *pdt = [[ProductClass alloc]initWithDic:[[[jsonDic objectForKey:@"response"] objectForKey:@"items"]objectAtIndex:x]];
            
            NSLog(@"%@",strings);
            NSLog(@"%@",pdt.update);
            
            
            NSComparisonResult res = [strings compare:pdt.update];
            switch (res) {
                case NSOrderedAscending:
                    NSLog(@"tes1");
                    i++;
                    
                    break;
                case NSOrderedSame:
                    NSLog(@"test2");
                    break;
                case NSOrderedDescending:
                    
                    
                    NSLog(@"test3");
                    break;
                default:
                    break;
            }  
        }
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@""
                              message:[NSString stringWithFormat:@"更新データは%d件です",i]
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil
                              ];
        [alert show];
        [m_indicator stopAnimating];
        [m_indicator removeFromSuperview];
        /*
         NSLog(@"%d",[getJson count]);
         ProductClass *pd = [getJson objectAtIndex:0];
         NSLog(@"%@",pd.name);
         
         for(int x = 0; x < [getJson count]; x++){
         
         pud = [[ProductUserDefaults alloc]initWithObj:[getJson objectAtIndex:x]];
         [pud userDefaults:pud];
         
         }
         [pud removeArray];
         */
    }
    
    
    
    
    
    
}
@end
