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
    NSString *Username;
    NSString *Password;
}
@property(nonatomic, retain)NSString *UserName;
@property(nonatomic, retain)NSString *Password;
+(LoginDataClass *)getInstance;
@end
