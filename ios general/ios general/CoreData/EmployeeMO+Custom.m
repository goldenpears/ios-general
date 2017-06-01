#import "EmployeeMO+Custom.h"
#import "AppDelegate.h"

@implementation EmployeeMO (Custom)

+ (EmployeeMO *)createEmployeeFromDictionary:(NSDictionary *)rawEmployee
{
    EmployeeMO *employee = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:[AppDelegate shared].managedObjectContext];
    employee.firstName = rawEmployee[@"first_name"];
    employee.lastName = rawEmployee[@"last_name"];
    if ([rawEmployee[@"salary"] isKindOfClass:[NSNull class]])
    {
        employee.salary = 0;
    }
    else
    {
        employee.salary = [rawEmployee[@"salary"] intValue];
    }
    employee.orderID = [rawEmployee[@"order"] intValue];

    NSLog(@"New Employee from Dictionary: %@", employee);
    return employee;
}

- (NSString *)description
{
    NSString *fullName = [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
    return fullName;
}

@end
