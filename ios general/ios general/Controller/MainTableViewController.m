#import "MainTableViewController.h"
#import "DetailViewController.h"
#import "CreateEmployeeViewController.h"
#import "EmployeeMO+Custom.h"
#import "OrganizationMO+CoreDataClass.h"
#import "AppDelegate.h"

@interface MainTableViewController () <AddControllerDelegate>

@property (nonatomic, strong) NSArray<EmployeeMO *> *employees;
@property (nonatomic, weak) EmployeeMO *selectedEmployee;
@property (nonatomic, weak) OrganizationMO *currentOrganization;

@end

@implementation MainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)addButtonTapped:(UIBarButtonItem *)sender
{
    NSLog(@"Add button was tapped");
    [self performSegueWithIdentifier:@"AddNewEmployee" sender:self];

}

- (void)addNewEmployee:(EmployeeMO *)employee
{
    NSLog(@"New employ at MainTable: %@", employee);
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
//    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.employees objectAtIndex:indexPath.row]];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",currentEmployee.firstName, currentEmployee.lastName];
    
    return cell;
}

@end
