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

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        DataService.ds.REF_POSTS.observe(.value, with: {(snapshot) in
            print(snapshot.value)
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signOutTapped(_ sender: AnyObject) {
        let keychainresult = KeychainWrapper.removeObjectForKey(KEY_UID)
        print("MU: \(keychainresult) is removed")
        try! FIRAuth.auth()?.signOut()
        //performSegue(withIdentifier: "gotoSignIn", sender: nil)
        self.dismiss(animated: true, completion: nil)
    }

    
}
