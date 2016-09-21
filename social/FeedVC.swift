//
//  FeedVC.swift
//  social
//
//  Created by Mu on 9/20/16.
//  Copyright © 2016 Mu. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        let keychainresult = KeychainWrapper.removeObjectForKey(KEY_UID)
        print("MU: \(keychainresult) is removed")
        try! FIRAuth.auth()?.signOut()
        //performSegue(withIdentifier: "gotoSignIn", sender: nil)
        self.dismiss(animated: true, completion: nil)
    }

    
}
