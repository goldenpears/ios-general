#import "CreateEmployeeViewController.h"
#import "Employee.h"

@interface CreateEmployeeViewController ()

@end

@implementation CreateEmployeeViewController

- (IBAction)saveNewEmployeeButtonTapped:(UIBarButtonItem *)sender
{
    NSLog(@"Save button was pressed");
    if (self.firstNameField.text.length > 0 && self.lastNameField.text.length > 0 && self.salaryField.text.length > 0)
    {
        Employee *employee = [[Employee alloc] initWithFirstName:self.firstNameField.text lastName:self.lastNameField.text salary:self.salaryField.text.intValue];
        [self.navigationController popToRootViewControllerAnimated:YES];
        [self.delegate addNewEmployee:employee];
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
        self.statusLabel.text = @"All fields are required";
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
