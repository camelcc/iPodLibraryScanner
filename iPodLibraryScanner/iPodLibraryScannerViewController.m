//
//  iPodLibraryScannerViewController.m
//  iPodLibraryScanner
//
//  Created by camel young on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "iPodLibraryScannerViewController.h"
#import "iPodLibraryScannerAlbumViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface iPodLibraryScannerViewController ()

@end

@implementation iPodLibraryScannerViewController
@synthesize albumList = _albumList;
@synthesize libraryAlbums = _libraryAlbums;

- (void)viewDidLoad
{
    [super viewDidLoad];
    MPMediaQuery *albums = [MPMediaQuery albumsQuery];
    self.libraryAlbums = [albums collections];
}

- (void)viewDidUnload
{
    [self setAlbumList:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - album table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.libraryAlbums count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cell_identifier = @"AlbumCell";
    UITableViewCell *album_cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cell_identifier];
    if (album_cell == nil) {
        album_cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cell_identifier];
    }
    
    MPMediaItemCollection *album_node = [self.libraryAlbums objectAtIndex:indexPath.row];
    album_cell.textLabel.text = [[album_node representativeItem] valueForProperty:MPMediaItemPropertyAlbumTitle];
    
    [self.albumList deselectRowAtIndexPath:indexPath animated:YES];
    
    return album_cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.albumList deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowAlbumDetail"]) {
        iPodLibraryScannerAlbumViewController *album_viewer = [segue destinationViewController];
        album_viewer.album = [self.libraryAlbums objectAtIndex:[self.albumList indexPathForSelectedRow].row];
    }
}

@end
