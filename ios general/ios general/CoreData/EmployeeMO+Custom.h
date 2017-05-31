#import "EmployeeMO+CoreDataClass.h"
#import "EmployeeMO+CoreDataProperties.h"

@interface EmployeeMO (Custom)

+ (NSSet<EmployeeMO *> *)creatEmployeesFromArray:(NSArray *)employeesArray;

@end
