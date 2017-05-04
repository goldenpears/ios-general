#import "Employee.h"

@interface Employee ()

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;

@end

@implementation Employee : NSObject
- (instancetype)initWithFirstName: (NSString *) name
                         lastName: (NSString *) lastname
                           salary: (int) salary
{
    self = [super init];
    if (self) {
    self.firstName = name;
    self.lastName = lastname;
    self.salary   = salary;
    self.fullName = [NSString stringWithFormat: @"%@ %@", name, lastname];
    }
    NSLog(@"New Employee: %@, %d",self.fullName, salary);
    return self;
}

- (NSString *) description
{
    return self.firstName;
}

@end