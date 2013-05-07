//
//  LoginDataClass.h
//  PIzzaMan
//
//  Created by student on 4/22/13.
//  Copyright (c) 2013 edu.fvtc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginDataClass : NSObject
{
    NSString *UserName;
    NSString *Password;
    NSString *First;
    NSString *Last;
    NSString *Email;
    NSString *Phone;
    NSString *Address;
    NSString *City;
    NSString *State;
    NSString *Zip;
}
@property(nonatomic, retain)NSString *UserName;
@property(nonatomic, retain)NSString *Password;
@property(nonatomic, retain)NSString *First;
@property(nonatomic, retain)NSString *Last;
@property(nonatomic, retain)NSString *Email;
@property(nonatomic, retain)NSString *Phone;
@property(nonatomic, retain)NSString *Address;
@property(nonatomic, retain)NSString *City;
@property(nonatomic, retain)NSString *State;
@property(nonatomic, retain)NSString *Zip;
+(LoginDataClass *)getInstance;
@end
