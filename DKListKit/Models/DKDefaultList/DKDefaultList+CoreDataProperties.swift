//
//  DKDefaultList+CoreDataProperties.swift
//  DKListKit
//
//  Created by Ferhat Abdullahoglu on 3.06.2019.
//  Copyright © 2019 Ferhat Abdullahoglu. All rights reserved.
//
//

import Foundation
import CoreData


extension DKDefaultList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DKDefaultList> {
        return NSFetchRequest<DKDefaultList>(entityName: "DKDefaultList")
    }

    @NSManaged public var imageData: Data?

}
