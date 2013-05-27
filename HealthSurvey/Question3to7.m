//
//  Question3to7.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/11/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "Question3to7.h"

@interface Question3to7 ()
@property (weak, nonatomic) IBOutlet UILabel *q3title;
@property (weak, nonatomic) IBOutlet UILabel *q4title;
@property (weak, nonatomic) IBOutlet UILabel *q5title;
@property (weak, nonatomic) IBOutlet UILabel *q6title;
@property (weak, nonatomic) IBOutlet UILabel *q7title;
@property (weak, nonatomic) IBOutlet UIPickerView *q3A;
@property (retain, nonatomic) NSArray *q3AArray;
@property (weak, nonatomic) IBOutlet UITextField *q4Atext;
@property (weak, nonatomic) IBOutlet UIPickerView *q5A;

@property (retain, nonatomic) NSArray *q5AArray;
@property (weak, nonatomic) IBOutlet UISwitch *q6AButton;
@property (weak, nonatomic) IBOutlet UIPickerView *q7A;

@property (retain, nonatomic) NSArray *q7AArray;


@end

@implementation Question3to7

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.q3AArray = [NSArray arrayWithObjects: NSLocalizedString(@"q3answer8", nil),NSLocalizedString(@"q3answer0", nil),NSLocalizedString(@"q3answer1",nil),nil];
   
    self.q5AArray = [NSArray arrayWithObjects: NSLocalizedString(@"q5answer8", nil),NSLocalizedString(@"q5answer0", nil),NSLocalizedString(@"q5answer1",nil),NSLocalizedString(@"q5answer3",nil),NSLocalizedString(@"q5answer4",nil),NSLocalizedString(@"q5answer5",nil),NSLocalizedString(@"q5answer6",nil),nil];
//    self.q5AArray = [NSArray arrayWithObjects:@"foo",@"bar",@"foo1", nil];
    self.q7AArray = [NSArray arrayWithObjects: NSLocalizedString(@"q7answer8",nil),NSLocalizedString(@"q7answer0",nil),NSLocalizedString(@"q7answer1",nil),NSLocalizedString(@"q7answer2",nil),NSLocalizedString(@"q7answer3",nil),NSLocalizedString(@"q7answer4",nil),NSLocalizedString(@"q7answer5",nil),NSLocalizedString(@"q7answer6",nil),nil];
    _q3A.dataSource=self;
    _q3A.delegate=self;
    
    _q5A.dataSource=self;
    _q5A.delegate=self;
    
    _q7A.dataSource=self;
    _q7A.delegate=self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == self.q3A) {
        return [self.q3AArray objectAtIndex:row];
    }
    if (pickerView == self.q5A) {
        return [self.q5AArray objectAtIndex:row];
    }
    return [self.q7AArray  objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == self.q3A) {
        return [self.q3AArray count];
    }
    if (pickerView == self.q5A) {
        return [self.q5AArray count];
    }
    return [self.q7AArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}


- (IBAction)q6Abutton:(id)sender {
    self.q7title.hidden=![sender isOn];
    self.q7A.hidden=![sender isOn];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView == self.q3A) {
        BOOL isHidden=!row||row==1;
        self.q4title.hidden=isHidden;
        self.q4Atext.hidden=isHidden;
        self.q5title.hidden=isHidden;
        self.q5A.hidden=isHidden;
    }
}

-(void)setHealthSurveyResults{
    NSInteger q5Avalue=8;
    NSInteger q7Avalue=8;
    NSInteger q3Avalue=8;
    if ([self.q3A selectedRowInComponent:0]){
        q3Avalue = [self.q3A selectedRowInComponent:0];
    }
    NSString *q4Avalue = self.q4Atext.text;
    NSInteger q6Avalue = [self.q6AButton isOn];

    if (!self.q5A.isHidden) {
        if ([self.q5A selectedRowInComponent:0]){
            q5Avalue = [self.q5A selectedRowInComponent:0];
        }
    }
    if (!self.q7A.isHidden) {
        if ([self.q7A selectedRowInComponent:0]){
            q7Avalue = [self.q7A selectedRowInComponent:0];
        }
    }

    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", q3Avalue],[NSString stringWithFormat:@"%@",q4Avalue],[NSString stringWithFormat:@"%d", q5Avalue], [NSString stringWithFormat:@"%d", q6Avalue],[NSString stringWithFormat:@"%d", q7Avalue],nil];
}


@end
