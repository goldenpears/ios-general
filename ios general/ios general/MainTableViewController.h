#import <UIKit/UIKit.h>
#import "Employee.h"

@interface MainTableViewController : UITableViewController

@property (nonatomic, weak) id delegate;

- (void)showNewEmployee:(Employee *)employee;

@end
