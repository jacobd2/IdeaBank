//
//  NewIdeaTextViewController.h
//  IdeaBank_1
//
//  Created by Dina Jacobsen on 6/22/11.
//  Copyright 2011 Rensselaer Polytechnic Institute. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface NewIdeaTextViewController : UIViewController <UITextFieldDelegate,
														 UITextViewDelegate,
														 CLLocationManagerDelegate,
														 MKReverseGeocoderDelegate>
{
	IBOutlet UITextField *textTitle;
	IBOutlet UITextField *textTags;
	IBOutlet UITextView *textBody;
	IBOutlet UILabel *labelDate;
	IBOutlet UILabel *labelLocation;
	
	CLLocationManager* locationManager;
	CLLocation* currentLocation;
}

@property (nonatomic, retain) IBOutlet UITextField *textTitle;
@property (nonatomic, retain) IBOutlet UITextField *textTags;
@property (nonatomic, retain) IBOutlet UITextView *textBody;
@property (nonatomic, retain) IBOutlet UILabel *labelDate;
@property (nonatomic, retain) IBOutlet UILabel *labelLocation;

-(IBAction)savePushed: (id) sender;


@end
