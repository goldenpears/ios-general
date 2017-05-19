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
//@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation MainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSManagedObjectContext *context = [AppDelegate shared].managedObjectContext; //Retrieve the main queue NSManagedObjectContext
//
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Organization"];
//    NSSortDescriptor *nameSort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
//    [request setSortDescriptors:@[nameSort]];
//    NSArray *objects = [context executeFetchRequest:request error:nil];
//    self.currentOrganization = [objects objectAtIndex:0];
//    NSLog(@"Fetch request result?: %@", objects);
    
    if (!self.currentOrganization)
    {
        self.currentOrganization = [NSEntityDescription insertNewObjectForEntityForName:@"Organization" inManagedObjectContext:context];
        self.currentOrganization.name = @"Default Organization X";
        NSLog(@"Current org: %@", self.currentOrganization);
        NSLog(@"Current org name: %@", self.currentOrganization.name);
    }
    
    self.title = [NSString stringWithFormat:@"%@", self.currentOrganization.name ];
    NSLog(@"Current org 2: %@", self.currentOrganization);
    NSLog(@"Current org name 2: %@", self.currentOrganization.name);
    
    NSLog(@"All employess at Organization: %@", self.currentOrganization.employees);
    NSLog(@"All employess as Array: %@", self.employees);
    
//    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:YES]];
//    self.employees = [self.currentOrganization.employees sortedArrayUsingDescriptors:sortDescriptors];
    
//    NSURL *appSupportURL = [[[NSFileManager defaultManager] URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject];
//    NSLog(@"Directory: %@",   [appSupportURL URLByAppendingPathComponent:@"locovna.com.ios-general"]);
//    [context save:nil];
}

- (IBAction)addButtonTapped:(UIBarButtonItem *)sender
{
    NSLog(@"Add button was tapped");
    [self performSegueWithIdentifier:@"AddNewEmployee" sender:self];

}

- (void)addNewEmployee:(EmployeeMO *)employee
{
    
    NSManagedObjectContext *context = [AppDelegate shared].managedObjectContext;
    if (!self.currentOrganization)
    {
        self.currentOrganization = [NSEntityDescription insertNewObjectForEntityForName:@"Organization" inManagedObjectContext:context];
        self.currentOrganization.name = @"Default Organization Y";
        NSLog(@"Current org: %@", self.currentOrganization);
        NSLog(@"Current org name: %@", self.currentOrganization.name);
    }
    
//    [self.tableView beginUpdates];
     NSLog(@"Adding employee to: %@", self.currentOrganization);
    [self.currentOrganization addEmployeesObject:employee];
//    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:YES]];
//    self.employees = [self.currentOrganization.employees.allObjects sortedArrayUsingDescriptors:sortDescriptors];
    // TODO: sort from DB
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.employees.count - 1 inSection:0]; //DELETE
    // TODO: get index from new array
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic]; // REWRITE
//    [self.tableView endUpdates];
    NSLog(@"All employess in Org: %@", self.currentOrganization.employees);
//    NSError *error = nil;
//    if ([context save:&error] == NO)
//    {
//        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
//    }
   
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
