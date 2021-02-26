//
//  Configuration.swift
//  CodingTest
//
//  Created by Muhammad Abdullah Al Mamun on 26/2/21.
//

import Foundation
import UIKit


class Defaults {
    
    class var username : String? {
        get {
           
            return UserDefaults.standard.string(forKey: #function)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: #function)
        }
    }
}





