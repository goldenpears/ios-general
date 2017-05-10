//
//  DetailViewController.h
//  ios general
//
//  Created by Darina Lokovna on 5/10/17.
//  Copyright © 2017 Darina Locovna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Employee *employee;
@property (weak, nonatomic) IBOutlet UILabel *employeeDescriptionLabel;

@end
