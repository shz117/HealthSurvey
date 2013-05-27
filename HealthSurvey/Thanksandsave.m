//
//  Thanksandsave.m
//  HealthSurvey
//
//  Created by Jeremy H. Shi on 5/21/13.
//  Copyright (c) 2013 Hongzheng Shi. All rights reserved.
//

#import "Thanksandsave.h"
#import "HealthSurveyModelController.h"

@interface Thanksandsave ()
@property (weak, nonatomic) IBOutlet UILabel *thankYouTitle;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation Thanksandsave

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
}
- (IBAction)submit:(UIButton *)sender {
    NSLog(@"hello!%@",self.HealthSurveyModelController);
    [self.HealthSurveyModelController submitResults];
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
