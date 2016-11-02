//
//  Student+CoreDataProperties.h
//  CoreData
//
//  Created by Faris Roslan on 2/11/2016.
//  Copyright © 2016 Faris Roslan. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Student+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t age;

@end

NS_ASSUME_NONNULL_END
