#import "Employee.h"

@interface Employee ()

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;

@end

@implementation Employee : NSObject
- (instancetype)initWithFirstName:(NSString *)name lastName:(NSString *)lastname salary:(int)salary
{
    self = [super init];
    if (self)
    {
        self.firstName = name;
        self.lastName = lastname;
        self.salary = salary;
    }
    NSLog(@"New Employee: %@, %d",self.fullName, salary);
    return self;
}

- (NSString *)fullName
{
    NSString *fullName = [[NSString alloc] init];
    fullName = [NSString stringWithFormat: @"%@ %@", self.firstName, self.lastName];
    return fullName;
}

- (NSString *)description
{
    return self.firstName;
}

@end
