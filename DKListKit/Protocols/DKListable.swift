//
//  DKListable.swift
//  Mf_3
//
//  Created by Ferhat Abdullahoglu on 9.05.2019.
//  Copyright © 2019 Ferhat Abdullahoglu. All rights reserved.
//

import Foundation
import SessionKit
import CoreData

///
/// Public protocol that bridges objects
/// to __DKListSession__ objects
///
public protocol DKListable  {
    ///
    /// Creates a __DKListableSession__ object
    /// from any __DKSession__ object
    ///
    func getListableObj() -> DKListableSession?
    
    /// name of the session
    var name: String {get set}
    
    
}

public extension DKListable where Self: DKSession  {
 
    // default implementaion for DKSession
    func getListableObj() -> DKListableSession? {
        let _listable = DKListableSession(with: self)
        return _listable
    }
    
}
