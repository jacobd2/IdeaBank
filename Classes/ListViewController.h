//
//  ListViewController.h
//  IdeaBank_1
//
//  Created by Dina Jacobsen on 6/14/11.
//  Copyright 2011 Rensselaer Polytechnic Institute. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IdeaBank_1AppDelegate.h"

@interface ListViewController : UITableViewController <UITabBarControllerDelegate, UINavigationControllerDelegate, UITableViewDataSource,UITableViewDelegate> {
	IBOutlet UITableView *passthroughTableView;
	IBOutlet UITableViewCell *cell0;
	NSManagedObjectContext *managedObjectContext;
}

-(NSManagedObjectContext*)managedObjectContext;
- (IBAction)tagsButtonPressed:(id)sender;
- (IBAction)locationButtonPressed:(id)sender;
- (IBAction)dateButtonPressed:(id)sender;

@property (nonatomic, retain) IBOutlet UITableViewCell *cell0;
@property (nonatomic, retain) IBOutlet UITableView *passthroughTableView;



@end
