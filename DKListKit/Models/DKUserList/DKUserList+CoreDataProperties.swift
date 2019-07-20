//
//  DKUserList+CoreDataProperties.swift
//  Mf_3
//
//  Created by Ferhat Abdullahoglu on 9.05.2019.
//  Copyright © 2019 Ferhat Abdullahoglu. All rights reserved.
//
//

import Foundation
import CoreData


extension DKUserList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DKUserList> {
        return NSFetchRequest<DKUserList>(entityName: "DKUserList")
    }

    @NSManaged public var name: String
    @NSManaged public var expression: String?
    @NSManaged public var numberOfStarts: Int64
    @NSManaged public var sessions: NSOrderedSet?
    @NSManaged public var id: Int16
    @NSManaged public var isProgressive: Bool

}

// MARK: Generated accessors for sessions
extension DKUserList {

    @objc(insertObject:inSessionsAtIndex:)
    @NSManaged public func insertIntoSessions(_ value: DKListableSession, at idx: Int)

    @objc(removeObjectFromSessionsAtIndex:)
    @NSManaged public func removeFromSessions(at idx: Int)

    @objc(insertSessions:atIndexes:)
    @NSManaged public func insertIntoSessions(_ values: [DKListableSession], at indexes: NSIndexSet)

    @objc(removeSessionsAtIndexes:)
    @NSManaged public func removeFromSessions(at indexes: NSIndexSet)

    @objc(replaceObjectInSessionsAtIndex:withObject:)
    @NSManaged public func replaceSessions(at idx: Int, with value: DKListableSession)

    @objc(replaceSessionsAtIndexes:withSessions:)
    @NSManaged public func replaceSessions(at indexes: NSIndexSet, with values: [DKListableSession])

    @objc(addSessionsObject:)
    @NSManaged public func addToSessions(_ value: DKListableSession)

    @objc(removeSessionsObject:)
    @NSManaged public func removeFromSessions(_ value: DKListableSession)

    @objc(addSessions:)
    @NSManaged public func addToSessions(_ values: NSOrderedSet)

    @objc(removeSessions:)
    @NSManaged public func removeFromSessions(_ values: NSOrderedSet)

    /// Custom session adder
    ///
    /// This wraps around a bug in CoreHandler for up until iOS 10
    /// use this method to add a session to a list
    public func addSession(_ session: DKListableSession) {
        if #available(iOS 10, *) {
            addToSessions(session)
        } else {
            addSessionLegacy(session)
        }
    }
    
    /// Custom session remover
    ///
    /// This wraps around a bug in CoreHandler for up until iOS 10
    /// use this method to remove a session from a list
    public func removeSession(_ session: DKListableSession) {
        if #available(iOS 10, *) {
            removeFromSessions(session)
        } else {
            removeSessionLegacy(session)
        }
        let predicate = NSPredicate(format: "name = %@ && parent.name = %@", session.name ?? "", self.name)
        
        _ = DKListCoreHandler.default.deleteManagedObject(entityName: DKListCoreHandler.default.listabelSessionEntity, predicate: predicate)
    }
    
    /// legacy add handler for below iOS 10
    private func addSessionLegacy(_ session: DKListableSession) {
        guard let _sessions = sessions else {return}
        willChangeValue(forKey: "sessions")
        let _set = NSMutableOrderedSet(orderedSet: _sessions)
        _set.add(session)
        sessions = _set
        didChangeValue(forKey: "sessions")
    }
    
    /// legacy remove handler for below iOS 10
    private func removeSessionLegacy(_ session: DKListableSession) {
        guard let _sessions = sessions else {return}
        willChangeValue(forKey: "sessions")
        let _set = NSMutableOrderedSet(orderedSet: _sessions)
        _set.remove(session)
        sessions = _set
        didChangeValue(forKey: "sessions")
    }
}


public extension NSSortDescriptor {
    ///
    /// Sort description that would sort the __DKUserList__ objects
    /// with increasing __id__
    ///
    static var dkUserListIncreasingId: NSSortDescriptor {
        return NSSortDescriptor(key: "id", ascending: true)
    }
}
