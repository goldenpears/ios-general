#import <Foundation/Foundation.h>
#import "Employee.h"

@interface Organization : NSObject

@property(nonatomic, strong) NSString *name;

- (instancetype)initWithName:(NSString *)name;
- (void)addEmployeeWithName:(NSString *)employeeName;
- (void)addEmployee:(Employee *)employee;
- (int)calculateAverageSalary;
- (Employee *)employeeWithLowestSalary;
- (NSArray<Employee *> *)employeesWithSalary:(int)salary tolerance:(int)tolerance;
- (void)removeEmployee:(Employee *)employee;

@end
