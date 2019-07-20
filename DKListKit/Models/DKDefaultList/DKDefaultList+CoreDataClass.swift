//
//  DKDefaultList+CoreDataClass.swift
//  Mf_3
//
//  Created by Ferhat Abdullahoglu on 9.05.2019.
//  Copyright © 2019 Ferhat Abdullahoglu. All rights reserved.
//
//

import Foundation
import CoreData

@objc(DKDefaultList)
open class DKDefaultList: DKUserList {

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
    
    public convenience init(name: String, id: Int16 = 0, isProgressive: Bool = false) {
        let _moc = DKListCoreHandler.default.managedObjectContext
        
        let _list = NSEntityDescription.entity(forEntityName: NSStringFromClass(DKDefaultList.self), in: _moc)!
        
        self.init(entity: _list, insertInto: _moc)
        self.id = id 
        self.name = name
        self.isProgressive = isProgressive
        self.imageData = nil
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
