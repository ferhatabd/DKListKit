//
//  DKFavList+CoreDataProperties.swift
//  Mf_3
//
//  Created by Ferhat Abdullahoglu on 8.05.2019.
//  Copyright © 2019 Ferhat Abdullahoglu. All rights reserved.
//
//

import Foundation
import CoreData


public extension DKFavList {

    @nonobjc class func fetchRequest() -> NSFetchRequest<DKFavList> {
        return NSFetchRequest<DKFavList>(entityName: "DKFavList")
    }


}
