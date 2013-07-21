Parse Video Networking Library
============

PVNetworking is an easy to use networking library for iOS.  It's built on top of the Parse framework and is used for
integrating videos from Parse.com into your app.  

PVNetworking has a well designed modular architecture that utlizes iOS Category classes easily allowing you to add videos
to an AVPlayer object in one line of code.  

```objective-c
[cell.avPlayer setVideoWithObject:object forFieldName:@"video"];
```

## Dependent Frameworks
PVNetworking is dependent on the Parse Framework.  You must incldue this into your project before using this library.
You can download the Parse framework from the following link:  https://www.parse.com/apps/quickstart

## Add to your Project
Simply download the zip file and drag and drop the PVNetworking directory into your project.  Next make sure that the 
implemantation files have been added to your Compile Sources.  To do this, select your proect file, select your Target, 
go into Build Phases, and expand the Compile Sources section.  If you do not see the PVNetworking (.m) file, click the 
+ button to add them.

Once you have the library added, simply add the AVPlayer+PVNetworking.h file to the view controller you will be displaying
videos in.  

```objective-c
#import AVPlayer+PVNetworking.h
```

## Example Usage
This example will show you how to add videos to an AVPlayer object within a UITableViewController.  

First step is to query your objects from Parse and set them in a NSArray.  



