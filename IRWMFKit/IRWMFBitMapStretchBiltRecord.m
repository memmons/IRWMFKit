//
//  IRWMFBitMapStretchBiltRecord.m
//  IRWMFKit
//
//  Created by Evadne Wu on 11/22/11.
//  Copyright (c) 2011 Iridia Productions. All rights reserved.
//

#import "IRWMFBitMapStretchBiltRecord.h"
#import "IRWMFExportSession.h"

#import "IRWMFBitmapObject.h"

#define BYTES_PER_WORD 2
#define BYTES_PER_DWORD 4

@implementation IRWMFBitMapStretchBiltRecord

@synthesize rasterOperation;
@synthesize sourceRectHeight, sourceRectWidth, sourceRectYOffset, sourceRectXOffset;
@synthesize destinationRectHeight, destinationRectWidth, destinationRectYOffset, destinationRectXOffset;
@synthesize bitmapObject;

- (void) dealloc {

	[bitmapObject release];
	[super dealloc];

}

- (void) configureWithData:(NSData *)data offset:(NSUInteger)offsetBytes usedBytes:(NSUInteger *)numberOfConsumedBytes error:(NSError **)error {

	[super configureWithData:data offset:offsetBytes usedBytes:numberOfConsumedBytes error:error];

	NSUInteger ownOffset = offsetBytes;
	const void *dataBytes = [data bytes];
	
	int32_t recordSize = OSReadLittleInt32(dataBytes, ownOffset) * BYTES_PER_WORD;
	ownOffset += 4;
	
	int16_t recordFunction = OSReadLittleInt16(dataBytes, ownOffset);
	ownOffset += 2;
	
	//	ummm	
	BOOL recordHasEmbeddedBitmap = (recordSize != ((recordFunction >> 8) + 3));
	
	if (recordHasEmbeddedBitmap) {
	
		rasterOperation = OSReadLittleInt32(dataBytes, ownOffset);
		ownOffset += 4;
				
		sourceRectHeight = OSReadLittleInt16(dataBytes, ownOffset);
		ownOffset += 2;
		
		sourceRectWidth = OSReadLittleInt16(dataBytes, ownOffset);
		ownOffset += 2;
		
		sourceRectYOffset = OSReadLittleInt16(dataBytes, ownOffset);
		ownOffset += 2;
		
		sourceRectXOffset = OSReadLittleInt16(dataBytes, ownOffset);
		ownOffset += 2;
		
		destinationRectHeight = OSReadLittleInt16(dataBytes, ownOffset);
		ownOffset += 2;
		
		destinationRectWidth = OSReadLittleInt16(dataBytes, ownOffset);
		ownOffset += 2;
		
		destinationRectYOffset = OSReadLittleInt16(dataBytes, ownOffset);
		ownOffset += 2;
		
		destinationRectXOffset = OSReadLittleInt16(dataBytes, ownOffset);
		ownOffset += 2;
		
		NSUInteger bitmapObjectSize = 0;
		NSError *bitmapDecodingError = nil;
		
		bitmapObject = [[IRWMFBitmapObject objectWithData:data offset:ownOffset usedBytes:&bitmapObjectSize error:&bitmapDecodingError] retain];
		
		NSParameterAssert(recordSize == ((ownOffset - offsetBytes) + bitmapObjectSize));
		
		if (!bitmapObject)
			NSLog(@"bitmap object decoding failed: %@", bitmapDecodingError);
	
	} else {
		
		sourceRectYOffset = OSReadLittleInt16(dataBytes, ownOffset);
		ownOffset += 2;
		
		sourceRectXOffset = OSReadLittleInt16(dataBytes, ownOffset);
		ownOffset += 2;
	
		//	RESERVED
		ownOffset += 2;
		
		destinationRectHeight = OSReadLittleInt16(dataBytes, ownOffset);
		ownOffset += 2;
		
		destinationRectWidth = OSReadLittleInt16(dataBytes, ownOffset);
		ownOffset += 2;
				
		destinationRectYOffset = OSReadLittleInt16(dataBytes, ownOffset);
		ownOffset += 2;
		
		destinationRectXOffset = OSReadLittleInt16(dataBytes, ownOffset);
		ownOffset += 2;
	
	}
	
	if (numberOfConsumedBytes)
		*numberOfConsumedBytes = recordSize;

}

- (NSString *) descriptionSubstring {

	return [[[super descriptionSubstring] stringByAppendingString:[NSString stringWithFormat:	
		@"; From Rect = { %f, %f; %f, %f }; To Rect = { %f, %f; %f, %f }; Bitmap = ",
		sourceRectXOffset, sourceRectYOffset, sourceRectWidth, sourceRectHeight,
		destinationRectXOffset, destinationRectYOffset, destinationRectWidth, destinationRectHeight
	]] stringByAppendingString:
		[bitmapObject debugDescription]];

}

+ (BOOL) canHandleRecordType:(IRWMFRecordType)aType {

	return (aType == IRWMFRecordType_META_DIBSTRETCHBLT);

}

- (void) configureSessionForExporting:(IRWMFExportSession *)aSession {

	CGContextRef context = aSession.context;
	CGImageRef drawnImage = self.bitmapObject.image;
	
	CGRect fromRect = (CGRect){
		sourceRectXOffset, sourceRectYOffset,
		sourceRectWidth, sourceRectHeight
	};
	
	CGRect toRect = (CGRect){
		destinationRectXOffset, destinationRectYOffset,
		destinationRectWidth, destinationRectHeight
	};
	
	if (!drawnImage)
		return;
	
	CGContextDrawImage(context, toRect, drawnImage);

}

@end
