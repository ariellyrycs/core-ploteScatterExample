//
//  ViewController.m
//  creatingPlots
//
//  Created by Ariel Robles on 3/3/15.
//  Copyright (c) 2015 Ariel Robles. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
    {
        [super viewDidLoad];
        
        // We need a hostview, you can create one in IB (and create an outlet) or just do this:
        CPTGraphHostingView* hostView = [[CPTGraphHostingView alloc] initWithFrame:self.view.frame];
        [self.view addSubview: hostView];
        
        // Create a CPTGraph object and add to hostView
        CPTGraph* graph = [[CPTXYGraph alloc] initWithFrame:hostView.bounds];
        hostView.hostedGraph = graph;
        
        // Get the (default) plotspace from the graph so we can set its x/y ranges
        CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *) graph.defaultPlotSpace;
        
        // Note that these CPTPlotRange are defined by START and LENGTH (not START and END) !!
        [plotSpace setYRange: [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat( 0 ) length:CPTDecimalFromFloat( 16 )]];
        [plotSpace setXRange: [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat( -4 ) length:CPTDecimalFromFloat( 8 )]];
        
        // Create the plot (we do not define actual x/y values yet, these will be supplied by the datasource...)
        CPTScatterPlot* plot = [[CPTScatterPlot alloc] initWithFrame:CGRectZero];
        
        // Let's keep it simple and let this class act as datasource (therefore we implemtn <CPTPlotDataSource>)
        plot.dataSource = self;
        
        // Finally, add the created plot to the default plot space of the CPTGraph object we created before
        [graph addPlot:plot toPlotSpace:graph.defaultPlotSpace];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

    -(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plotnumberOfRecords {
        return 9; // Our sample graph contains 9 'points'
    }
    
    // This method is here because this class also functions as datasource for our graph
    // Therefore this class implements the CPTPlotDataSource protocol
    -(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index
    {
        // We need to provide an X or Y (this method will be called for each) value for every index
        int x = index - 4;
        
        // This method is actually called twice per point in the plot, one for the X and one for the Y value
        if(fieldEnum == CPTScatterPlotFieldX)
        {
            // Return x value, which will, depending on index, be between -4 to 4
            return [NSNumber numberWithInt: x];
        } else {
            // Return y value, for this example we'll be plotting y = x * x
            return [NSNumber numberWithInt: x * x];
        }
    }
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
