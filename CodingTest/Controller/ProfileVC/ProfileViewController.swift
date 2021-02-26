//
//  ProfileViewController.swift
//  CodingTest
//
//  Created by Muhammad Abdullah Al Mamun on 26/2/21.
//

import UIKit
import FirebaseAuth
import Firebase

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var customVIew: UIView!
    
    @IBOutlet weak var Name: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var phoneNNumber: UILabel!
    
    
    @IBOutlet weak var logout: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customVIew.layer.cornerRadius = 18
        backButton.layer.cornerRadius = 15
        logout.layer.cornerRadius = 15
        
        
        
        
    }
    
    
    override func viewWillLayoutSubviews() {
        getdata()
    }
    
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.dismiss(animated:true)
    }
    
    
    @IBAction func LogoutClicked(_ sender: UIButton) {
       // Defaults.username = nil
        UserDefaults.standard.set(nil, forKey: "username")
        Name.text = ""
        email.text = ""
        phoneNNumber.text = ""
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginNavController = storyboard.instantiateViewController(identifier: "LoginRegisterVC")
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController)
            
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        
        
        
    }
    
    func getdata(){
        guard let settingDefaultValue = UserDefaults.standard.string(forKey: "username") else {return}
     
        let docRef = Firestore.firestore().collection("users").document(settingDefaultValue)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
        
                self.Name.text = document.get("name") as! String?
                self.email.text = document.get("email") as! String?
                self.phoneNNumber.text = document.get("phone") as! String?
                
            } else {
                print("Document does not exist")
            }
        }
        

        
    }
}
