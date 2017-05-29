#import "MainTableViewController.h"
#import "DetailViewController.h"
#import "CreateEmployeeViewController.h"
#import "EmployeeMO+Custom.h"
#import "OrganizationMO+Custom.h"
#import "AppDelegate.h"
#import "ios_general-Swift.h"


@interface MainTableViewController () <AddControllerDelegate>

@property (nonatomic, strong) NSArray<EmployeeMO *> *employees;
@property (nonatomic, weak) EmployeeMO *selectedEmployee;
@property (nonatomic, strong) OrganizationMO *currentOrganization;
@property (nonatomic, strong) OrganizationInfoViewController *organizationController;

@end

@implementation MainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    self.organizationController = [OrganizationInfoViewController new];
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
    [self updateEmployeeList];
    self.title = [NSString stringWithFormat:@"%@", self.currentOrganization.name];
    [[AppDelegate shared] saveContext];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(randomizeEmployeeOrder:) name:self.organizationController.kEmployeesOrderHasChanged object:nil];
}

- (IBAction)addButtonTapped:(UIBarButtonItem *)sender
{
    NSLog(@"Add button was tapped");
    [self performSegueWithIdentifier:@"AddNewEmployee" sender:self];

}

- (void)addNewEmployee:(EmployeeMO *)employee
{
    NSLog(@"New employee OrderID: %lld - %@", employee.orderID, employee);
    [self.currentOrganization addEmployeeWithOrderId:employee];
    [[AppDelegate shared] saveContext];
    
    self.employees = self.currentOrganization.sortedEmployees;
    NSLog(@"Sorted array after additon: %@", self.employees);
    
    [self.tableView beginUpdates];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.employees indexOfObjectIdenticalTo:employee] inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
}

- (void)randomizeEmployeeOrder:(NSNotification *) notification
{
    [self updateEmployeeList];
    [self.tableView reloadData];
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
    if ([segue.identifier isEqualToString:@"showOrganizationInfo"])
    {
        OrganizationInfoViewController *infoController = segue.destinationViewController;
        infoController.currentOrganization = self.currentOrganization;
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
    cell.textLabel.text = [NSString stringWithFormat:@"%@",currentEmployee];
    
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
        
        self.employees = self.currentOrganization.sortedEmployees;
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void) updateEmployeeList
{
    self.employees = self.currentOrganization.sortedEmployees;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:self.organizationController.kEmployeesOrderHasChanged
 object:nil];
}

@end
