//
//  AppDelegate.m
//  ios general
//
//  Created by Darina Lokovna on 5/4/17.
//  Copyright © 2017 Darina Locovna. All rights reserved.
//

#import "AppDelegate.h"
#import "Employee.h"
#import "Organization.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    Employee *employee = [[Employee alloc] initWithFirstName:@"Genady" lastName:@"Adolfovich" salary:100];
    
    Organization *org = [[Organization alloc] initWithName:@"NextStep"];
    
    [org addEmployeeWithName:@"Someone Anyone"];
    [org addEmployeeWithName:@"NameWith Space"];
    [org addEmployeeWithName:@"NameWith1 Two Spaces"];
    [org addEmployeeWithName:@"NameWitoutSpace"];
    
    [org addEmployee:employee];
    [org addEmployee:[[Employee alloc]initWithFirstName:@"Beda" lastName:@"Marfa" salary:400]];
    [org calculateAverageSalary];
    [org employeeWithLowestSalary];
    [org employeesWithSalary:100 tolerance:50];
    
    //    [org removeEmployee:employee];
    //    [org removeEmployee:[[Employee alloc]initWithFirstName: @"No" lastName: @"One" salary: 0]];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
