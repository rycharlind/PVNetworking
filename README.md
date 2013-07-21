Parse Video Networking Library
============

PVNetworking is an easy to use networking library for iOS.  It's built on top of the Parse framework and is used for
integrating videos from Parse.com into your app.  

It has a well designed modular architecture that utlizes asyncronous web requests and file caching methods.  By harnessing
iOS Category classes, it allows apps to efficiently display videos from the web inside an AVPlayer object.

```objective-c
[cell.avPlayer setVideoWithObject:object forFieldName:@"video"];
```

## Dependent Frameworks
PVNetworking is dependent on the Parse Framework.  You must incldue this framework into your project before using the library.
You can download the Parse framework from the following link:  https://www.parse.com/apps/quickstart

## Add to your Project
Simply download the zip file and drag and drop the PVNetworking directory into your project.  Next make sure that the 
implemantation files have been added to your Compile Sources.  To do this, select your proect file, select your Target, 
go into Build Phases, and expand the Compile Sources section.  If you do not see the PVNetworking (.m) files, click the 
plus button to add them.

Once you have the library added, simply add the AVPlayer+PVNetworking.h file to the view controller you will be displaying
videos in.  

```objective-c
#import AVPlayer+PVNetworking.h
```

## Example Usage
This example will show you how to add videos to an AVPlayer object within a UITableViewController.  

First step is to query your objects from Parse and set them in an NSArray.  To do this you will want to add the 
PVNetworkingDelegate protocol to your UITableViewController.

```objective-c
@interface MyTableViewController : UITableViewController <PVNetworkingDelegate>
```

Then implement the protocol method in your UITableViewController implementation file. 

```objective-c
- (void) queryCompleteWithResult:(NSArray*)result error:(NSError*)error {

  if(!error) {
  
    self.objects = result;

  }
  
}
```

Next initialize a PVNetworking object inside the viewDidLoad method, set the delegate to self, and query your videos
from Parse.

```objective-c
PVNetworking *pvn = [[PVNetworking alloc] init];
pvn.delegate = self;
[pvn queryVideosWithClassName:@"Video"];
```

Finally, call the Category method on your AVPlayer object inside the UITableViewController cellForRow method.  This method
takes two parameters:  
  - videoWithObject - The object (or row) returned from your Parse query.
  - fieldName - The field name that contains the video file in the Parse table.

```objective-c
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; 
  if (cell == nil) {
     cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }

  PFObject *object = [self.objects objectAtIndex:indexPath.row];

  [cell.avPlayer setVideoWithObject:object forFieldName:@"video"];

}
```



