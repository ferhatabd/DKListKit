//
//  DKFavList+CoreDataClass.swift
//  Mf_3
//
//  Created by Ferhat Abdullahoglu on 8.05.2019.
//  Copyright © 2019 Ferhat Abdullahoglu. All rights reserved.
//
//

import Foundation
import CoreData

@objc(DKFavList)
open class DKFavList: DKUserList {

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
    
    public init() {
     
        let _moc = DKListCoreHandler.default.managedObjectContext
        
        let _list = NSEntityDescription.entity(forEntityName: NSStringFromClass(DKFavList.self), in: _moc)!
        
        super.init(entity: _list, insertInto: _moc)
        
        self.name = "Favorileriniz"
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
