//
//  DKUserList+CoreDataClass.swift
//  Mf_3
//
//  Created by Ferhat Abdullahoglu on 9.05.2019.
//  Copyright © 2019 Ferhat Abdullahoglu. All rights reserved.
//
//

import Foundation
import CoreData

@objc(DKUserList)
open class DKUserList: NSManagedObject {
    
    // ==================================================== //
    // MARK: Properties
    // ==================================================== //
    
    // -----------------------------------
    // Public properties
    // -----------------------------------
    
    // -----------------------------------
    
    
    // -----------------------------------
    // Private properties
    // -----------------------------------
    
    // -----------------------------------
    
    
    // ==================================================== //
    // MARK: Init
    // ==================================================== //
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    public convenience init?(name: String, id: Int16, isProgressive: Bool) {
        let _moc = DKListCoreHandler.default.managedObjectContext
        
        guard let _list = NSEntityDescription.entity(forEntityName: NSStringFromClass(DKUserList.self), in: _moc) else {return nil}
        
        self.init(entity: _list, insertInto: _moc)
        
        self.name = name
        self.numberOfStarts = 0
        self.expression = ""
        self.id = id
        self.isProgressive = isProgressive
    }
    
 
    
    
    // ==================================================== //
    // MARK: Methods
    // ==================================================== //
    
    // -----------------------------------
    // Public methods
    // -----------------------------------
    /// Returns the index of the session that's the first in
    /// line in a progressive list
    ///
    /// - returns: The index of the next session if it exists
    /// Returns nil if not applicable
    public func indexOfCurrent() -> Int?  {
        guard isProgressive else {return nil}
        return sessionArray?.firstIndex(where: {return !$0.isCompleted}) ?? nil
    }
    
    /// Returns the current session for a progressive list
    public func getCurrentSession() -> DKListableSession? {
        guard let idx = indexOfCurrent() else {return nil}
        return sessionArray?[idx]
    }
    
    /// Set the sender sesion to be completed
    public func setSessionCompleted(_ session: DKSession) {
        guard let _session = sessionArray?.first(where: {return $0.name == session.name}) else {return}
        
        _session.isCompleted = true
        
        _ = DKListCoreHandler.default.saveManagedObjetContext()
    }
    // -----------------------------------
    
    
    // -----------------------------------
    // Private methods
    // -----------------------------------
    
    // -----------------------------------
}
