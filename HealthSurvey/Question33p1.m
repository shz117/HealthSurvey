//
//  Question33p1.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/17/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "Question33p1.h"

@interface Question33p1 ()
@property (weak, nonatomic) IBOutlet UISwitch *q33op1sw;
@property (weak, nonatomic) IBOutlet UISwitch *q33op2sw;
@property (weak, nonatomic) IBOutlet UISwitch *q33op3sw;
@property (weak, nonatomic) IBOutlet UISwitch *q33op4sw;
@property (weak, nonatomic) IBOutlet UIPickerView *q33op1A;
@property (weak, nonatomic) IBOutlet UIPickerView *q33op2A;
@property (weak, nonatomic) IBOutlet UIPickerView *q33op3A;
@property (weak, nonatomic) IBOutlet UIPickerView *q33op4A;
@property (strong, nonatomic) NSArray* q33AArray;
@property (weak, nonatomic) IBOutlet UILabel *q33op1;
@property (weak, nonatomic) IBOutlet UILabel *q33title;
@property (weak, nonatomic) IBOutlet UILabel *q33op2;
@property (weak, nonatomic) IBOutlet UILabel *q33op3;
@property (weak, nonatomic) IBOutlet UILabel *q33op4;

@end

@implementation Question33p1

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.q33AArray = [NSArray arrayWithObjects: NSLocalizedString(@"q33answer8", nil),NSLocalizedString(@"q33answer1", nil),NSLocalizedString(@"q33answer2",nil),NSLocalizedString(@"q33answer3",nil),NSLocalizedString(@"q33answer4",nil),NSLocalizedString(@"q33answer5",nil),nil];
    self.q33op1A.dataSource = self;
    self.q33op1A.delegate = self;
    self.q33op2A.dataSource = self;
    self.q33op2A.delegate = self;
    self.q33op3A.dataSource = self;
    self.q33op3A.delegate = self;
    self.q33op4A.dataSource = self;
    self.q33op4A.delegate = self;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.q33AArray  objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.q33AArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

-(void)setHealthSurveyResults
{
    NSInteger q33op1Avalue=8;
    if ([self.q33op1A selectedRowInComponent:0]) {
        q33op1Avalue=[self.q33op1A selectedRowInComponent:0];
    }
    NSInteger q33op2Avalue=8;
    if ([self.q33op2A selectedRowInComponent:0]) {
        q33op2Avalue=[self.q33op2A selectedRowInComponent:0];
    }
    NSInteger q33op3Avalue=8;
    if ([self.q33op3A selectedRowInComponent:0]) {
        q33op3Avalue=[self.q33op3A selectedRowInComponent:0];
    }
    
    NSInteger q33op4Avalue=8;
    if ([self.q33op4A selectedRowInComponent:0]) {
        q33op4Avalue=[self.q33op4A selectedRowInComponent:0];
    }

    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", self.q33op1sw.isOn],[NSString stringWithFormat:@"%d", q33op1Avalue],[NSString stringWithFormat:@"%d", self.q33op2sw.isOn],[NSString stringWithFormat:@"%d",q33op2Avalue],[NSString stringWithFormat:@"%d", self.q33op3sw.isOn],[NSString stringWithFormat:@"%d", q33op3Avalue],[NSString stringWithFormat:@"%d", self.q33op4sw.isOn], [NSString stringWithFormat:@"%d", q33op4Avalue],nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
