//
//  MandalaView.m
//  Mandala
//
//  Created by Stefan Hintz on 24.12.12.
//  Copyright (c) 2012 Stefan Hintz. All rights reserved.

#import "MandalaView.h"

#define LINE_WIDTH (3)

@implementation MandalaView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
	{
        [self update:nil];
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	// Background
//	NSBezierPath *bezierPath = [NSBezierPath bezierPathWithRect:dirtyRect];
//	[[NSColor whiteColor] set];
//	[bezierPath fill];
	
	// Lines
	NSPoint center = NSMakePoint(self.frame.size.width * 0.5, self.frame.size.height * 0.5);

	CGFloat delta = 2.0 * M_PI / self.polygonCount;
	CGFloat delta2 = 2.0 * M_PI / self.edgeCount;

	CGFloat radius = MIN(self.frame.size.width, self.frame.size.height) * 0.5 * sin(delta2 * 0.5) - LINE_WIDTH;
	
	NSBezierPath *bezierPath = [NSBezierPath bezierPath];

	for (NSInteger index = 0; index < self.polygonCount; index++)
	{
		CGFloat angle = delta * index;
		NSPoint point = center;
		
		[bezierPath moveToPoint:point];
		
		for (NSInteger index2 = 0; index2 < self.edgeCount-1; index2++)
		{
			CGFloat angle2 = delta2 * index2;

			point = NSMakePoint(point.x + cos(angle + angle2) * radius, point.y + sin(angle + angle2) * radius);
			[bezierPath lineToPoint:point];
		}
		
		[bezierPath closePath];
	}
	
	[[NSColor whiteColor] set];
	[bezierPath fill];

	[[NSColor blackColor] set];
	bezierPath.lineWidth = LINE_WIDTH;
	[bezierPath stroke];
}

- (IBAction)update:(id)sender
{
	self.polygonCount = [[NSUserDefaults standardUserDefaults] integerForKey:@"polygonCount"];
	self.edgeCount = [[NSUserDefaults standardUserDefaults] integerForKey:@"edgeCcount"];
	
	[self setNeedsDisplay:YES];
}


@end
