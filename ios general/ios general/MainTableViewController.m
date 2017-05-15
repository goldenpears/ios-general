#import "MainTableViewController.h"
#import "DetailViewController.h"
#import "CreateEmployeeViewController.h"
#import "Organization.h"

@interface MainTableViewController ()<AddControllerDelegate>

@property (nonatomic, strong) NSArray<Employee *> *employees;
@property (nonatomic, weak) Employee *selectedEmployee;

@end

@implementation MainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    NSLog(@"All employess: %@", self.employees);
}

- (void)insertNewObject:(id)sender
{
    NSLog(@"Add button was pressed");
    [self performSegueWithIdentifier:@"AddNewEmployee" sender:self];
}

- (void)showNewEmployee:(Employee *)employee
{
    NSLog(@"Show new employee: %@", employee);
    if (!self.employees)
    {
        self.employees = [[NSArray<Employee *> alloc] init];
    }
    [self.tableView beginUpdates];
    self.employees = [self.employees arrayByAddingObject:employee];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.employees.count - 1 inSection:0]; // add to the end of table
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
    NSLog(@"All employess after add one: %@", self.employees);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
        DetailViewController *destViewController = segue.destinationViewController;
        destViewController.employee = self.selectedEmployee;
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
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.employees objectAtIndex:indexPath.row]];
    
    return cell;
}

@end
