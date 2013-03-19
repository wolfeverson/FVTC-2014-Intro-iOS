//
//  ContactItem.h
//  Context
//
//  Created by student on 3/18/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactItem : NSObject <NSCoding>

@property (nonatomic, retain) NSString *FirstName;
@property (nonatomic, retain) NSString *LastName;


-(id) initWithFirstName:(NSString *)FName withLastName: (NSString *) LName;
+(ContactItem *) RandomContact;

@end
