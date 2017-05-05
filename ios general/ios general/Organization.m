#import "Organization.h"
#import "Employee.h"

@interface Organization ()

@property (nonatomic, strong) NSArray<Employee *> *employees;

@end


@implementation Organization : NSObject

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self)
    {
        self.name = name;
    }
    NSLog(@"New Organization: %@", name);
    return self;
}


- (void)addEmployeeWithName:(NSString *)employeeName
{
    // generate int between 100 and 5000 wich divisible by 10 (e.g. 110, 2300)
    int randomSalary = (10 + arc4random_uniform(490)) * 10;
    
    // check for whitespace in name
    NSRange whiteSpaceRange = [employeeName rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]];
    if (whiteSpaceRange.location != NSNotFound) {
        NSArray * employeeNameArray = [employeeName componentsSeparatedByString:@" "];
//        NSLog(@"New name values are : %@", employeeNameArray);
        
        Employee *newEmployee = [[Employee alloc] initWithFirstName:employeeNameArray[0] lastName:employeeNameArray[1] salary:randomSalary];
        [self addEmployee:newEmployee];
    }
    else
    {
        // if name without space, put last name as 'Undefined'
        Employee *newEmployee = [[Employee alloc] initWithFirstName:employeeName lastName:@"Undefined" salary:randomSalary];
        [self addEmployee:newEmployee];
    }
//    NSLog(@"All Employees in %@: %@",self.name , self.employees);
}


- (void)addEmployee:(Employee *)employee
{
    if (self.employees)
    {
        self.employees = [self.employees arrayByAddingObject:employee];
    }
    else
    {
        self.employees = @[];
        self.employees = [self.employees arrayByAddingObject:employee];
    }
//    NSLog(@"Add new Employee via 'addEmployee' method: %@", employee);
    NSLog(@"All Employees in %@: %@", self.name, self.employees);
}


- (int)calculateAverageSalary
{
    NSNumber *salary = [self.employees valueForKeyPath:@"@avg.salary"];;
    int result = [salary intValue];
    
    for (Employee *e in self.employees)
    {
        NSLog(@"Employee: %@; Salary: %d", e, e.salary);
    }
    NSLog(@"Average salary is: %d", result);
    return result;
}


- (Employee *)employeeWithLowestSalary
{
    Employee *employee = [[Employee alloc] init];
    float max = MAXFLOAT;
    for (Employee *e in self.employees)
    {
        if (e.salary < max)
        {
            max = e.salary;
            employee = e;
        }
    }
    NSLog(@"Employee with the lowest salary: %@, %d", employee.fullName, employee.salary);
    return employee;
}


- (NSArray<Employee *> *)employeesWithSalary:(int)salary tolerance:(int)tolerance
{
    NSArray<Employee *> * employees = @[];
    for(Employee *e in self.employees)
    {
        if (e.salary < salary+tolerance && e.salary > salary-tolerance)
        {
            employees = [employees arrayByAddingObject:e];
        }
    }
    NSLog(@"All Employee which have %i salary whith +- %i tolerance: %@", salary, tolerance, employees);
    return employees;
}

-  (NSString *)description
{
    return self.name;
}

- (void)removeEmployee:(Employee *)employee
{
    NSMutableArray *newArray = [NSMutableArray arrayWithArray:self.employees];
    if ([newArray containsObject:employee])
    {
        [newArray removeObject:employee];
        self.employees = [newArray copy];
        NSLog(@"Employee: '%@' was removed. New list of all Employees: %@", employee.fullName, self.employees);
    }
    else
    {
        NSLog(@"There is no employee with name: %@ works for '%@' organization", employee.fullName, self.name);
    }
}

@end
