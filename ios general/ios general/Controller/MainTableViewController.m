#import "MainTableViewController.h"
#import "DetailViewController.h"
#import "CreateEmployeeViewController.h"
#import "EmployeeMO+Custom.h"
#import "OrganizationMO+CoreDataClass.h"

@interface MainTableViewController () <AddControllerDelegate>

@property (nonatomic, strong) NSArray<EmployeeMO *> *employees;
@property (nonatomic, weak) EmployeeMO *selectedEmployee;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation MainTableViewController

//- (void)initializeFetchedResultsController
//{
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Organization"];
//    
////    NSSortDescriptor *lastNameSort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
//    
////    [request setSortDescriptors:@[lastNameSort]];
//    
////    NSManagedObjectContext *moc = …; //Retrieve the main queue NSManagedObjectContext
////    
////    [self setFetchedResultsController:[[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:moc sectionNameKeyPath:nil cacheName:nil]];
////    [[self fetchedResultsController] setDelegate:self];
//    
//    NSError *error = nil;
//    if (![[self fetchedResultsController] performFetch:&error]) {
//        NSLog(@"Failed to initialize FetchedResultsController: %@\n%@", [error localizedDescription], [error userInfo]);
//        abort();
//    }
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"All employess: %@", self.employees);
}

- (IBAction)addButtonTapped:(UIBarButtonItem *)sender
{
    NSLog(@"Add button was tapped");
    [self performSegueWithIdentifier:@"AddNewEmployee" sender:self];

}

- (void)addNewEmployee:(EmployeeMO *)employee
{
    if (!self.employees)
    {
        self.employees = [[NSArray<EmployeeMO *> alloc] init];
    }
    [self.tableView beginUpdates];
    self.employees = [self.employees arrayByAddingObject:employee];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.employees.count - 1 inSection:0]; // add to the end of table
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
    
    NSLog(@"Add new employee: %@", employee);
    NSLog(@"All employess after add one: %@", self.employees);
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
