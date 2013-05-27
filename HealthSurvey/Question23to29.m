//
//  Question23to29.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/13/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "Question23to29.h"

@interface Question23to29 ()
@property (weak, nonatomic) IBOutlet UITextField *q23tx;
@property (weak, nonatomic) IBOutlet UITextField *q24tx;
@property (weak, nonatomic) IBOutlet UITextField *q25tx;
@property (weak, nonatomic) IBOutlet UITextField *q26tx1;
@property (weak, nonatomic) IBOutlet UITextField *q26tx2;
@property (weak, nonatomic) IBOutlet UISwitch *q27sw;
@property (weak, nonatomic) IBOutlet UITextField *q28tx;
@property (weak, nonatomic) IBOutlet UILabel *q28title;
@property (weak, nonatomic) IBOutlet UILabel *q26title;

@end

@implementation Question23to29

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.q28title.hidden = YES;
    self.q28tx.hidden = YES;
    

}

- (IBAction)psw:(UISwitch*)sender {
    self.q28title.hidden = !self.q28title.isHidden;
    self.q28tx.hidden = !self.q28tx.isHidden;
}

-(void)setHealthSurveyResults{
    
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%@", self.q23tx.text],[NSString stringWithFormat:@"%@",self.q24tx.text],[NSString stringWithFormat:@"%@", self.q25tx.text], [NSString stringWithFormat:@"%@", self.q26tx1.text],[NSString stringWithFormat:@"%@", self.q26tx2.text],[NSString stringWithFormat:@"%d", self.q27sw.isOn],[NSString stringWithFormat:@"%@", self.q28tx.text],nil];
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
