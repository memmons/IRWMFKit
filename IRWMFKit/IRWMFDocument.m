//
//  IRWMFDocument.m
//  IRWMFKit
//
//  Created by Evadne Wu on 11/14/11.
//  Copyright (c) 2011 Iridia Productions. All rights reserved.
//

#import "IRWMFDocument.h"
#import "IRWMFObject.h"
#import "IRWMFRecord.h"
#import "IRWMFDecoding.h"

@interface IRWMFDocument ()
@property (nonatomic, readwrite, strong) NSData *data;
@property (nonatomic, readwrite, strong) NSArray *wmfObjects;
@property (nonatomic, readwrite, strong) NSArray *wmfRecords;
@end

@implementation IRWMFDocument
@synthesize data, wmfObjects, wmfRecords;

+ (id) documentWithData:(NSData *)data {

	return [[self alloc] initWithData:data];

}

- (id) initWithData:(NSData *)inData {

	self = [super init];
	if (!self)
		return nil;
	
	self.data = inData;
	
	return self;

}


- (NSArray *) wmfRecords {

	if (wmfRecords)
		return wmfRecords;

	NSData *capturedData = self.data;
	if (!capturedData)
		return nil;
	
	NSMutableArray *records = [NSMutableArray array];
	
	NSUInteger totalBytes = [capturedData length];
	NSUInteger consumedBytes = 0;
	NSUInteger lastRecordLength = 0;
	NSError *decodingError = nil;
	
	do {
	
		lastRecordLength = 0;
		
		IRWMFRecord *decodedRecord = [IRWMFRecord objectWithData:capturedData offset:consumedBytes usedBytes:&lastRecordLength error:&decodingError];
		
		if (decodedRecord)
			[records addObject:decodedRecord];
		
		consumedBytes += lastRecordLength;
	
	} while ((consumedBytes < totalBytes) && lastRecordLength && !decodingError);
	
	if (decodingError) {
		NSLog(@"Error decoding: %@", decodingError);
		return nil;
	}
	
	self.wmfRecords = [records copy];
	return wmfRecords;

}

@end
