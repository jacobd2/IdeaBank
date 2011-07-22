//
//  IdeaTextDetailViewController.m
//  IdeaBank_1
//
//  Created by Dina Jacobsen on 7/13/11.
//  Copyright 2011 Rensselaer Polytechnic Institute. All rights reserved.
//

#import "IdeaTextDetailViewController.h"



@implementation IdeaTextDetailViewController



// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationController.navigationBar.barStyle = UIBarStyleBlack;  
    self.navigationController.navigationBar.translucent = YES;
	
	UIBarButtonItem *backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"back to idea list" style:UIBarButtonItemStylePlain target:nil action:nil] autorelease];
	self.navigationItem.leftBarButtonItem = backBarButtonItem;
	
	//[backBarButtonItem addTarget:nil action:nil 
	 //forControlEvents:UIControlEventTouchUpInside];
	
//	[backButton release];
}

//- (void)setBackBarButtonItem:(UIBarButtonItem *)backBarButtonItem animated:(BOOL)animated{
//}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
