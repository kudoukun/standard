//
//  SplitOverRideViewController.m
//  cheese
//
//  Created by 酒井 邦也 on 12/06/15.
//  Copyright (c) 2012年 株式会社ambloom. All rights reserved.
//

#import "SplitOverRideViewController.h"

@interface SplitOverRideViewController ()

@end

@implementation SplitOverRideViewController

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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}
/*
- (void)willAnimateFirstHalfOfRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
	UIViewController* master = [self.viewControllers objectAtIndex:0];
	UIViewController* detail = [self.viewControllers objectAtIndex:1];
    
	CGRect masterFrame = master.view.frame;
	CGRect detailFrame = detail.view.frame;
    
	if(toInterfaceOrientation == UIInterfaceOrientationPortrait ||
	   toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        
		// 縦
		masterFrame.size.width = 320;
		masterFrame.size.height = 1024;
		masterFrame.origin.x = 0;
		masterFrame.origin.y = 0;
        
		detailFrame.size.width = 448;
		detailFrame.size.height = 1024;
		detailFrame.origin.x = 321;
		detailFrame.origin.y = 0;
        
		[master.view setFrame:masterFrame];
		[detail.view setFrame:detailFrame];
        
	}
	else {
		// 横
        
		masterFrame.size.width = 320;
		masterFrame.size.height = 768;
		masterFrame.origin.x = 0;
		masterFrame.origin.y = 0;
        
		detailFrame.size.width = 704;
		detailFrame.size.height = 768;
		detailFrame.origin.x = 321;
		detailFrame.origin.y = 0;
        
		[master.view setFrame:masterFrame];
		[detail.view setFrame:detailFrame];
        
		
	}
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
}
 */
/*
- (void)didAnimateFirstHalfOfRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    
    UIViewController* master = [self.viewControllers objectAtIndex:0];
	UIViewController* detail = [self.viewControllers objectAtIndex:1];
    
	CGRect masterFrame = master.view.frame;
	CGRect detailFrame = detail.view.frame;
    
	if(toInterfaceOrientation == UIInterfaceOrientationPortrait ||
	   toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        
		// 縦
		masterFrame.size.width = 320;
		masterFrame.size.height = 1024;
		masterFrame.origin.x = 0;
		masterFrame.origin.y = 0;
        
		detailFrame.size.width = 448;
		detailFrame.size.height = 1024;
		detailFrame.origin.x = 321;
		detailFrame.origin.y = 0;
        
		[master.view setFrame:masterFrame];
		[detail.view setFrame:detailFrame];
        
	}
	else {
		// 横
        
		masterFrame.size.width = 320;
		masterFrame.size.height = 768;
		masterFrame.origin.x = 0;
		masterFrame.origin.y = 0;
        
		detailFrame.size.width = 704;
		detailFrame.size.height = 768;
		detailFrame.origin.x = 321;
		detailFrame.origin.y = 0;
        
		[master.view setFrame:masterFrame];
		[detail.view setFrame:detailFrame];
        
		
	}    
}

- (void)willAnimateSecondHalfOfRotationFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation duration:(NSTimeInterval)duration{
    
    UIViewController* master = [self.viewControllers objectAtIndex:0];
	UIViewController* detail = [self.viewControllers objectAtIndex:1];
    
	CGRect masterFrame = master.view.frame;
	CGRect detailFrame = detail.view.frame;
    
	if(fromInterfaceOrientation == UIInterfaceOrientationPortrait ||
	   fromInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        
		// 縦
		masterFrame.size.width = 320;
		masterFrame.size.height = 1024;
		masterFrame.origin.x = 0;
		masterFrame.origin.y = 0;
        
		detailFrame.size.width = 448;
		detailFrame.size.height = 1024;
		detailFrame.origin.x = 321;
		detailFrame.origin.y = 0;
        
		[master.view setFrame:masterFrame];
		[detail.view setFrame:detailFrame];
        
	}
	else {
		// 横
        
		masterFrame.size.width = 320;
		masterFrame.size.height = 768;
		masterFrame.origin.x = 0;
		masterFrame.origin.y = 0;
        
		detailFrame.size.width = 704;
		detailFrame.size.height = 768;
		detailFrame.origin.x = 321;
		detailFrame.origin.y = 0;
        
		[master.view setFrame:masterFrame];
		[detail.view setFrame:detailFrame];
        
		[super willAnimateRotationToInterfaceOrientation:fromInterfaceOrientation duration:duration];
	}
}*/
/*
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    
    UIViewController* master = [self.viewControllers objectAtIndex:0];
	UIViewController* detail = [self.viewControllers objectAtIndex:1];
    
	CGRect masterFrame = master.view.frame;
	CGRect detailFrame = detail.view.frame;
    
	if(toInterfaceOrientation == UIInterfaceOrientationPortrait ||
	   toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        
		// 縦
		masterFrame.size.width = 320;
		masterFrame.size.height = 1024;
		masterFrame.origin.x = 0;
		masterFrame.origin.y = 0;
        
		detailFrame.size.width = 448;
		detailFrame.size.height = 1024;
		detailFrame.origin.x = 321;
		detailFrame.origin.y = 0;
        
		[master.view setFrame:masterFrame];
		[detail.view setFrame:detailFrame];
        
	}
	else {
		// 横
        
		masterFrame.size.width = 320;
		masterFrame.size.height = 768;
		masterFrame.origin.x = 0;
		masterFrame.origin.y = 0;
        
		detailFrame.size.width = 704;
		detailFrame.size.height = 768;
		detailFrame.origin.x = 321;
		detailFrame.origin.y = 0;
        
		[master.view setFrame:masterFrame];
		[detail.view setFrame:detailFrame];
        
		
	}  
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    
    
    UIViewController* master = [self.viewControllers objectAtIndex:0];
	UIViewController* detail = [self.viewControllers objectAtIndex:1];
    
	CGRect masterFrame = master.view.frame;
	CGRect detailFrame = detail.view.frame;
    
	if(fromInterfaceOrientation == UIInterfaceOrientationPortrait ||
	   fromInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        
		// 縦
		masterFrame.size.width = 320;
		masterFrame.size.height = 1024;
		masterFrame.origin.x = 0;
		masterFrame.origin.y = 0;
        
		detailFrame.size.width = 448;
		detailFrame.size.height = 1024;
		detailFrame.origin.x = 321;
		detailFrame.origin.y = 0;
        
		[master.view setFrame:masterFrame];
		[detail.view setFrame:detailFrame];
        
	}
	else {
		// 横
        
		masterFrame.size.width = 320;
		masterFrame.size.height = 768;
		masterFrame.origin.x = 0;
		masterFrame.origin.y = 0;
        
		detailFrame.size.width = 704;
		detailFrame.size.height = 768;
		detailFrame.origin.x = 321;
		detailFrame.origin.y = 0;
        
		[master.view setFrame:masterFrame];
		[detail.view setFrame:detailFrame];
        
    }      
}
/*
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    
    UIViewController* master = [self.viewControllers objectAtIndex:0];
	UIViewController* detail = [self.viewControllers objectAtIndex:1];
    
	CGRect masterFrame = master.view.frame;
	CGRect detailFrame = detail.view.frame;
    
	if(toInterfaceOrientation == UIInterfaceOrientationPortrait ||
	   toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        
		// 縦
		masterFrame.size.width = 320;
		masterFrame.size.height = 1024;
		masterFrame.origin.x = 0;
		masterFrame.origin.y = 0;
        
		detailFrame.size.width = 448;
		detailFrame.size.height = 1024;
		detailFrame.origin.x = 321;
		detailFrame.origin.y = 0;
        
		[master.view setFrame:masterFrame];
		[detail.view setFrame:detailFrame];
        
	}
	else {
		// 横
        
		masterFrame.size.width = 320;
		masterFrame.size.height = 768;
		masterFrame.origin.x = 0;
		masterFrame.origin.y = 0;
        
		detailFrame.size.width = 704;
		detailFrame.size.height = 768;
		detailFrame.origin.x = 321;
		detailFrame.origin.y = 0;
        
		[master.view setFrame:masterFrame];
		[detail.view setFrame:detailFrame];
        
    }      

    
    
    
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
}
 */
@end
