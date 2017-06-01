#import <UIKit/UIKit.h>

@class EmployeeMO;
@class OrganizationMO;

@interface MainTableViewController : UITableViewController

- (void)addNewEmployee:(EmployeeMO *)employee;
- (void)setSelectedOrganizationWithOrganization:(OrganizationMO *)organization;

@end
