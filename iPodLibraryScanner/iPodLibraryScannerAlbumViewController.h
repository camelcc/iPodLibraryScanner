//
//  iPodLibraryScannerAlbumViewController.h
//  iPodLibraryScanner
//
//  Created by camel young on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface iPodLibraryScannerAlbumViewController : UITableViewController

@property (nonatomic, weak) MPMediaItemCollection *album;

@end
