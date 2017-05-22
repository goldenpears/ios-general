#import <UIKit/UIKit.h>

@class EmployeeMO;

@interface DetailViewController : UIViewController

@property (weak, nonatomic) EmployeeMO *employee; // weak cause we keep ref in MainController
@property (weak, nonatomic) IBOutlet UILabel *employeeDescriptionLabel;

@end
