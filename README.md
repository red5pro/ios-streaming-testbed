# Red5 Pro iOS Streaming Testbed

This repository contains a simple project with a number of examples that can be used for testing and reference.  

##Requirements

You will need a functional, running Red5 Pro server web- (or locally-) accessible for the client to connect to.  

For more information visit http://red5pro.com.

##Setup

You will need to modify **/Red5ProTestbed/tests.plist (the domain value)** to point to your server instance.  If you do not, the examples will not function when you build.

Once you have modified your settings, you can run the application for simulator or device. 

***Note: Publishing does not currently work on simulator!***

##Examples

###[Publishing](R5ProTestbed/Tests/Publish)

| **[1200](R5ProTestbed/Tests/Publish)**                 
| :-----
| *A high bitrate publisher. Note that this is the publish test with a non-default 'bitrate' value set in tests.plist* 
|
| **[ABR](R5ProTestbed/Tests/AdaptiveBitrate)**
| *A high bitrate publisher with AdaptiveBitrateController* 
|
| **[Stream Image](R5ProTestbed/Tests/PublishStreamImage)**
| *Touch the publish stream to take a screen shot that is displayed!*  
|
| **[Camera Swap](R5ProTestbed/Tests/CameraSwap)**
| *Touch the screen to swap which camera is being used! Verify using flash that camera is swapping properly and no rendering problems occur.*  
|
| **[Orientation](R5ProTestbed/Tests/PublishOrientation)**
| *Touch the screen to rotate the output video 90 degrees.  Verify with flash, android, or other iOS device running subscribe test.* 

###[Subscribing](R5ProTestbed/Tests/Subscribe)

| **[Stream Image](R5ProTestbed/Tests/SubscribeStreamImage)**                 
| :-----
| *Touch the subscribe stream to take a screen shot that is displayed!* 
|
| **[Bandwidth Test](R5ProTestbed/Tests/SubscriberBadwidth)**
| *Detect Insufficient and Sufficient BW flags.  Test on a poor network using a publisher that has high video quality. Video should become sporadic or stop altogether.  The screen will darken when no video is being received.*  
|
| **[Aspect Ratio](R5ProTestbed/Tests/SubscribeAspectRatio)**
| *Change the fill mode of the stream.  scale to fill, scale to fit, scale fill.  Aspect ratio should be maintained on first 2.* 
     
##Notes

1. For some of the above examples you will need two devices (a publisher, and a subscriber). You can also use a web browser to subscribe or publish via Flash.
2. You can see a list of active streams by navigating to http://your_red5_pro_server_ip:5080/live/streams.jsp
3. Click on the flash link (for example, flash_publisher) in the streams list displayed to view the published stream in your browser.

[![Analytics](https://ga-beacon.appspot.com/UA-59819838-3/red5pro/streaming-ios?pixel)](https://github.com/igrigorik/ga-beacon)