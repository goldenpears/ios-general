#import "EmployeeMO+Custom.h"

@implementation EmployeeMO (Custom)

- (NSString *)fullName
{
    NSString *fullName = [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
    return fullName;
}

- (NSString *)description
{
    return self.fullName;
}

@end
