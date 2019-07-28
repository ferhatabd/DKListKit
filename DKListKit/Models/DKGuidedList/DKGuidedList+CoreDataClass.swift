//
//  DKGuidedList+CoreDataClass.swift
//  DKListKit
//
//  Created by Ferhat Abdullahoglu on 28.07.2019.
//  Copyright © 2019 Ferhat Abdullahoglu. All rights reserved.
//
//

import Foundation
import CoreData

@objc(DKGuidedList)
public class DKGuidedList: DKDefaultList {

    
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
    
    ///
    /// Initializes a guided list with its name & id
    ///
    /// - parameter name: Name of the list
    /// - parameter id: ID of the list
    ///
    public convenience init(name: String, id: Int16 = 0) {
        
        let _moc = DKListCoreHandler.default.managedObjectContext
        
        let _list = NSEntityDescription.entity(forEntityName: NSStringFromClass(DKGuidedList.self), in: _moc)!
        
        self.init(entity: _list, insertInto: _moc)
        
        self.id = id
        self.name = name
        self.isProgressive = true
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
