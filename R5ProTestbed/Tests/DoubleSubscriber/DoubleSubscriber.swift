//
//  DoubleSubscriber.swift
//  R5ProTestbed
//
//  Created by David Heimann on 3/14/16.
//  Copyright © 2016 Infrared5. All rights reserved.
//

import UIKit
import R5Streaming

@objc(DoubleSubscriber)
class DoubleSubscriber: BaseTest {
    var secondView : R5VideoViewController? = nil
    var subscribeStream2 : R5Stream? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        secondView = setupDefaultR5VideoViewController()
        
        setupDefaultR5VideoViewController()
        
        let config = getConfig()
        // Set up the connection and stream
        let connection = R5Connection(config: config)
        self.subscribeStream = R5Stream(connection: connection)
        self.subscribeStream!.delegate = self
        self.subscribeStream?.client = self;
        
        let screenSize = UIScreen.mainScreen().bounds.size
        let s1Frame = CGRectMake( 0, 0, screenSize.width, screenSize.height * (1/2) )
        currentView?.view.frame = s1Frame
        
        currentView?.attachStream(subscribeStream)
        
        self.subscribeStream!.play(Testbed.getParameter("stream1") as! String)
        
        
        let connection2 = R5Connection(config: config)
        
        self.subscribeStream2 = R5Stream(connection: connection2 )
        self.subscribeStream2!.delegate = self
        self.subscribeStream2?.client = self;
        
        let s2Frame = CGRectMake( 0, screenSize.height * (1/2), screenSize.width, screenSize.height * (1/2) )
        secondView?.view.frame = s2Frame
        
        secondView?.attachStream(subscribeStream2)
        
        self.subscribeStream2?.play(Testbed.getParameter("stream2") as! String)
    }
    
    func onMetaData(data : String){
        
    }
    
    override func closeTest() {
        super.closeTest()
        
        if( self.subscribeStream2 != nil ){
            self.subscribeStream2!.stop()
        }
    }
}
