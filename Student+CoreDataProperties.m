//
//  Student+CoreDataProperties.m
//  CoreData
//
//  Created by Faris Roslan on 2/11/2016.
//  Copyright © 2016 Faris Roslan. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Student"];
}

@dynamic name;
@dynamic age;

@end
