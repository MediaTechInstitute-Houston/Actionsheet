//
//  ViewController.h
//  Actionsheet
//
//  Created by Mark Dumes on 4/3/14.
//  Copyright (c) 2014 CollegeBlink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <MessageUI/MessageUI.h>
@interface ViewController : UIViewController
- (IBAction)share:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *job;
@property (weak, nonatomic) IBOutlet UITextField *skill;

@end
