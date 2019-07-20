//
//  DKListableSession+CoreDataClass.swift
//  Mf_3
//
//  Created by Ferhat Abdullahoglu on 9.05.2019.
//  Copyright © 2019 Ferhat Abdullahoglu. All rights reserved.
//
//

import Foundation
import CoreData


@objc(DKListableSession)
open class DKListableSession: NSManagedObject {
    
    
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
    
    public convenience init?(with session: DKListable) {
        let _moc = DKListCoreHandler.default.managedObjectContext
        
        guard let _list = NSEntityDescription.entity(forEntityName: NSStringFromClass(DKListableSession.self), in: _moc) else {return nil}
        
        self.init(entity: _list, insertInto: _moc)
        
        self.name = session.name
        self.idx = 0
        self.isCompleted = false
    }
 
    
    // ==================================================== //
    // MARK: Methods
    // ==================================================== //
    
    // -----------------------------------
    // Public methods
    // -----------------------------------
    
    // -----------------------------------
    
    
    // -----------------------------------
    // Private methods
    // -----------------------------------
    
    // -----------------------------------
}
