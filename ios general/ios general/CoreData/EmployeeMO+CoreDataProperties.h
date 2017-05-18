//
//  EmployeeMO+CoreDataProperties.h
//  ios general
//
//  Created by lokovna on 5/17/17.
//  Copyright © 2017 Darina Locovna. All rights reserved.
//

#import "EmployeeMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface EmployeeMO (CoreDataProperties)

+ (NSFetchRequest<EmployeeMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *firstName;
@property (nullable, nonatomic, copy) NSString *lastName;
@property (nonatomic) int16_t salary;
@property (nullable, nonatomic, retain) OrganizationMO *organization;

@end

NS_ASSUME_NONNULL_END
