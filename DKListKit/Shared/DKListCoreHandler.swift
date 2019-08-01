//
//  CoreDataHelper.swift
//  Mf_3
//
//  Created by Ferhat Abdullahoglu on 20.08.2018.
//  Copyright © 2018 Ferhat Abdullahoglu. All rights reserved.
//

#if !os(iOS)
import WatchKit
#endif
import CoreData
import SessionKit

public final class DKListCoreHandler: NSObject {
    
    
    /* ==================================================== */
    /* MARK: Properties                                     */
    /* ==================================================== */
    
    // -----------------------------------
    // Public properties
    // -----------------------------------
    public static var `default` = DKListCoreHandler()
    
    public var managedObjectModel: NSManagedObjectModel
    
    public var persistenStoreCoordinator: NSPersistentStoreCoordinator
    
    public var managedObjectContext: NSManagedObjectContext
    
    public var isValid = false
    
    public var dbUpdateDoneOnce = false
    // -----------------------------------
    
    
    // -----------------------------------
    // Private / Internal properties
    // -----------------------------------
    private class var bundleId: String { // TBA - fix the bundleid when cocoapods dsl 1.8.0 is released
        return Bundle(for: DKListCoreHandler.self).bundleIdentifier!
//        #if os(iOS)
//        return "com.ferhatab.Mastermind.DKListKit"
//        #else
//        return "com.ferhatab.Mastermind.DKListKitWatch"
//        #endif
    }
    // -----------------------------------
    
    
    /* ==================================================== */
    /* MARK: Init                                           */
    /* ==================================================== */
    public override init() {
        
        guard let _mom = DKListCoreHandler.getMom(),
            let _psc = DKListCoreHandler.getPsc(with: _mom),
            let _moc = DKListCoreHandler.getMoc(with: _psc)
            else {
                fatalError("can't initialize the store")
        }
        
        managedObjectModel = _mom
        persistenStoreCoordinator = _psc
        managedObjectContext = _moc
        
        super.init()
        
        isValid = true
    
    }
    
    
    /* ==================================================== */
    /* MARK: Methods                                        */
    /* ==================================================== */
    
    // -----------------------------------
    // Public methods
    // -----------------------------------
    /**
     Method that creates a new object from its entity description, ready to be saved into context
     */
    public func insertManagedObject(with className: String) -> AnyObject {
        let object =  NSEntityDescription.insertNewObject(forEntityName: className, into: managedObjectContext)
        
        return object
    }
    
    /**
     Tries to delete an entity matching the description and returns the result
     */
    public func deleteManagedObject(entityName: String, predicate: NSPredicate?) -> Bool {
        let _deleteRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        _deleteRequest.returnsObjectsAsFaults = false
        _deleteRequest.predicate = predicate
        //
        do {
            let _objs = try managedObjectContext.fetch(_deleteRequest)
            for _obj in _objs as! [NSManagedObject] {
                managedObjectContext.delete(_obj)
            }
        } catch {
            print(error.localizedDescription)
            return false
        }
        
        // Save the context
        do {
            try managedObjectContext.save()
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    /**
     Method that tries and saves the current context and returns the result
     */
    public func saveManagedObjetContext() -> Bool {
        do {
            try managedObjectContext.save()
            return true
        } catch {
            print((error as NSError).userInfo)
            print(error.localizedDescription)
            return false
        }
    }
    
    /**
     Returns the related entity checking its type
     */
    public func entity<T>(for: T) -> String? {
        if T.self is DKGuidedList.Type {
            return guidedListEntity
        } else if T.self is DKDefaultList.Type {
            return defaultListEntity
        } else if T.self is DKFavList.Type {
            return favListEntity
        } else if T.self is DKUserList.Type {
            return userListEntity
        } else {
            return nil
        }
    }
    
    /**
     Main method to get any entity
     */
    public func fetchEntities(for className: String, predicate: NSPredicate?, sortDescriptor: [NSSortDescriptor]?, includingSubEntities: Bool = true) -> NSArray? {
        
        guard let entityDescription = NSEntityDescription.entity(forEntityName: className, in: managedObjectContext) else {return nil}
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        
        fetchRequest.entity = entityDescription
        
        fetchRequest.includesSubentities = includingSubEntities
        
        if predicate != nil {
            fetchRequest.predicate = predicate
        }
        
        if sortDescriptor != nil {
            fetchRequest.sortDescriptors = sortDescriptor!
        }
        
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let items = try managedObjectContext.fetch(fetchRequest)
            return items as NSArray
        } catch {
            print(error.localizedDescription)
            return nil
        }
        
    }
    
    public func createFavList() -> Bool {
        if UserDefaults.standard.bool(forKey: "dkFavListCreated") { return true}
        
        _ = DKFavList()
        
        let _result = saveManagedObjetContext()
        
        UserDefaults.standard.set(_result, forKey: "dkFavListCreated")
        
        return _result
    }
    // -----------------------------------
    
    
    // -----------------------------------
    // Private methods
    // -----------------------------------
    /**
     Gets the managed object model
     */
    private class func getMom() -> NSManagedObjectModel? {
        guard let proxyBundle = Bundle(identifier: DKListCoreHandler.bundleId) else {return nil}
        
        guard let modelURL = proxyBundle.url(forResource: "ListData", withExtension: "momd") else {return nil}
        
        return NSManagedObjectModel(contentsOf: modelURL)
    }
    
    /**
     Gets the persistentStoreCoordinator
     */
    private class func getPsc(with mom: NSManagedObjectModel) -> NSPersistentStoreCoordinator? {
        
        guard let contanierUrl = FileHandler.shared.linkToAppSupportFolder else {return nil}
        
        let storeURL = contanierUrl.appendingPathComponent("listdata.sqlite")
        
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: mom)
        
        do {
            let options = [NSMigratePersistentStoresAutomaticallyOption:true,
                           NSInferMappingModelAutomaticallyOption:true]
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: options
            )
        } catch  {
            print(error.localizedDescription)
            return nil
        }
        return coordinator
    }
    
    /**
     Gets the managedObjectContext
     */
    private class func getMoc(with psc: NSPersistentStoreCoordinator) -> NSManagedObjectContext? {
        let _managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        _managedObjectContext.persistentStoreCoordinator = psc
        
        _managedObjectContext.retainsRegisteredObjects = true 
        
        return _managedObjectContext
    }
    
    /**
     Returns the maxID contained in a given set of categories
     - parameters:
     - :
     - returns:
     */
    private func getMaxId(_ categories: [DKCategory]) -> Int {
        var _id = 0
        
        categories.forEach({
            if Int($0.id) > _id {
                _id = Int($0.id)
            }
        })
        
        return _id
    }
    
    // -----------------------------------
}




