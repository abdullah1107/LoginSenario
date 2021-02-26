//
//  HomeTVCell.swift
//  CodingTest
//
//  Created by Muhammad Abdullah Al Mamun on 25/2/21.
//

import UIKit

class HomeTVCell: UITableViewCell {
    
    @IBOutlet weak var CellImage: UIImageView!
    
    
    @IBOutlet weak var Celllabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
