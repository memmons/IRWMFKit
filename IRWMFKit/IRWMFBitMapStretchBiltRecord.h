//
//  IRWMFBitMapStretchBiltRecord.h
//  IRWMFKit
//
//  Created by Evadne Wu on 11/22/11.
//  Copyright (c) 2011 Iridia Productions. All rights reserved.
//

#import "IRWMFRecord.h"
#import "IRWMFObject.h"

@interface IRWMFBitMapStretchBiltRecord : IRWMFRecord <IRWMFRecordExporting>

@property (nonatomic, readonly, assign) int32_t rasterOperation;
@property (nonatomic, readonly, assign) int16_t sourceRectHeight;
@property (nonatomic, readonly, assign) int16_t sourceRectWidth;
@property (nonatomic, readonly, assign) int16_t sourceRectYOffset;
@property (nonatomic, readonly, assign) int16_t sourceRectXOffset;
@property (nonatomic, readonly, assign) int16_t destinationRectHeight;
@property (nonatomic, readonly, assign) int16_t destinationRectWidth;
@property (nonatomic, readonly, assign) int16_t destinationRectYOffset;
@property (nonatomic, readonly, assign) int16_t destinationRectXOffset;

@property (nonatomic, readonly, retain) IRWMFObject *bitmapObject;	//	may be nil if record does not embed stuff

@end
