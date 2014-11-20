//
//  ViewController.m
//  Actionsheet
//
//  Created by Mark Dumes on 4/3/14.
//  Copyright (c) 2014 CollegeBlink. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize name;
@synthesize job;
@synthesize skill;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//when action button is pressed on navigation bar
- (IBAction)share:(id)sender {
    //title
    NSString *title = @"Where do you want to share";
    //cancel button title
    NSString *cancelTitle = @"Cancel";
    //creates the actionsheet using objects above
    UIActionSheet *sharing = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:cancelTitle destructiveButtonTitle:nil otherButtonTitles:@"Facebook",@"Twitter",@"Email", nil];
    //tag to identifies the actionsheet
    sharing.tag = 1;
    //displays the action sheet over view
    [sharing showInView:[UIApplication sharedApplication].keyWindow];
}
//instance for when action sheet button is pressed
// tells it how to interact with target action
-(void)actionSheet:(UIActionSheet *) sharing clickedButtonAtIndex:(NSInteger)buttonIndex{
    //tag for action sheet was given above (which is 1)
    //if the action with tag 1 was interacted with look for which button was pressed in the action sheet
    if (sharing.tag == 1) {
        //checking which button was press
        //which method to implemplement
        //methods are found on this page(self)
        //(Facebook=0,Twitter=1, Email=2)
        switch (buttonIndex) {
            case 0:
                [self facebook];
                break;
            case 1:
                [self twitter];
                break;
            case 2:
                [self email];
                break;
            default:
                break;
        }//ends switch statent
    }//ends if statement
    
    }//ends instance
//facebook method called in switch  statement
-(void)facebook
{
    //stored objects from view textfields
    NSString *Name = [name text];
    NSString *Job = [job text];
    NSString *Skill = [skill text];
    //tells what type of service the controller is for
    //creates a compose controller
    SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    //sets the initial text for the compose controller.
    [controller setInitialText:[[NSString alloc]initWithFormat:@"Hello %@,\n Hope that you are having a great day being a %@. It must be nice being able to %@",Name,Job,Skill]];
    //show the compose controller with desired type on screen
    [self presentViewController:controller animated:YES completion:nil];
}
-(void)twitter{
    //stored objects from view textfields
    NSString *Name = [name text];
    NSString *Job = [job text];
    NSString *Skill = [skill text];
    //tells what type of service the controller is for
    //creates a compose controller
    SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    //sets the initial text for the compose controller.
    [controller setInitialText:[[NSString alloc]initWithFormat:@"Hello %@,\n Hope that you are having a great day being a %@. It must be nice being able to %@",Name,Job,Skill]];
    //show the compose controller with desired type on screen
    [self presentViewController:controller animated:YES completion:nil];
}
-(void)email{
    //stored objects from view textfields
    NSString *Name = [name text];
    NSString *Job = [job text];
    NSString *Skill = [skill text];
    //Email subject
    NSString *subject = @"Practice Email";
    //email body or primary message
    NSString *body = [[NSString alloc]initWithFormat:@"Hello %@,\n Hope that you are having a great day being a %@. It must be nice being able to %@",Name,Job,Skill];
    //who are you sending the message to
    NSArray *Recipients = [NSArray arrayWithObject:@"mark.dumes@gmail.com"];
    // initiates the mail compose controller
    MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
    //mail compose controller recieve behaviors and atributes from this class(self)
    controller.mailComposeDelegate =self;
    //places subject, message,and Recipients in the compose controller
    [controller setSubject:subject];
    [controller setMessageBody:body isHTML:NO];
    [controller setToRecipients:Recipients];
    //show the compose controller with desired type on screen
    [self presentViewController:controller animated:YES completion:nil];
    
}
//instance to allow the mail compose controller to output errors
//tells controller what to do when finished
-(void)mailComposeController: (MFMailComposeViewController*) controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    //dismiss the mail compose controller from View
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
