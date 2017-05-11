#import "MainTableViewController.h"
#import "DetailViewController.h"
#import "CreateEmployeeViewController.h"
#import "Organization.h"

@interface MainTableViewController ()

@property (nonatomic, strong) NSArray<Employee *> *employees;
@property (nonatomic, weak) Employee *selectedEmployee;

@end

@implementation MainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
  
    Employee *employee1 = [[Employee alloc] initWithFirstName:@"Genady" lastName:@"Adolfovich" salary:100];
    Employee *employee2 = [[Employee alloc] initWithFirstName:@"Arnold" lastName:@"Hey" salary:7600];

    Organization *org = [[Organization alloc] initWithName:@"NextStep"];

    [org addEmployeeWithName:@"Someone Anyone"];
    [org addEmployeeWithName:@"NameWith Space"];
    [org addEmployeeWithName:@"NameWith1 Two Spaces"];
    [org addEmployeeWithName:@"NameWitoutSpace"];

    [org addEmployee:employee1];
    [org addEmployee:employee2];
    [org addEmployee:[[Employee alloc] initWithFirstName:@"Beda" lastName:@"Marfa" salary:400]];
    
    self.employees = org.allEmployees;
}

- (void)insertNewObject:(id)sender
{
    NSLog(@"Add button was pressed");
    CreateEmployeeViewController *createController = [[CreateEmployeeViewController alloc] init];
    createController.mainController = self;
//    [self pushViewController:createController animated:YES];
    [self performSegueWithIdentifier:@"AddNewEmployee" sender:self];
}

- (void)showNewEmployee:(Employee *)employee
{
    NSLog(@"SHOW NEW, %@", employee);
    if (!self.employees)
    {
        self.employees = [[NSArray<Employee *> alloc] init];
    }
    self.employees = [self.employees arrayByAddingObject:employee];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.employees.count - 1 inSection:0]; // add to the end of table
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
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
        createController.mainController = self;

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
