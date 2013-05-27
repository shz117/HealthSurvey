//
//  Question56to59.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/21/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "Question56to59.h"

@interface Question56to59 ()
@property (weak, nonatomic) IBOutlet UIPickerView *q59A;
@property (weak, nonatomic) IBOutlet UIPickerView *q57A;
@property (strong, nonatomic) NSArray* qAArray;
@property (weak, nonatomic) IBOutlet UITextField *q56tx;
@property (weak, nonatomic) IBOutlet UITextField *q58tx;

@end

@implementation Question56to59
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
	self.qAArray = [NSArray arrayWithObjects: NSLocalizedString(@"q57a1", nil),NSLocalizedString(@"q57a2", nil),nil];
    self.q57A.dataSource = self;
    self.q57A.delegate = self;
    self.q59A.dataSource = self;
    self.q59A.delegate = self;
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
    NSInteger q57Avalue = [self.q57A selectedRowInComponent:0]+1;
    NSInteger q59Avalue = [self.q59A selectedRowInComponent:0]+1;
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%@", self.q56tx.text],[NSString stringWithFormat:@"%d", q57Avalue],[NSString stringWithFormat:@"%@", self.q58tx.text],[NSString stringWithFormat:@"%d", q59Avalue],nil];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
