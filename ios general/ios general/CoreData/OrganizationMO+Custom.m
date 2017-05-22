#import "OrganizationMO+Custom.h"
#import "EmployeeMO+Custom.h"
#import "AppDelegate.h"

@implementation OrganizationMO (Custom)

- (int)calculateAverageSalary
{
    NSNumber *salary = [self.employees valueForKeyPath:@"@avg.salary"];
    int result = salary.intValue;
    NSLog(@"Average salary is: %d", result);
    return result;
}

- (EmployeeMO *)employeeWithLowestSalary
{
    NSManagedObjectContext *context = [AppDelegate shared].managedObjectContext;
    EmployeeMO *employee = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];

    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"salary" ascending:YES];
    NSArray *sortDescriptors = @[descriptor];
    NSArray<EmployeeMO *> *sortedArray = [self.employees sortedArrayUsingDescriptors:sortDescriptors];
    
    employee = sortedArray.firstObject;

    NSLog(@"Employee with the lowest salary: %@, %d", employee, employee.salary);
    return employee;
}

- (NSArray<EmployeeMO *> *)employeesWithSalary:(int)salary tolerance:(int)tolerance
{
    NSArray<EmployeeMO *> * employees = @[];
    for(EmployeeMO *e in self.employees)
    {
        if (e.salary < salary+tolerance && e.salary > salary-tolerance)
        {
            employees = [employees arrayByAddingObject:e];
        }
    }
    NSLog(@"All Employee which have %i salary whith +- %i tolerance: %@", salary, tolerance, employees);
    return employees;
}

- (NSArray<EmployeeMO *> *)sortedEmployee
{
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
    NSArray *sortDescriptors = @[descriptor];
    NSArray<EmployeeMO *> *sortedArray = [self.employees sortedArrayUsingDescriptors:sortDescriptors];
    return sortedArray;
}

-  (NSString *)description
{
    return [NSString stringWithFormat:@"%@", self.name];
}

@end
