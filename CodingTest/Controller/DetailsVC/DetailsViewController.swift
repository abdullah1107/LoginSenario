//
//  DetailsViewController.swift
//  CodingTest
//
//  Created by Muhammad Abdullah Al Mamun on 26/2/21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var ctName:String?
    var ctImage:UIImage?
    
    
    @IBOutlet weak var countryName: UILabel!
    
    @IBOutlet weak var countryImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.countryName.text = ctName
        self.countryImage.image = ctImage

        // Do any additional setup after loading the view.
    }
    

   

}
