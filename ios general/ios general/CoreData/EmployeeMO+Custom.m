#import "EmployeeMO+Custom.h"

@implementation EmployeeMO (Custom)

+ (NSSet<EmployeeMO *> *)creatEmployeesFromArray:(NSArray *)employeesArray
{
    NSSet<EmployeeMO *> *employees = [NSSet<EmployeeMO *> new];
    for(NSDictionary *dic in employeesArray)
        {
        if([dic objectForKey:@"first_name"] && [dic objectForKey:@"last_name"] )
        {
        NSLog(@"FIRST AND LAST NAME: %@ %@", [dic objectForKey:@"first_name"], [dic objectForKey:@"last_name"]);
        }
    }
    return employees;
}

- (NSString *)description
{
    NSString *fullName = [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
    return fullName;
}

@end
