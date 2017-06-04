//
//  SingletonOperations.swift
//  Patient
//
//  Created by Ghulam Murtaza on 30/05/2017.
//  Copyright © 2017 Econective. All rights reserved.
//

import Foundation
class SingletonOperations {
    
    static let sharedInstance = SingletonOperations();
    var UserLoginId:String?
    
    private init()
    {
        
    }
}
