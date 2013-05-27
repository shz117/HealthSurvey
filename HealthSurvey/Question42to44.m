//
//  Question42to44.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/19/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "Question42to44.h"

@interface Question42to44 ()
@property (weak, nonatomic) IBOutlet UIPickerView *q42A;

@property (weak, nonatomic) IBOutlet UIPickerView *q44A;
@property (weak, nonatomic) IBOutlet UIPickerView *q43A;
@property (strong, nonatomic) NSArray* qAArray;

@end

@implementation Question42to44


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.qAArray = [NSArray arrayWithObjects: NSLocalizedString(@"na", nil),NSLocalizedString(@"q42a1", nil),NSLocalizedString(@"q42a2",nil),NSLocalizedString(@"q42a3",nil),NSLocalizedString(@"q42a4",nil),NSLocalizedString(@"q42a5",nil),nil];
    self.q42A.dataSource = self;
    self.q42A.delegate = self;
    self.q43A.dataSource = self;
    self.q43A.delegate = self;
    self.q44A.delegate = self;
    self.q44A.dataSource = self;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.qAArray  objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.qAArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

-(void)setHealthSurveyResults
{
    NSInteger q42Avalue=8;
    if ([self.q42A selectedRowInComponent:0]) {
        q42Avalue=[self.q42A selectedRowInComponent:0];
    }
    NSInteger q43Avalue=8;
    if ([self.q43A selectedRowInComponent:0]) {
        q43Avalue=[self.q43A selectedRowInComponent:0];
    }
    NSInteger q44Avalue=8;

    if ([self.q44A selectedRowInComponent:0]) {
        q44Avalue=[self.q44A selectedRowInComponent:0];
    }
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", q42Avalue],[NSString stringWithFormat:@"%d", q43Avalue],[NSString stringWithFormat:@"%d", q44Avalue],nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
