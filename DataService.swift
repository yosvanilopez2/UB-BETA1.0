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
    private let _USER_BASE = DATA_BASE.reference(withPath: "users")
    private let _ALBUM_BASE = DATA_BASE.reference(withPath: "Albums")
    
    
    var USER_BASE: FIRDatabaseReference {
        return _USER_BASE
    }
    var ALBUM_BASE: FIRDatabaseReference {
        return _ALBUM_BASE
    }
    
    func createUser(uid: String, user: Dictionary<String, String>) {
        USER_BASE.child(uid).setValue(user)
    }
    // find out exactly where to store photos and how to retreive them
    func createAlbum(title: String, photos: [String]) {
        ALBUM_BASE.child(title).setValue(photos)
    }
    
}
