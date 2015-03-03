//
//  ScatterViewController.h
//  creatingPlots
//
//  Created by Ariel Robles on 3/3/15.
//  Copyright (c) 2015 Ariel Robles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "CorePlot-CocoaTouch.h"

extern NSString * const CPDTickerSymbolAAPL;


@interface CPDScatterPlotViewController : UIViewController <CPTPlotDataSource>

@property (nonatomic, strong) CPTGraphHostingView *hostView;

@end
