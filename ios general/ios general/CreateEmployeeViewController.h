#import <UIKit/UIKit.h>
#import "MainTableViewController.h"

@interface CreateEmployeeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *salaryField;
@property (nonatomic, weak) MainTableViewController *mainController;

@end
