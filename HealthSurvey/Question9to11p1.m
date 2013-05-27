//
//  Question9to11p1.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/12/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "Question9to11p1.h"

@interface Question9to11p1 ()
@property (weak, nonatomic) IBOutlet UISwitch *sw0;
@property (weak, nonatomic) IBOutlet UISwitch *sw1;
@property (weak, nonatomic) IBOutlet UISwitch *sw2;
@property (weak, nonatomic) IBOutlet UISwitch *sw3;
@property (weak, nonatomic) IBOutlet UISwitch *sw4;
@property (weak, nonatomic) IBOutlet UISwitch *sw5;
@property (weak, nonatomic) IBOutlet UISwitch *sw6;
@property (weak, nonatomic) IBOutlet UITextField *tx0;
@property (weak, nonatomic) IBOutlet UITextField *tx1;
@property (weak, nonatomic) IBOutlet UITextField *tx2;
@property (weak, nonatomic) IBOutlet UITextField *tx3;
@property (weak, nonatomic) IBOutlet UITextField *tx4;
@property (weak, nonatomic) IBOutlet UITextField *tx5;
@property (weak, nonatomic) IBOutlet UITextField *tx6;


@end

@implementation Question9to11p1

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.tx0 setHidden:TRUE];
    [self.tx1 setHidden:TRUE];
    [self.tx2 setHidden:TRUE];
    [self.tx3 setHidden:TRUE];
    [self.tx4 setHidden:TRUE];
    [self.tx5 setHidden:TRUE];
    [self.tx6 setHidden:TRUE];
}

- (IBAction)psw0:(id)sender {
    self.tx0.hidden = !self.tx0.isHidden;
}

- (IBAction)psw1:(id)sender {
    self.tx1.hidden = !self.tx1.isHidden;
}

- (IBAction)psw2:(id)sender {
    self.tx2.hidden = !self.tx2.isHidden;
}

- (IBAction)psw3:(id)sender {
    self.tx3.hidden = !self.tx3.isHidden;
}

- (IBAction)psw4:(id)sender {
    self.tx4.hidden = !self.tx4.isHidden;
}

- (IBAction)psw5:(id)sender {
    self.tx5.hidden = !self.tx5.isHidden;
}

- (IBAction)psw6:(id)sender {
    self.tx6.hidden = !self.tx6.isHidden;
}

-(void)setHealthSurveyResults
{
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", self.sw0.isOn],[NSString stringWithFormat:@"%@", self.tx0.text],[NSString stringWithFormat:@"%d", self.sw1.isOn],[NSString stringWithFormat:@"%@", self.tx1.text],[NSString stringWithFormat:@"%d", self.sw2.isOn],[NSString stringWithFormat:@"%@", self.tx2.text],[NSString stringWithFormat:@"%d", self.sw3.isOn],[NSString stringWithFormat:@"%@", self.tx3.text],[NSString stringWithFormat:@"%d", self.sw4.isOn],[NSString stringWithFormat:@"%@", self.tx4.text],[NSString stringWithFormat:@"%d", self.sw5.isOn],[NSString stringWithFormat:@"%@", self.tx5.text],[NSString stringWithFormat:@"%d", self.sw6.isOn],[NSString stringWithFormat:@"%@", self.tx6.text],nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
