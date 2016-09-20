//
//  ViewController.swift
//  social
//
//  Created by Mu on 9/19/16.
//  Copyright © 2016 Mu. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookbtnTapped(_ sender: UIButton) {
        
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self, handler: {
            (result, error) in
            if error != nil {
                print("MU: Unable to connetct to facebook")
            } else if result?.isCancelled == true {
                print("MU: user cancelled the authentication")
            } else {
                print("MU: Successfully loged in FB")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
                
            }
        })
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential){
        FIRAuth.auth()?.signIn(with: credential, completion: {
            (user, error) in
            if error != nil {
                print("MU: Unable to authenticate with firebase - \(error)")
            } else {
                print("MU: Successfully authenticated with firebase")
            }
            
        })
    }

}

