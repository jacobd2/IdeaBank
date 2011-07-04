//
//  NewIdeaTextViewController.m
//  IdeaBank_1
//
//  Created by Dina Jacobsen on 6/22/11.
//  Copyright 2011 Rensselaer Polytechnic Institute. All rights reserved.
//

#import "NewIdeaTextViewController.h"
#import "Idea.h"


@implementation NewIdeaTextViewController

@synthesize textTitle, textTags, textBody, labelLocation, labelDate;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	return self;
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	locationManager = [[CLLocationManager alloc] init];
	[locationManager setDelegate:self];
	[locationManager startUpdatingLocation];
}

-(void)viewDidLoad
{
	[super viewDidLoad];
	[labelDate setText:[[NSDate  date] descriptionWithCalendarFormat:@"%m/%d '%y %H:%M" timeZone:nil locale:nil]];

}

-(IBAction)savePushed: (id) sender
{
	Idea* newIdea = [NSEntityDescription 
					 insertNewObjectForEntityForName:@"Idea" 
					 inManagedObjectContext:[[[UIApplication sharedApplication] delegate] managedObjectContext]];

	[newIdea setDate:[NSDate date]];
	[newIdea setTitle:[textTitle text]];
	[newIdea setTextBody:[textBody text]];
	
	if(currentLocation)
	{
		NSString* latitudeLongitudeString = [NSString stringWithFormat:@"%f %f", 
											 [currentLocation coordinate].latitude, 
											 [currentLocation coordinate].longitude];
		[newIdea setLocation:latitudeLongitudeString];
	}
	
	NSArray* tagStrings = [[textTags text] componentsSeparatedByString:@", "];
	for(NSString* tagString in tagStrings)
	{
		Tag* newTag = [NSEntityDescription 
					  insertNewObjectForEntityForName:@"Tag" 
					  inManagedObjectContext:[[[UIApplication sharedApplication] delegate] managedObjectContext]];
		
		[newTag setCategory:tagString];
		[newIdea addBelongsToObject:newTag];
	}
	
	[[[[UIApplication sharedApplication] delegate] managedObjectContext] save:nil];
	
	// Clear the input
	
	[textTitle resignFirstResponder];
	[textBody resignFirstResponder];
	[textTags resignFirstResponder];
	
	[textTitle setText:@""];
	[textBody setText:@""];
	[textTags setText:@""];
	[locationManager startUpdatingLocation];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
	if([text isEqualToString:@"/n"])
	{
		[textView resignFirstResponder];
		return NO;
	}
	return YES;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
	if(currentLocation)
	{
		[currentLocation release];
	}
	currentLocation = [newLocation retain];
	[manager stopUpdatingLocation];
	MKReverseGeocoder *geocoder = [[MKReverseGeocoder alloc] initWithCoordinate:newLocation.coordinate];
	[geocoder setDelegate:self];
	[geocoder start];
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
{
	NSString* landmark = [placemark subLocality];
	NSString* city = [placemark locality];
	NSString* state = [placemark administrativeArea];
	
	if(landmark)
	{
		NSString* formattedString = [NSString stringWithFormat:@"%@, %@, %@", landmark, city, state];
		[labelLocation setText:formattedString];
	}
	else
	{
		NSString* formattedString = [NSString stringWithFormat:@"%@, %@", city, state];
		[labelLocation setText:formattedString];
	}

}

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
	[textTitle release];
	[textTags release];
	[textBody release];
	[labelLocation release];
	[labelDate release];
    [super dealloc];
}

@end
