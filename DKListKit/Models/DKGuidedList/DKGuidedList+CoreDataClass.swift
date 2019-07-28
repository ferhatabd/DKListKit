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
import SessionKit

@objc(DKGuidedList)
open class DKGuidedList: DKUserList {
    
    // ==================================================== //
    // MARK: IBOutlets
    // ==================================================== //
    
    
    // ==================================================== //
    // MARK: IBActions
    // ==================================================== //
    
    
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
    
    public init () {
        let _moc = DKListCoreHandler.default.managedObjectContext
        
        let _list = NSEntityDescription.entity(forEntityName: NSStringFromClass(DKGuidedList.self), in: _moc)!
        
        super.init(entity: _list, insertInto: _moc)
        
        self.name = "Guided"
        
        self.isProgressive = true
        
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
