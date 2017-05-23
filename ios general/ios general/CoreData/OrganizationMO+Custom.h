#import "OrganizationMO+CoreDataClass.h"
#import "OrganizationMO+CoreDataProperties.h"

@class EmployeeMO;

@interface OrganizationMO (Custom)

@property (nonatomic, readonly) NSArray<EmployeeMO *> *sortedEmployee;

- (int)calculateAverageSalary;
- (EmployeeMO *)employeeWithLowestSalary;
- (NSArray<EmployeeMO *> *)employeesWithSalary:(int)salary tolerance:(int)tolerance;

@end