//
//  MandalaView.h
//  Mandala
//
//  Created by Stefan Hintz on 24.12.12.
//  Copyright (c) 2012 Stefan Hintz. All rights reserved.

@interface MandalaView : NSView

@property (nonatomic, assign) NSInteger polygonCount;
@property (nonatomic, assign) NSInteger edgeCount;

- (IBAction)update:(id)sender;

@end
