//
//  LoginRegisterHelper.swift
//  CodingTest
//
//  Created by Muhammad Abdullah Al Mamun on 25/2/21.
//

import Foundation
import UIKit

extension LoginRegisterVC{
    
    func designLoginandRegisterVC(){
        print("calling....")
        let cornerRadius : CGFloat = 15.0
        
        customView.layer.cornerRadius = cornerRadius
        customView.layer.shadowColor = UIColor.darkGray.cgColor
        customView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        customView.layer.shadowRadius = 25.0
        customView.layer.shadowOpacity = 0.9
        
        loginbutton.layer.cornerRadius = cornerRadius
        registerbutton.layer.cornerRadius = cornerRadius
        
        
    }
    
    func labelHidden(){
        nameTextFd.isHidden = true
        phoneNumberTxFd.isHidden = true
    }
    
    func labelShow(){
        nameTextFd.isHidden = false
        phoneNumberTxFd.isHidden = false
    }
    
    func loginWindow(){
        headerLabel.text = "Login"
        let cgheight:CGFloat = 220
        customViewHeight.constant = cgheight
        havingAccountLabelClicked = false
        havingAccountLabel.text = "if do not have account?"
        registerbutton.isHidden = true
        loginbutton.isHidden = false
        self.labelHidden()
    }
    
    func registerWindow(){
        headerLabel.text = "Register"
        customViewHeight.constant = 300
        havingAccountLabelClicked = true
        havingAccountLabel.text = "already have an accounnt"
        loginbutton.isHidden = true
        registerbutton.isHidden = false
        self.labelShow()
    }
}
