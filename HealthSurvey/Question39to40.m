//
//  Question39to40.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/19/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "Question39to40.h"

@interface Question39to40 ()
@property (weak, nonatomic) IBOutlet UIPickerView *q39A;
@property (weak, nonatomic) IBOutlet UIPickerView *q40A;
@property (weak, nonatomic) IBOutlet UIPickerView *q41A;
@property (strong, nonatomic) NSArray* qAArray;
@end

@implementation Question39to40


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.qAArray = [NSArray arrayWithObjects: NSLocalizedString(@"na", nil),NSLocalizedString(@"no", nil),NSLocalizedString(@"yes",nil),nil];
    self.q39A.dataSource = self;
    self.q39A.delegate = self;
    self.q40A.dataSource = self;
    self.q40A.delegate = self;
    self.q41A.dataSource = self;
    self.q41A.delegate = self;

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
    NSInteger q39Avalue=8;
    if ([self.q39A selectedRowInComponent:0]) {
        q39Avalue=[self.q39A selectedRowInComponent:0];
    }
    NSInteger q40Avalue=8;
    if ([self.q40A selectedRowInComponent:0]) {
        q40Avalue=[self.q40A selectedRowInComponent:0];
    }
    NSInteger q41Avalue=8;
    if ([self.q41A selectedRowInComponent:0]) {
        q41Avalue=[self.q41A selectedRowInComponent:0];
    }

    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", q39Avalue],[NSString stringWithFormat:@"%d", q40Avalue],[NSString stringWithFormat:@"%d", q41Avalue],nil];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
