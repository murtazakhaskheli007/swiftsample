//
//  secondVC.swift
//  Patient
//
//  Created by Ghulam Murtaza on 30/05/2017.
//  Copyright © 2017 Econective. All rights reserved.
//

import UIKit

class secondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //print("SecondVC loign \(SharedManager.isLoginCheck)")
        // Do any additional setup after loading the view.
       // print("SecondVC loign \()")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBack(_ sender: Any) {
        SharedManager.isLoginCheck = true
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
