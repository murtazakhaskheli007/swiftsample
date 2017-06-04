//
//  ViewController.swift
//  Patient
//
//  Created by Apple on 10/05/2017.
//  Copyright © 2017 Econective. All rights reserved.
//

import UIKit
import SVProgressHUD
import SideMenu


class ViewController: UIViewController {

    // var new:New?
    var newuser:user?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Hello I am here")
        //SomeManager.isLoginCheck = false
        loginUser()
    }

    override func viewWillAppear(_ animated: Bool) {
       
        print("1232 -- isLoginCheck \(SharedManager.isLoginCheck)")
        print("1232 -- is doctor connected \(SharedManager.Call.isDoctorConnected)")
    }
        
        
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var btnShowme: UIButton!
    
    @IBAction func btnActShowLeftMenu(_ sender: Any) {
        
        loginUser()
       // print("1232 -- isLoginCheck \(isLoginCheck)")
        
    }
    
    
    func loginUser() -> Void {
        
        
        let username    = "hamed11"
        let password    = "123"
        let type        = "doctor"
        let latitude    = "0"
        let longitude   = "0"
        
        let credentials = ["username":username,
                           "password":password,
                           "type":type,
                           "latitude":latitude,
                           "longitude":longitude]
        
        
        
        print("I am funciton")
        
        NetworkOperation.login(credentials: credentials, callback: {(json,statusCode) in
        
            print("Login Api Successed ")
           //print(json, statusCode)
            self.newuser = user(userJson: json["user"] as! ([String : AnyObject]))
           
            if let namee = self.newuser?.name
            {
                print("name  -- \(namee)")
            }
            
           
        })
    }
    func presentError(message: String) {
        let alertController = UIAlertController(title: "Patient", message:
            message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
}

