//
//  _DKListCoreHandler.swift
//  Mf_3
//
//  Created by Ferhat Abdullahoglu on 9.05.2019.
//  Copyright © 2019 Ferhat Abdullahoglu. All rights reserved.
//

import Foundation

public extension DKListCoreHandler {
    var favListEntity: String { return NSStringFromClass(DKFavList.self)}
    var userListEntity: String { return NSStringFromClass(DKUserList.self)}
    var listabelSessionEntity: String {return NSStringFromClass(DKListableSession.self)}
    var defaultListEntity: String {return NSStringFromClass(DKDefaultList.self)}
}
