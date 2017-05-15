#import "CreateEmployeeViewController.h"

@interface CreateEmployeeViewController ()

@end

@implementation CreateEmployeeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Add new Employee";
    
    [self.firstNameField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.lastNameField  addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.salaryField    addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveNewObject:)];
    self.navigationItem.rightBarButtonItem = saveButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(BOOL)textFieldDidChange:(UITextField *)textField
{
    if ([textField.text isEqualToString:@""])
    {
        self.statusLabel.text = @"All fields are required";
        textField.layer.borderColor = [[UIColor colorWithRed:1.00 green:0.34 blue:0.34 alpha:1.0] CGColor]; // red
        textField.layer.borderWidth = 1.0;
        textField.layer.cornerRadius = 5.0f;
        NSLog(@"Some Field is empty");
        return NO;
    }
    else
    {
        textField.layer.borderColor = [[UIColor colorWithRed:0.48 green:0.89 blue:0.77 alpha:1.0] CGColor]; // light-green
        return YES;
    }
}

- (void)saveNewObject:(id)sender
{
    NSLog(@"Save button was pressed");
    if ([self textFieldDidChange:self.firstNameField] && [self textFieldDidChange:self.lastNameField] && [self textFieldDidChange:self.salaryField])
    {
        Employee *employee = [[Employee alloc] initWithFirstName:self.firstNameField.text lastName:self.lastNameField.text salary:[self.salaryField.text intValue]];
        [self.navigationController popToRootViewControllerAnimated:YES];
        [self.delegate showNewEmployee:employee];
    }
    else
    {
         NSLog(@"Can not save new object");
    }
}

@end
