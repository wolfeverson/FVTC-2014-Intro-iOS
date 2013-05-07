//
//  LoginDataClass.m
//  PIzzaMan
//
//  Created by student on 4/22/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import "LoginDataClass.h"
/*
 
 DataClass will be used to hold on to login data and make it available to all forms for later json interation.
 
 Stolen from 
 http://stackoverflow.com/questions/6065965/how-to-define-a-global-variable-that-can-be-accessed-anywhere-in-my-application
 
 
 To call in other views
 DataClass *obj=[DataClass getInstance];
 obj.str= @"I am Global variable";
 */

@implementation LoginDataClass
@synthesize UserName,Password,First,Last,Email,Phone,Address,City,State,Zip;



static LoginDataClass *instance =nil;
+(LoginDataClass *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance = [LoginDataClass new];
        }
    }
    return instance;
}
@end
