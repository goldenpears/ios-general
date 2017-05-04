#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property(nonatomic,assign) int salary;
@property(nonatomic,assign) NSString *fullName;

- (instancetype)initWithFirstName: (NSString *) name
                         lastName: (NSString *) lastname
                           salary: (int) salary;
@end
