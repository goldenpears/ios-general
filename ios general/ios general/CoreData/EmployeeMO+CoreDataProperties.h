//
//  EmployeeMO+CoreDataProperties.h
//  
//
//  Created by lokovna on 5/26/17.
//
//

#import "EmployeeMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface EmployeeMO (CoreDataProperties)

+ (NSFetchRequest<EmployeeMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *dateOfBirth;
@property (nullable, nonatomic, copy) NSString *firstName;
@property (nullable, nonatomic, copy) NSString *lastName;
@property (nonatomic) int64_t orderID;
@property (nonatomic) int16_t salary;
@property (nullable, nonatomic, retain) OrganizationMO *organization;

@end

NS_ASSUME_NONNULL_END
