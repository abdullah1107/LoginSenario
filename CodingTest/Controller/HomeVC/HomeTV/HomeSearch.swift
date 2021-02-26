//
//  HomeSearch.swift
//  CodingTest
//
//  Created by Muhammad Abdullah Al Mamun on 25/2/21.
//

import Foundation
import UIKit

extension HomeViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == ""{
            searching = false
            homeTV.reloadData()
        }else{
            searchhomeobj = allhomeobj.filter { (item) in (item.titleName?.lowercased().contains(searchText.lowercased()))!}
            searching = true
            homeTV.reloadData()
        }
        
        
    }
    
    
    
}
