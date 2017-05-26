#import "CreateEmployeeViewController.h"
#import "AppDelegate.h"
#import "EmployeeMO+Custom.h"
#import "HSDatePickerViewController.h"

@interface CreateEmployeeViewController () <HSDatePickerViewControllerDelegate>

@property (nonatomic, strong) NSDate *selectedDate;
@property (weak, nonatomic) IBOutlet UIButton *setDateButton;

@end

@implementation CreateEmployeeViewController

- (IBAction)saveNewEmployeeButtonTapped:(UIBarButtonItem *)sender
{
    NSLog(@"Save button was pressed");
    if (self.firstNameField.text.length > 0 && self.lastNameField.text.length > 0 && self.salaryField.text.length > 0 && self.selectedDate)
    {
        NSManagedObjectContext *context = [AppDelegate shared].managedObjectContext;
        EmployeeMO *newEmployee = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
        newEmployee.firstName = self.firstNameField.text;
        newEmployee.lastName = self.lastNameField.text;
        newEmployee.salary = self.salaryField.text.intValue;
        newEmployee.dateOfBirth = self.selectedDate;
        NSLog(@"New Employee: %@", newEmployee);
        NSLog(@"New Employee ID: %lld", newEmployee.orderID);
    
    
        [[AppDelegate shared] saveContext];
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

- (IBAction)setDateButtonTapped:(UIButton *)sender {
    HSDatePickerViewController *hsdpvc = [[HSDatePickerViewController alloc] init];
    hsdpvc.delegate = self;
    if (self.selectedDate) {
        hsdpvc.date = self.selectedDate;
    }
    [self presentViewController:hsdpvc animated:YES completion:nil];
}

- (void)hsDatePickerPickedDate:(NSDate *)date {
    NSLog(@"Date picked %@", date);
    NSDateFormatter *dateFormater = [NSDateFormatter new];
    dateFormater.dateFormat = @"yyyy.MM.dd";
    [self.setDateButton setTitle:[dateFormater stringFromDate:date] forState:UIControlStateNormal];
    self.selectedDate = date;
}


@end
