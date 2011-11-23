//
//  IRWMFRecordType.h
//  IRWMFKit
//
//  Created by Evadne Wu on 11/20/11.
//  Copyright (c) 2011 Iridia Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSString * IRWMFRecordTypeNames[];

typedef enum {

	IRWMFRecordHeaderType = 0xFF00,
	IRWMFRecordUnknownType = 0xFFFF,
	
	IRWMFRecordType_META_EOF = 0x0000,
	IRWMFRecordType_META_REALIZEPALETTE = 0x0035,
	IRWMFRecordType_META_SETPALENTRIES = 0x0037,
	IRWMFRecordType_META_SETBKMODE = 0x0102,
	IRWMFRecordType_META_SETMAPMODE = 0x0103,
	IRWMFRecordType_META_SETROP2 = 0x0104,
	IRWMFRecordType_META_SETRELABS = 0x0105,
	IRWMFRecordType_META_SETPOLYFILLMODE = 0x0106,
	IRWMFRecordType_META_SETSTRETCHBLTMODE = 0x0107,
	IRWMFRecordType_META_SETTEXTCHAREXTRA = 0x0108,
	IRWMFRecordType_META_RESTOREDC = 0x0127,
	IRWMFRecordType_META_RESIZEPALETTE = 0x0139,
	IRWMFRecordType_META_DIBCREATEPATTERNBRUSH = 0x0142,
	IRWMFRecordType_META_SETLAYOUT = 0x0149,
	IRWMFRecordType_META_SETBKCOLOR = 0x0201,
	IRWMFRecordType_META_SETTEXTCOLOR = 0x0209,
	IRWMFRecordType_META_OFFSETVIEWPORTORG = 0x0211,
	IRWMFRecordType_META_LINETO = 0x0213,
	IRWMFRecordType_META_MOVETO = 0x0214,
	IRWMFRecordType_META_OFFSETCLIPRGN = 0x0220,
	IRWMFRecordType_META_FILLREGION = 0x0228,
	IRWMFRecordType_META_SETMAPPERFLAGS = 0x0231,
	IRWMFRecordType_META_SELECTPALETTE = 0x0234,
	IRWMFRecordType_META_POLYGON = 0x0324,
	IRWMFRecordType_META_POLYLINE = 0x0325,
	IRWMFRecordType_META_SETTEXTJUSTIFICATION = 0x020A,
	IRWMFRecordType_META_SETWINDOWORG = 0x020B,
	IRWMFRecordType_META_SETWINDOWEXT = 0x020C,
	IRWMFRecordType_META_SETVIEWPORTORG = 0x020D,
	IRWMFRecordType_META_SETVIEWPORTEXT = 0x020E,
	IRWMFRecordType_META_OFFSETWINDOWORG = 0x020F,
	IRWMFRecordType_META_SCALEWINDOWEXT = 0x0410,
	IRWMFRecordType_META_SCALEVIEWPORTEXT = 0x0412,
	IRWMFRecordType_META_EXCLUDECLIPRECT = 0x0415,
	IRWMFRecordType_META_INTERSECTCLIPRECT = 0x0416,
	IRWMFRecordType_META_ELLIPSE = 0x0418,
	IRWMFRecordType_META_FLOODFILL = 0x0419,
	IRWMFRecordType_META_FRAMEREGION = 0x0429,
	IRWMFRecordType_META_ANIMATEPALETTE = 0x0436,
	IRWMFRecordType_META_TEXTOUT = 0x0521,
	IRWMFRecordType_META_POLYPOLYGON = 0x0538,
	IRWMFRecordType_META_EXTFLOODFILL = 0x0548,
	IRWMFRecordType_META_RECTANGLE = 0x041B,
	IRWMFRecordType_META_SETPIXEL = 0x041F,
	IRWMFRecordType_META_ROUNDRECT = 0x061C,
	IRWMFRecordType_META_PATBLT = 0x061D,
	IRWMFRecordType_META_SAVEDC = 0x001E,
	IRWMFRecordType_META_PIE = 0x081A,
	IRWMFRecordType_META_STRETCHBLT = 0x0B23,
	IRWMFRecordType_META_ESCAPE = 0x0626,
	IRWMFRecordType_META_INVERTREGION = 0x012A,
	IRWMFRecordType_META_PAINTREGION = 0x012B,
	IRWMFRecordType_META_SELECTCLIPREGION = 0x012C,
	IRWMFRecordType_META_SELECTOBJECT = 0x012D,
	IRWMFRecordType_META_SETTEXTALIGN = 0x012E,
	IRWMFRecordType_META_ARC = 0x0817,
	IRWMFRecordType_META_CHORD = 0x0830,
	IRWMFRecordType_META_BITBLT = 0x0922,
	IRWMFRecordType_META_EXTTEXTOUT = 0x0a32,
	IRWMFRecordType_META_SETDIBTODEV = 0x0d33,
	IRWMFRecordType_META_DIBBITBLT = 0x0940,
	IRWMFRecordType_META_DIBSTRETCHBLT = 0x0b41,
	IRWMFRecordType_META_STRETCHDIB = 0x0f43,
	IRWMFRecordType_META_DELETEOBJECT = 0x01f0,
	IRWMFRecordType_META_CREATEPALETTE = 0x00f7,
	IRWMFRecordType_META_CREATEPATTERNBRUSH = 0x01F9,
	IRWMFRecordType_META_CREATEPENINDIRECT = 0x02FA,
	IRWMFRecordType_META_CREATEFONTINDIRECT = 0x02FB,
	IRWMFRecordType_META_CREATEBRUSHINDIRECT = 0x02FC,
	IRWMFRecordType_META_CREATEREGION = 0x06FF,
	
} IRWMFRecordType;
