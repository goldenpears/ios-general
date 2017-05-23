//
//  EmployeeMO+CoreDataProperties.m
//  
//
//  Created by lokovna on 5/23/17.
//
//

#import "EmployeeMO+CoreDataProperties.h"

@implementation EmployeeMO (CoreDataProperties)

+ (NSFetchRequest<EmployeeMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
}

@dynamic dateOfBirth;
@dynamic firstName;
@dynamic lastName;
@dynamic salary;
@dynamic organization;

@end
