#import "OrganizationMO+Custom.h"
#import "EmployeeMO+Custom.h"
#import "AppDelegate.h"

@implementation OrganizationMO (Custom)

- (void)addEmployeeWithOrderId:(EmployeeMO *)employee
{
    [self addEmployeesObject:employee];
    int max = [[self.employees valueForKeyPath:@"@max.orderID"] intValue];
    employee.orderID = max + 1;

    NSLog(@"Max ID: %d", max);
    NSLog(@"New Employee via 'addEmployeeWithOrderId': %lld - %@", employee.orderID, employee);
}

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

- (NSArray<EmployeeMO *> *)sortedEmployees
{
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"orderID" ascending:YES];
    NSArray *sortDescriptors = @[descriptor];
    NSArray<EmployeeMO *> *sortedArray = [self.employees sortedArrayUsingDescriptors:sortDescriptors];
    
    NSLog(@"Sorted Array: %@", sortedArray);
    return sortedArray;
}

+ (OrganizationMO *)createOrganizationFromDictionary:(NSDictionary *)dictionary
{
    OrganizationMO *org = [NSEntityDescription insertNewObjectForEntityForName:@"Organization" inManagedObjectContext:[AppDelegate shared].managedObjectContext];
    
    org.name = [dictionary objectForKey:@"name"];
    for (NSDictionary *rawEmployee in dictionary[@"employees"])
    {
    [org addEmployeesObject:[EmployeeMO createEmployeeFromDictionary:rawEmployee]];
    }
    NSLog(@"\nName of the Organization: %@ \n \t Employees here: \n \t %@", org.name, org.employees);
    return org;
}

-  (NSString *)description
{
    return [NSString stringWithFormat:@"%@", self.name];
}

@end
