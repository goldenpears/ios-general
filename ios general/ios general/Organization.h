#import <Foundation/Foundation.h>

@class Employee;

@interface Organization : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray<Employee *> *allEmployees;

- (instancetype)initWithName:(NSString *)name;
- (void)addEmployeeWithName:(NSString *)employeeName;
- (void)addEmployee:(Employee *)employee;
- (int)calculateAverageSalary;
- (Employee *)employeeWithLowestSalary;
- (NSArray<Employee *> *)employeesWithSalary:(int)salary tolerance:(int)tolerance;
- (void)removeEmployee:(Employee *)employee;

@end
