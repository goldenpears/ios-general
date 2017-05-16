#import <UIKit/UIKit.h>

@class Employee;

@protocol AddControllerDelegate
- (void)addNewEmployee:(Employee *)employee;
@end

@interface CreateEmployeeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *salaryLabel;

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *salaryField;

@property (weak, nonatomic) id<AddControllerDelegate> delegate;

@end
