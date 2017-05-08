//
//  ViewController.h
//  ios general
//
//  Created by Darina Lokovna on 5/4/17.
//  Copyright © 2017 Darina Locovna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *label;
@property (nonatomic, strong) IBOutlet UITextField *inputField;
@property (nonatomic, strong) IBOutlet UIButton *setText;

- (IBAction)setText:(id)sender;


@end

