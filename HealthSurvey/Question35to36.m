//
//  Question35to36.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/18/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "Question35to36.h"

@interface Question35to36 ()
@property (weak, nonatomic) IBOutlet UISwitch *q31sw;

@property (weak, nonatomic) IBOutlet UILabel *selecttitle;
@end

@implementation Question35to36


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    


}


-(void)setHealthSurveyResults
{
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", self.q31sw.isOn],nil];
    
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
