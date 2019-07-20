//
//  DKUserList.swift
//  Mf_3
//
//  Created by Ferhat Abdullahoglu on 8.05.2019.
//  Copyright © 2019 Ferhat Abdullahoglu. All rights reserved.
//

import Foundation

///
/// Extension for __DKUserList__ custom implementations
///
public extension DKUserList {
    
    /// Count of the sessions within the list
    var sessionCount: Int {
        guard let _sessions = sessionArray else {return 0}
        return _sessions.count
    }
    
    /// Session array of the list with increasing idx
    var sessionArray: [DKListableSession]? {
        guard var _sessions = self.sessions?.array as? [DKListableSession] else {return nil}
        
        _sessions.sort(by: {return $0.idx < $1.idx})
        
        return _sessions
    }
}
