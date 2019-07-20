//
//  DKListableSession+CoreDataProperties.swift
//  Mf_3
//
//  Created by Ferhat Abdullahoglu on 9.05.2019.
//  Copyright © 2019 Ferhat Abdullahoglu. All rights reserved.
//
//

import Foundation
import CoreData


extension DKListableSession {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DKListableSession> {
        return NSFetchRequest<DKListableSession>(entityName: "DKListableSession")
    }

    @NSManaged public var name: String?
    @NSManaged public var idx: Int64
    @NSManaged public var parent: DKUserList?
    @NSManaged public var isCompleted: Bool
}
