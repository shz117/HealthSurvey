//
//  Question47to50.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/19/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "Question47to50.h"

@interface Question47to50 ()
@property (weak, nonatomic) IBOutlet UIDatePicker *q47A;
@property (weak, nonatomic) IBOutlet UIPickerView *q48A;
@property (weak, nonatomic) IBOutlet UITextField *q49tx;
@property (weak, nonatomic) IBOutlet UIPickerView *q50A;
@property (strong, nonatomic) NSArray* q48AArray;

@property (strong, nonatomic) NSArray* q50AArray;

@end

@implementation Question47to50
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.q48AArray = [NSArray arrayWithObjects: NSLocalizedString(@"q48a1", nil),NSLocalizedString(@"q48a2", nil),nil];
    self.q50AArray = [NSArray arrayWithObjects: NSLocalizedString(@"q50a1", nil),NSLocalizedString(@"q50a2", nil),nil];
    self.q48A.dataSource = self;
    self.q48A.delegate = self;
    self.q50A.dataSource = self;
    self.q50A.delegate = self;

}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == self.q48A){
        return [self.q48AArray objectAtIndex:row];
    }
    return [self.q50AArray  objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.q48AArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

-(void)setHealthSurveyResults
{
    NSDate *q47Avalue = self.q47A.date;
    NSInteger q48Avalue = [self.q48A selectedRowInComponent:0]+1;
    NSInteger q50Avalue = [self.q50A selectedRowInComponent:0]+1;
    
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%@", q47Avalue],[NSString stringWithFormat:@"%d", q48Avalue],[NSString stringWithFormat:@"%@", self.q49tx.text],[NSString stringWithFormat:@"%d", q50Avalue],nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
