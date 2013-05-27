//
//  ScreeningQuestions.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/10/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "ScreeningQuestions.h"
#import "HealthSurveyModelController.h"


@interface ScreeningQuestions ()<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UISwitch *q1answer;
@property (weak, nonatomic) IBOutlet UISwitch *q2answer;
@property (weak, nonatomic) IBOutlet UILabel *q1title;
@property (weak, nonatomic) IBOutlet UILabel *q2title;

@end

@implementation ScreeningQuestions

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.


}
- (IBAction)q1answer:(id)sender {
    if (![sender isOn]) {
        [self recordRefusal];
        [self showAlert1];
    }
}
- (IBAction)q2answer:(id)sender {
    if (![sender isOn]) {
        [self showAlert2];
    }

}

-(void)showAlert1
{
    NSString* msg = @"Press to start another survey";
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Not willing to survey" message:msg delegate:self cancelButtonTitle:@"Restart" otherButtonTitles:nil];
    [alert show];
}

-(void)showAlert2
{
    NSString* msg = @"Press to start another survey";
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Not living nearby" message:msg delegate:self cancelButtonTitle:@"Restart" otherButtonTitles:nil];
    [alert show];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Restart"])
    {
        [_q1answer setOn:YES animated:YES];
        [_q2answer setOn:YES animated:YES];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setHealthSurveyResults{
    NSInteger q1Avalue=[self.q1answer isOn];
    NSInteger q2Avalue=[self.q2answer isOn];
    NSDate *date=[NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    NSString *dateString=[dateFormatter stringFromDate:date];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateStyle:NSDateFormatterNoStyle];
    self.dataArray = [NSArray arrayWithObjects:dateString,[dateFormatter stringFromDate:date],[NSString stringWithFormat:@"%u", arc4random()],[NSString stringWithFormat:@"%d",q1Avalue],[NSString stringWithFormat:@"%d",q2Avalue], nil];
}

//NEEDS CHECK!
-(void)recordRefusal{
    [self setHealthSurveyResults];
    [self.HealthSurveyModelController submitResults];
}

@end
