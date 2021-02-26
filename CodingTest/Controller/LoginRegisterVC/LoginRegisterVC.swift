//
//  LoginRegisterVC.swift
//  CodingTest
//  Created by Muhammad Abdullah Al Mamun on 25/2/21.

import UIKit
import FirebaseAuth
import Firebase



class LoginRegisterVC: UIViewController {
    
    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    
    //Textfield Outlet
    @IBOutlet weak var nameTextFd: UITextField!
    @IBOutlet weak var emailTextFd: UITextField!
    @IBOutlet weak var passwordTextFd: UITextField!
    @IBOutlet weak var phoneNumberTxFd: UITextField!
    
    //button
    @IBOutlet weak var loginbutton: UIButton!
    @IBOutlet weak var registerbutton: UIButton!
    
    //
    @IBOutlet weak var customViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var havingAccountLabel: UILabel!
    var havingAccountLabelClicked:Bool = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.designLoginandRegisterVC()
        self.loginWindow()
        self.setupLabelAction()
        self.setUpKeyboard()
    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
        print("locing clicked")
        //self.setRootViewController(userName:"mamun")
        // Create cleaned versions of the text field
        let email = emailTextFd.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextFd.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
             
               print("Error")
                let alert = UIAlertController(title: "Error", message: "Your Login Failed", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.emailTextFd.text = ""
                self.passwordTextFd.text = ""
            }
            else {
                UserDefaults.standard.set(result!.user.uid, forKey: "username")
                self.setRootViewController(userName:result!.user.uid)
            }
        }
        
    }
    
    
    
    //clicked Regi
    @IBAction func registerClicked(_ sender: UIButton) {
        print("Register Clicked")
        // Create cleaned versions of the data
        let name = nameTextFd.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailTextFd.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextFd.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = phoneNumberTxFd.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Create the user
        Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
            
            // Check for errors
            if err != nil {
                print("Error")
                let alert = UIAlertController(title: "Error", message: "Your Registation Failed", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
              
            }
            else {
                
                //User was created successfully, now store the first name and last name
                let db = Firestore.firestore()
                
                db.collection("users").addDocument(data: ["email":email,"name":name,"phone":phone, "uid": result!.user.uid ]) { (error) in
                    
                    if error != nil {
                        print("Error")
                        let alert = UIAlertController(title: "Error", message: "Loading Failed into DB", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                     
                    }
                }
                print(result!.user.uid)
                // Transition to the home screen
                UserDefaults.standard.set(result!.user.uid, forKey: "username")
                self.setRootViewController(userName:result!.user.uid)
            }
            
        }
        
    }
    
}



extension LoginRegisterVC{
    
    func setupLabelAction(){
        havingAccountLabelClicked = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        havingAccountLabel.isUserInteractionEnabled = true
        havingAccountLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(){
        if havingAccountLabelClicked{
            self.loginWindow()
        }else{
            
            self.registerWindow()
        }
        print("label clicked")
    }
    
    func setUpKeyboard(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        havingAccountLabel.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func DismissKeyboard(){
        self.view.endEditing(true)
    }
    
    
    func setRootViewController(userName:String){
        
        
        //Defaults.username = userName
        UserDefaults.standard.set(userName, forKey: "username")
        //print(Defaults.username!)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainController = storyboard.instantiateViewController(identifier: "HomeViewController")
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainController)
        
        
    }
    
}
