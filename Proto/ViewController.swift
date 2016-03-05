//
//  ViewController.swift
//  Proto
//
//  Created by Dennis White on 2/23/16.
//  Copyright © 2016 dniswhite. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ProtoExample {
    
    @IBOutlet weak var labelWorkStatus: UILabel!
    
    var protoModel : ProtoModel?

    // implement the protocol
    var workTime : UInt32 { return 10 }

    func workIsComplete() {
        labelWorkStatus.text = "Work is Complete"
    }
    
    func workIsStarting() {
        labelWorkStatus.text = "Work is Starting"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // create and setup the model
        self.protoModel = ProtoModel()
        self.protoModel?.delegate = self
        
        // setup the view
        labelWorkStatus.text = "Ready for Work"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func runWork(sender: AnyObject) {
        if let model = self.protoModel {
            labelWorkStatus.text = "Work is requested"
            model.doSomeProcessing()
        }
    }

}

