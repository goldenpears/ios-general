//
//  OrganizationMO+CoreDataProperties.h
//  ios general
//
//  Created by lokovna on 5/17/17.
//  Copyright © 2017 Darina Locovna. All rights reserved.
//

#import "OrganizationMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface OrganizationMO (CoreDataProperties)

+ (NSFetchRequest<OrganizationMO *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSObject *name;
@property (nullable, nonatomic, retain) NSSet<EmployeeMO *> *employees;

@end

@interface OrganizationMO (CoreDataGeneratedAccessors)

- (void)addEmployeesObject:(EmployeeMO *)value;
- (void)removeEmployeesObject:(EmployeeMO *)value;
- (void)addEmployees:(NSSet<EmployeeMO *> *)values;
- (void)removeEmployees:(NSSet<EmployeeMO *> *)values;

@end

NS_ASSUME_NONNULL_END
