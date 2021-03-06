//
//  NewIdeaTextViewController.h
//  IdeaBank_1
//
//  Created by Dina Jacobsen on 6/22/11.
//  Copyright 2011 Rensselaer Polytechnic Institute. All rights reserved.
//
/*
 License
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 * Neither the name of Dina Cecilie Jacobsen nor the
 names of its contributors may be used to endorse or promote products
 derived from this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL DINA CECILIE JACOBSEN BE LIABLE FOR ANY
 DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


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
