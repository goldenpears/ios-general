//
//  EmployeeMO+CoreDataProperties.m
//  ios general
//
//  Created by lokovna on 5/17/17.
//  Copyright © 2017 Darina Locovna. All rights reserved.
//

#import "EmployeeMO+CoreDataProperties.h"

@implementation EmployeeMO (CoreDataProperties)

+ (NSFetchRequest<EmployeeMO *> *)fetchRequest
{
	return [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
}

@dynamic firstName;
@dynamic lastName;
@dynamic salary;
@dynamic organization;

@end
