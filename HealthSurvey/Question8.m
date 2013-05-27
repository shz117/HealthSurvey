//
//  Question8.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/12/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "Question8.h"

@interface Question8 ()
@property (weak, nonatomic) IBOutlet UILabel *q8title;
@property (weak, nonatomic) IBOutlet UILabel *q8a0;
@property (weak, nonatomic) IBOutlet UILabel *q8a1;
@property (weak, nonatomic) IBOutlet UILabel *q8a2;
@property (weak, nonatomic) IBOutlet UIButton *a0;
@property (weak, nonatomic) IBOutlet UIButton *a1;
@property (weak, nonatomic) IBOutlet UIButton *a2;

@end

@implementation Question8

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
   }

- (IBAction)pressa0:(UIButton*)sender {
    sender.selected = 1;
    self.a1.selected = 0;
    self.a2.selected = 0;
}

- (IBAction)pressa1:(UIButton*)sender {
    sender.selected = 1;
    self.a0.selected = 0;
    self.a2.selected = 0;

}
- (IBAction)pressa2:(UIButton*)sender {
    sender.selected = 1;
    self.a0.selected = 0;
    self.a1.selected = 0;
}

-(void)setHealthSurveyResults{
    NSInteger q8Avalue = 8;
    if ([self.a0 isSelected]){
        q8Avalue = 0;
    }
    if ([self.a1 isSelected]){
        q8Avalue = 1;
    }
    if ([self.a2 isSelected]){
        q8Avalue = 2;
    }
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", q8Avalue],nil];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
}

@end
