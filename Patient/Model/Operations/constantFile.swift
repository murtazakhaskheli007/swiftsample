//
//  constantFile.swift
//  Patient
//
//  Created by Ghulam Murtaza on 30/05/2017.
//  Copyright © 2017 Econective. All rights reserved.
//

import Foundation

var isLoginCheck:Bool = false;
var APPNAME:String = "Patient"



enum API
{
    static var LOGIN_URL:String = "login"
}


enum SharedManager {
    static var someVariable: String?
    static var isLoginCheck:Bool = false
    
    enum Call {
        static var isDoctorConnected:Bool = false
    }
}

enum ErrorMessages {
    static var internetConnectionFaild:String = "Oops, Internet connection problem, try later."
}
