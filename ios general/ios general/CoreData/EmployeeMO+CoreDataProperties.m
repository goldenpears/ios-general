//
//  EmployeeMO+CoreDataProperties.m
//  
//
//  Created by lokovna on 5/26/17.
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
@dynamic orderID;
@dynamic salary;
@dynamic organization;

@end
