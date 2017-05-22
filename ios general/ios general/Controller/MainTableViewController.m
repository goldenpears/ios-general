#import "MainTableViewController.h"
#import "DetailViewController.h"
#import "CreateEmployeeViewController.h"
#import "EmployeeMO+Custom.h"
#import "OrganizationMO+Custom.h"
#import "AppDelegate.h"

@interface MainTableViewController () <AddControllerDelegate>

@property (nonatomic, strong) NSArray<EmployeeMO *> *employees;
@property (nonatomic, weak) EmployeeMO *selectedEmployee;
@property (nonatomic, strong) OrganizationMO *currentOrganization;

@end

@implementation MainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    // Check if Organization exist
    NSManagedObjectContext *context = [AppDelegate shared].managedObjectContext;
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:[OrganizationMO fetchRequest] error:&error];
    
    if (results.count == 0)
    {
        // if Organization doesn't exist, create one
        self.currentOrganization = [NSEntityDescription insertNewObjectForEntityForName:@"Organization" inManagedObjectContext:context];
        self.currentOrganization.name = @"Default Organization";
    }
    else
    {
        self.currentOrganization = results.firstObject;
    }
    
    self.employees = self.currentOrganization.sortedEmployeeArray;
    NSLog(@"Low: %@",[self.currentOrganization employeeWithLowestSalary]);
    NSLog(@"Sorted array: %@", self.employees);
    
    self.title = [NSString stringWithFormat:@"%@", self.currentOrganization.name];
    [[AppDelegate shared] saveContext];
}

- (IBAction)addButtonTapped:(UIBarButtonItem *)sender
{
    NSLog(@"Add button was tapped");
    [self performSegueWithIdentifier:@"AddNewEmployee" sender:self];

}

- (void)addNewEmployee:(EmployeeMO *)employee
{
    [self.currentOrganization addEmployeesObject:employee];
    [[AppDelegate shared] saveContext];
    
    self.employees = self.currentOrganization.sortedEmployeeArray;
    NSLog(@"Sorted array after additon: %@", self.employees);
    
    [self.tableView beginUpdates];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.employees indexOfObjectIdenticalTo:employee] inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
    NSLog(@"Low: %@",[self.currentOrganization employeeWithLowestSalary]);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedEmployee = self.employees[indexPath.row];
    [self performSegueWithIdentifier:@"showEmployeeDetails" sender:self];
    NSLog(@"Selected employee: %@", self.employees[indexPath.row]);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showEmployeeDetails"])
    {
        DetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.employee = self.selectedEmployee;
    }
    if ([segue.identifier isEqualToString:@"AddNewEmployee"])
    {
        CreateEmployeeViewController *createController = segue.destinationViewController;
        createController.delegate = self;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.employees.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    EmployeeMO *currentEmployee = [self.employees objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",currentEmployee.firstName, currentEmployee.lastName];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        EmployeeMO *selectedEmployee = self.employees[indexPath.row];
        [self.currentOrganization removeEmployeesObject:selectedEmployee];
        NSLog(@"Set after delete: %@", self.currentOrganization.employees);
        [[AppDelegate shared] saveContext];
        
       self.employees = self.currentOrganization.sortedEmployeeArray;
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

@end
