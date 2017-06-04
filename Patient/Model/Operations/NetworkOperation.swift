//
//  NetworkOperation.swift
//  Patient
//
//  Created by Ghulam Murtaza on 30/05/2017.
//  Copyright © 2017 Econective. All rights reserved.
//

import Foundation
import Alamofire
import ReachabilitySwift
import SVProgressHUD
class NetworkOperation
{
    static let HOSTNAME = "https://www.onlinecare.com/dev/index.php/app/"
    //dev/index.php/app/login
    
    static var reachability: Reachability!
    static var isReachableNet:Bool = false;
    
    //will understand leter
    static var headers: HTTPHeaders = [
        "x-access-token": UserDefaults.standard.object(forKey: "token") as! String,
        "Accept": "application/json"
    ]
    
    static func login(credentials:[String: String], callback: @escaping ([String: AnyObject], Int) -> Void) {
        
        
        if(!isReachableNet)
        {
            self.presentError(message: ErrorMessages.internetConnectionFaild)
            return;
        }
        
        SVProgressHUD.show();
        
        let parameters  : Parameters = [
            "latitude"  : "\(credentials["latitude"]!)",
            "longitude" : "\(credentials["longitude"]!)",
            "password"  : "\(credentials["password"]!)",
            "type"      : "\(credentials["type"]!)",
            "username"  : "\(credentials["username"]!)"
        ]
        
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        
        Alamofire.request(HOSTNAME + API.LOGIN_URL, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
             SVProgressHUD.dismiss()
            
            let statusCode = response.response?.statusCode
            if let json = response.result.value as? [String:AnyObject] {
                callback(json, statusCode!)
            }
        }
    }
   
    
    
    
    
    
    static func isInternetConnected()->Void
    {
        reachability = Reachability()!
        
        //declare this inside of viewWillAppear
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged),name: ReachabilityChangedNotification,object: reachability)
        do{
            try reachability.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
    }
    
    static func presentError(message:String)
    {
        SVProgressHUD.showInfo(withStatus: message)
    }
    
    
     @objc static func reachabilityChanged(note: NSNotification) {
        
        let reachability = note.object as! Reachability
        
        if reachability.isReachable {
            
            isReachableNet = true;
            
            if reachability.isReachableViaWiFi {
                print("i Reachable via WiFi")
            } else {
                print("i Reachable via Cellular")
            }
        } else {
            isReachableNet = false;
            print("i Network not reachable")
        }
    }
    
}
