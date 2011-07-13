//
//  ListViewController.m
//  IdeaBank_1
//
//  Created by Dina Jacobsen on 6/14/11.
//  Copyright 2011 Rensselaer Polytechnic Institute. All rights reserved.
//

#import "ListViewController.h"
#import "CoreData/CoreData.h"

@implementation ListViewController

@synthesize passthroughTableView = tableView;
@synthesize IBOutlet cell0;

#pragma mark -
#pragma mark Initialization


/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


#pragma mark -
#pragma mark View lifecycle

/*
- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
*/

- (void)viewWillAppear:(BOOL)animated {
	[[self tableView] setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
	[[self tableView] setSeparatorColor:[UIColor lightGrayColor]];
    [super viewWillAppear:animated];
}


/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.

	NSEntityDescription* entityDescription = [NSEntityDescription entityForName:@"Idea"
														 inManagedObjectContext:[self managedObjectContext]];
	NSFetchRequest* request = [[[NSFetchRequest alloc] init] autorelease];
	[request setEntity:entityDescription];
	
	NSPredicate* predicate = [NSPredicate predicateWithFormat:@"title != nil"];
	[request setPredicate:predicate];
	
	NSSortDescriptor* sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
	[request setSortDescriptors:[NSArray arrayWithObject: sortDescriptor]];
	[sortDescriptor release];
	
	NSArray* array = [[self managedObjectContext] executeFetchRequest:request error:nil];
	return [array count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[self tableView] dequeueReusableCellWithIdentifier:@"ideaCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ideaCell"];
    }
    
	if (indexPath.row == 0)	{
		return cell0;
	}
	
	
	
	// Core Data query 
	
	NSEntityDescription* entityDescription = [NSEntityDescription entityForName:@"Idea"
														 inManagedObjectContext:[self managedObjectContext]];
	NSFetchRequest* request = [[[NSFetchRequest alloc] init] autorelease];
	[request setEntity:entityDescription];
	
	NSPredicate* predicate = [NSPredicate predicateWithFormat:@"title != nil"];
	[request setPredicate:predicate];
	
	NSPredicate* predicateTextBody = [NSPredicate predicateWithFormat:@"textBody != nil"];
	[request setPredicate:predicate];
	
	NSSortDescriptor* sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
	[request setSortDescriptors:[NSArray arrayWithObject: sortDescriptor]];
	[sortDescriptor release];
	
	NSArray* array = [[self managedObjectContext] executeFetchRequest:request error:nil];
	
	NSArray* arrayTextBody = [[self managedObjectContext] executeFetchRequest:request error:nil];
	
	
    // Configure the cell...
    cell.textLabel.text = [[array objectAtIndex:indexPath.row] title];
	cell.detailTextLabel.text = [[arrayTextBody objectAtIndex:indexPath.row]textBody];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.

- (void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        NSInteger row = [indexPath row];
		[self removeObjectAtIndex:row];
		[self reloadData];
    }   	
}




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


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {

	[[self tableView] reloadData];
	NSLog(@"Tableview: %@", [self tableView]);
}

-(NSManagedObjectContext*)managedObjectContext
{
	return [[[UIApplication sharedApplication] delegate] managedObjectContext];
}

@end

