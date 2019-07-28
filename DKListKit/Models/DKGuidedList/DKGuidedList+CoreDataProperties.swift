//
//  DKGuidedList+CoreDataProperties.swift
//  DKListKit
//
//  Created by Ferhat Abdullahoglu on 28.07.2019.
//  Copyright © 2019 Ferhat Abdullahoglu. All rights reserved.
//
//

import Foundation
import CoreData


extension DKGuidedList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DKGuidedList> {
        return NSFetchRequest<DKGuidedList>(entityName: "DKGuidedList")
    }

    @NSManaged public var durationPerDay: Double

}
