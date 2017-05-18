#import "EmployeeMO+CoreDataClass.h"
#import "EmployeeMO+CoreDataProperties.h"

@interface EmployeeMO (Custom)

@property (nonatomic, readonly) NSString *fullName;

- (NSString *)fullName;

@end
