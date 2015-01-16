//
//  TipViewController.m
//  TipCalculator
//
//  Created by Videsh Sadafal on 1/14/15.
//  Copyright (c) 2015 Videsh Sadafal. All rights reserved.
//

#import "TipViewController.h"
#import "SettingViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *bill;
@property (weak, nonatomic) IBOutlet UILabel *tip;
@property (weak, nonatomic) IBOutlet UILabel *total;
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;
@property (weak, nonatomic) IBOutlet UILabel *tipPercent;

- (void)calculate;
- (void)onSettingsButton;
- (void)updateDefault;
- (void)updateTip;

@end

@implementation TipViewController
@synthesize bill, tip, total, tipSlider, tipPercent;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Tip Calculator";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:15 forKey:@"defaultTip"];
    [defaults synchronize];
    [self updateDefault];
    [self updateTip];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self updateDefault];
    [self calculate];
    [self updateTip];
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self calculate];
}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingViewController alloc] init] animated:YES];
}

- (void)updateDefault {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    tipSlider.value = [defaults floatForKey:@"defaultTip"];
    tipPercent.text = [NSString stringWithFormat:@"%d", (int)tipSlider.value];
}

- (void)updateTip {
    int value = tipSlider.value;
    NSString *valueStr = [NSString stringWithFormat:@"%d", value];
    tipPercent.text = valueStr;
    float fontSize = 40 + (10*value/100);
    tip.font = [tip.font fontWithSize:fontSize];
    [self calculate];
}

- (IBAction)onSlide:(UISlider *)sender {
    [self updateTip ];
}


- (void) calculate {
    float billAmount = [bill.text floatValue];
    float tipPerc = [tipPercent.text floatValue];
    float tipAmount = billAmount * tipPerc / 100;
    float totalAmount = billAmount + tipAmount;
    tip.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    total.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
