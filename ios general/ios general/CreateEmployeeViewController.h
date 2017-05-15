#import <UIKit/UIKit.h>
#import "MainTableViewController.h"

@protocol AddControllerDelegate

@required
- (void)showNewEmployee:(id)sender;
@end

@interface CreateEmployeeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *salaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *salaryField;

@property (nonatomic, weak) id<AddControllerDelegate> delegate;

@end
