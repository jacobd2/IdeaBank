//
//  ListViewController.h
//  IdeaBank_1
//
//  Created by Dina Jacobsen on 6/14/11.
//  Copyright 2011 Rensselaer Polytechnic Institute. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IdeaBank_1AppDelegate.h"

@interface ListViewController : UITableViewController <UITabBarControllerDelegate> {
	IBOutlet UITableView *passthroughTableView;

}

-(NSManagedObjectContext*)managedObjectContext;

@property (nonatomic, retain) IBOutlet UITableView *passthroughTableView;

@end
