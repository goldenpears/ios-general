#import "EmployeeMO+CoreDataClass.h"
#import "EmployeeMO+CoreDataProperties.h"

@interface EmployeeMO (Custom)

+ (EmployeeMO *)createEmployeeFromDictionary:(NSDictionary *)rawEmployee;

@end
