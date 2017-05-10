//
//  DetailViewController.m
//  ios general
//
//  Created by Darina Lokovna on 5/10/17.
//  Copyright © 2017 Darina Locovna. All rights reserved.
//

#import "DetailViewController.h"
#import "MainTableViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)configureView {
    if (self.employee) {
        self.employeeDescriptionLabel.text = [NSString stringWithFormat:@"%@", self.employee];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    
    self.title = [NSString stringWithFormat:@"%@", self.employee];
    NSLog(@"Current Employee: %@", self.employee);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setDetailItem:(Employee *)newEmployee {
    if (_employee != newEmployee) {
        _employee = newEmployee;
        
        // Update the view.
        [self configureView];
    }
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
