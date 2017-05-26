//
//  OrganizationMO+CoreDataProperties.m
//  
//
//  Created by lokovna on 5/26/17.
//
//

#import "OrganizationMO+CoreDataProperties.h"

@implementation OrganizationMO (CoreDataProperties)

+ (NSFetchRequest<OrganizationMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Organization"];
}

@dynamic name;
@dynamic employees;

@end
