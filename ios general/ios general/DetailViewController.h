#import <UIKit/UIKit.h>

@class Employee;

@interface DetailViewController : UIViewController

@property (weak, nonatomic) Employee *employee; // weak cause we keep ref in MainController
@property (weak, nonatomic) IBOutlet UILabel *employeeDescriptionLabel;

@end
