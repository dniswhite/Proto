//
//  ProtoExample.swift
//  Proto
//
//  Created by Dennis White on 2/23/16.
//  Copyright © 2016 dniswhite. All rights reserved.
//

import Foundation

@objc protocol ProtoExample {
    var workTime : UInt32 { get }
    
    func workIsStarting()
    func workIsComplete()
    
    optional func workInProgress()
}