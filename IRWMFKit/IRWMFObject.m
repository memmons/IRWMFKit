//
//  IRWMFObject.m
//  IRWMFKit
//
//  Created by Evadne Wu on 11/17/11.
//  Copyright (c) 2011 Iridia Productions. All rights reserved.
//

#import "IRWMFObject.h"

@implementation IRWMFObject
@synthesize record;

+ (id) objectUsingRecord:(IRWMFRecord *)aRecord withData:(NSData *)data offset:(NSUInteger)offsetBytes usedBytes:(NSUInteger *)numberOfConsumedBytes error:(NSError **)error {

	IRWMFObject *returnedObject = [[self alloc] init];
	[returnedObject setRecord:aRecord];
	[returnedObject configureWithData:data offset:offsetBytes usedBytes:numberOfConsumedBytes error:error];
	
	return returnedObject;	

}


+ (id) objectWithData:(NSData *)data offset:(NSUInteger)offsetBytes usedBytes:(NSUInteger *)numberOfConsumedBytes error:(NSError **)error {

	return [self objectUsingRecord:nil withData:data offset:offsetBytes usedBytes:numberOfConsumedBytes error:error];

}

- (void) configureWithData:(NSData *)data offset:(NSUInteger)offsetBytes usedBytes:(NSUInteger *)numberOfConsumedBytes error:(NSError **)error {

	//	nothing

}

@end
