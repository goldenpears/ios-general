#import "DetailViewController.h"
#import "MainTableViewController.h"
#import "EmployeeMO+CoreDataClass.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)configureView
{
    if (self.employee)
    {
        self.employeeDescriptionLabel.text = [NSString stringWithFormat:@"%@ %@ \'s salary is: %d", self.employee.firstName, self.employee.lastName, self.employee.salary];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
    self.title = [NSString stringWithFormat:@"%@", self.employee.firstName];
    NSLog(@"Current Employee: %@", self.employee.firstName);
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
