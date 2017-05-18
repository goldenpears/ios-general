//
//  OrganizationMO+CoreDataProperties.m
//  ios general
//
//  Created by lokovna on 5/17/17.
//  Copyright © 2017 Darina Locovna. All rights reserved.
//

#import "OrganizationMO+CoreDataProperties.h"

@implementation OrganizationMO (CoreDataProperties)

+ (NSFetchRequest<OrganizationMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Organization"];
}

@dynamic name;
@dynamic employees;

@end
