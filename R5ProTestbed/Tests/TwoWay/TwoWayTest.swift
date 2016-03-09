//
//  TwoWay.swift
//  R5ProTestbed
//
//  Created by David Heimann on 3/9/16.
//  Copyright © 2016 Infrared5. All rights reserved.
//

import UIKit
import R5Streaming

@objc(TwoWayTest)
class TwoWayTest: BaseTest {
    var publishView : R5VideoViewController? = nil
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        AVAudioSession.sharedInstance().requestRecordPermission { (gotPerm: Bool) -> Void in };
        
        setupDefaultR5VideoViewController()
        
        
        publishView = getNewR5VideoViewController(self.view.frame);
        self.addChildViewController(publishView!);
        
        view.addSubview(publishView!.view)
        
        publishView!.showPreview(true)
        
        publishView!.showDebugInfo(true)
        
        // Set up the configuration
        let config = getConfig()
        // Set up the connection and stream
        let connection = R5Connection(config: config)
        
        setupPublisher(connection)
        // show preview and debug info
        
        publishView!.attachStream(publishStream!)
        
        let screenSize = UIScreen.mainScreen().bounds.size
        let newFrame = CGRectMake( screenSize.width * (3/5), screenSize.height * (3/5), screenSize.width * (2/5), screenSize.height * (2/5) )
        publishView?.view.frame = newFrame
        
        self.publishStream!.publish(Testbed.getParameter("stream1") as! String, type: R5RecordTypeLive)
        
        
        let button   = UIButton(type: UIButtonType.System) as UIButton
        button.frame = CGRectMake(0, screenSize.height - 50, 150, 50)
        button.backgroundColor = UIColor.redColor()
        button.setTitle("Subscribe", forState: UIControlState.Normal)
        button.addTarget(self, action: "subscribeHit:", forControlEvents: UIControlEvents.TouchDown)
        
        view.addSubview(button)
    }
    
    func subscribeHit(sender:UIButton!)
    {
        if( subscribeStream == nil )
        {
            let config = getConfig()
            // Set up the connection and stream
            let connection = R5Connection(config: config)
            self.subscribeStream = R5Stream(connection: connection)
            self.subscribeStream!.delegate = self
            self.subscribeStream?.client = self;
            
            currentView?.attachStream(subscribeStream)
            
            self.subscribeStream!.play(Testbed.getParameter("stream2") as! String)
        }
    }
    
    func onMetaData(data : String){
        
    }
}
