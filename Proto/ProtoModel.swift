//
//  ProtoModel.swift
//  Proto
//
//  Created by Dennis White on 2/23/16.
//  Copyright © 2016 dniswhite. All rights reserved.
//

import Foundation

class ProtoModel {
    var delegate : ProtoExample?
    
    func doSomeProcessing() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            // let them know that we are starting
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.delegate?.workIsStarting()
            })
        
            // do some stuff
            var workTime : UInt32 = 0
            if let del = self.delegate {
                workTime = del.workTime
            }
            
            while 0 < workTime {
                sleep(1)

                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.delegate?.workInProgress?()
                })

                workTime--
            }

            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.delegate?.workIsComplete()
            })
        })
    }
}