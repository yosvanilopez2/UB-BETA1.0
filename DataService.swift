//
//  DataService.swift
//  UB-BETA1.0
//
//  Created by Yosvani Lopez on 8/31/16.
//  Copyright © 2016 Yosvani Lopez. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DataService {
    static let instance = DataService() 
    private var _REF_BASE = FIRDatabase.database().reference()
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    
    
}
