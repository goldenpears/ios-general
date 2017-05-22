#import "DetailViewController.h"
#import "EmployeeMO+CoreDataClass.h"

@interface DetailViewController ()
@end

@implementation DetailViewController

- (void)configureView
{
    if (self.employee)
    {
        self.employeeDescriptionLabel.text = [NSString stringWithFormat:@"%@\'s salary is: %d", self.employee, self.employee.salary];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
    self.title = [NSString stringWithFormat:@"%@", self.employee];
    NSLog(@"Current Employee: %@", self.employee);
}

- (void)setDetailItem:(EmployeeMO *)newEmployee
{
    if (self.employee != newEmployee)
    {
        self.employee = newEmployee;
        [self configureView];
    }
}

@end
