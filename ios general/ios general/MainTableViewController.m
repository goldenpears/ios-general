//
//  MainTableViewController.m
//  ios general
//
//  Created by Darina Lokovna on 5/10/17.
//  Copyright © 2017 Darina Locovna. All rights reserved.
//

#import "MainTableViewController.h"
#import "DetailViewController.h"
#import "Organization.h"

@interface MainTableViewController ()

@property (nonatomic, strong) NSArray<Employee *> *employees;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    self.employees = [org getAllEmployees];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.employees.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.employees objectAtIndex:indexPath.row]];
    


    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld", indexPath.row); // you can see selected row number in your console;
    
    DetailViewController *detailContriller = [[DetailViewController alloc] init];
    detailContriller.employee = [self.employees objectAtIndex:indexPath.row];

    NSLog(@"Current Employee: %@", detailContriller.employee);
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
