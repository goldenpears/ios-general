#import "EmployeeMO+Custom.h"

@implementation EmployeeMO (Custom)

- (NSString *)description
{
    NSString *fullName = [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
    return fullName;
}

@end
