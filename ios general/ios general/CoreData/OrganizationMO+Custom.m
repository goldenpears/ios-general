#import "OrganizationMO+Custom.h"
#import "EmployeeMO+Custom.h"

@implementation OrganizationMO (Custom)

- (int)calculateAverageSalary
{
    NSNumber *salary = [self.employees valueForKeyPath:@"@avg.salary"];
    int result = [salary intValue];

    for (EmployeeMO *e in self.employees)
    {
        NSLog(@"Employee: %@; Salary: %d", e, e.salary);
    }
    NSLog(@"Average salary is: %d", result);
    return result;
}

- (EmployeeMO *)employeeWithLowestSalary
{
    EmployeeMO *employee = [[EmployeeMO alloc] init];
    float max = MAXFLOAT;
    for (EmployeeMO *e in self.employees)
    {
        if (e.salary < max)
        {
            max = e.salary;
            employee = e;
        }
    }
    NSLog(@"Employee with the lowest salary: %@, %d", employee.fullName, employee.salary);
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

-  (NSString *)description
{
    return [NSString stringWithFormat:@"%@", self.name];
}

@end
