//
//  OrganizationMO+CoreDataProperties.h
//  
//
//  Created by lokovna on 5/26/17.
//
//

#import "OrganizationMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface OrganizationMO (CoreDataProperties)

+ (NSFetchRequest<OrganizationMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<EmployeeMO *> *employees;

@end

@interface OrganizationMO (CoreDataGeneratedAccessors)

- (void)addEmployeesObject:(EmployeeMO *)value;
- (void)removeEmployeesObject:(EmployeeMO *)value;
- (void)addEmployees:(NSSet<EmployeeMO *> *)values;
- (void)removeEmployees:(NSSet<EmployeeMO *> *)values;

@end

NS_ASSUME_NONNULL_END
