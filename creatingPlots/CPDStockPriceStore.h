//
//  CPDStockPriceStore.h
//  creatingPlots
//
//  Created by Ariel Robles on 3/3/15.
//  Copyright (c) 2015 Ariel Robles. All rights reserved.
//
#include <UIKit/UIKit.h>

@class CPDStockPriceStore;

@interface CPDStockPriceStore : NSObject

+ (CPDStockPriceStore *)sharedInstance;

- (NSArray *)tickerSymbols;

- (NSArray *)dailyPortfolioPrices;

- (NSArray *)datesInWeek;
- (NSArray *)weeklyPrices:(NSString *)tickerSymbol;

- (NSArray *)datesInMonth;
- (NSArray *)monthlyPrices:(NSString *)tickerSymbol;

@end