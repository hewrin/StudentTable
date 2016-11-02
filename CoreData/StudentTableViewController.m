//
//  StudentTableViewController.m
//  CoreData
//
//  Created by Faris Roslan on 2/11/2016.
//  Copyright © 2016 Faris Roslan. All rights reserved.
//

#import "StudentTableViewController.h"
#import "AppDelegate.h"
#import "Student+CoreDataClass.h"
@interface StudentTableViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property NSArray *students;
@property NSManagedObjectContext *moc;
@property NSPersistentContainer *pc;
@end

@implementation StudentTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.moc =  [appDelegate persistentContainer].viewContext;

}



-(void)storeStudent {
    NSString *inputString = self.textField.text;
 
    Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:self.moc];
    student.name = inputString;
    student.age = arc4random_uniform(100);
    NSError *error;
    if ([self.moc save:&error]) {
        [self loadStudents];
        [self.view resignFirstResponder];
    } else {
        NSLog(@"%@", error);
    }
}

-(void)loadStudents {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Student"];
    NSError *error;
    self.students = [[self.moc executeFetchRequest:request error:&error] mutableCopy];
     [self.tableView reloadData];
}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.students.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Student *student = self.students[indexPath.row];
    cell.textLabel.text = student.name;
    return cell;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self storeStudent];
    [self.view resignFirstResponder];
    return YES;
}

@end
