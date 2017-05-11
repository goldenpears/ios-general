#import "CreateEmployeeViewController.h"

@interface CreateEmployeeViewController ()

@end

@implementation CreateEmployeeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Add new Employee";
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveNewObject:)];
    self.navigationItem.rightBarButtonItem = saveButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveNewObject:(id)sender
{
    NSLog(@"Save button was pressed");
    Employee *employee = [[Employee alloc] initWithFirstName:@"Saved" lastName:@"Employee" salary:arc4random_uniform(4000)];
    
    [self.mainController showNewEmployee:employee];
    NSLog(@"Link to controller: %@", self.mainController);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
