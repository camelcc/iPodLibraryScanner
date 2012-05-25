//
//  iPodLibraryScannerViewController.h
//  iPodLibraryScanner
//
//  Created by camel young on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iPodLibraryScannerViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *albumList;

@property (nonatomic, strong) NSArray *libraryAlbums;

@end
