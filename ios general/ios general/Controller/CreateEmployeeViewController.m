#import "CreateEmployeeViewController.h"
#import "AppDelegate.h"
#import "EmployeeMO+Custom.h"
#import "OrganizationMO+Custom.h"

@interface CreateEmployeeViewController ()

@end

@implementation CreateEmployeeViewController

- (IBAction)saveNewEmployeeButtonTapped:(UIBarButtonItem *)sender
{
    NSLog(@"Save button was pressed");
    if (self.firstNameField.text.length > 0 && self.lastNameField.text.length > 0 && self.salaryField.text.length > 0)
    {
        NSManagedObjectContext *context = [AppDelegate shared].managedObjectContext;
        EmployeeMO *newEmployee = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
        newEmployee.firstName = self.firstNameField.text;
        newEmployee.lastName = self.lastNameField.text;
        newEmployee.salary = self.salaryField.text.intValue;
        NSLog(@"New Employee: %@", newEmployee);
        
        NSError *error = nil;
        if (![context save:&error])
        {
            NSLog(@"Can't save new Employee: %@ %@", error, error.userInfo);
        }
        [self.delegate addNewEmployee:newEmployee];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else
    {
        NSLog(@"Can not save new object");
    }
}

- (IBAction)textChanged:(UITextField *)textField
{
    if (textField.text.length == 0)
    {
        textField.layer.borderColor = [UIColor colorWithRed:1.00f green:0.34f blue:0.34f alpha:1.0f].CGColor; // red
        textField.layer.borderWidth = 1.0f;
        textField.layer.cornerRadius = 5.0f;
        NSLog(@"Some Field is empty");
    }
    else
    {
        textField.layer.borderColor = [UIColor colorWithRed:0.48f green:0.89f blue:0.77f alpha:1.0f].CGColor; // light-green
        textField.layer.borderWidth = 1.0f;
        textField.layer.cornerRadius = 5.0f;
    }
}

@end
