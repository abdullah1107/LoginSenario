//
//  HomeViewController.swift
//  CodingTest
//  Created by Muhammad Abdullah Al Mamun on 25/2/21.
//

import UIKit

class HomeViewController: UIViewController{
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var homeTV: UITableView!
    
    var searching = false
   
    
    var allhomeobj = [HomeModel]()
    var searchhomeobj = [HomeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modelDataInsert()
        self.tableViewinit()
        self.searchBarinit()
        
        
    }
    
    

    @IBAction func profileShow(_ sender: UIBarButtonItem) {
        if let profileVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController {
//            detailsVC.ctName = searchhomeobj[indexPath.section].titleName ?? ""
//            detailsVC.ctImage = UIImage(named: searchhomeobj[indexPath.section].image ?? "Bangladesh")
            
            self.navigationController?.present(profileVC, animated: true)
        }
    }
    

}


extension HomeViewController{
    
    func tableViewinit(){
        homeTV.delegate = self
        homeTV.dataSource = self
    }
    
    func searchBarinit(){
        searchBar.delegate = self
        let searchTextField = self.searchBar.searchTextField
        
        searchTextField.clearButtonMode = .whileEditing
        self.searchBar.keyboardAppearance = .dark
        self.homeTV.separatorStyle = .none
        
    }
    
    func modelDataInsert(){
        allhomeobj = [HomeModel(titleName: "Bangladesh", image: "Bangladesh"),HomeModel(titleName: "Canada", image: "Canada"),HomeModel(titleName: "China", image: "China"), HomeModel(titleName: "England", image: "England"), HomeModel(titleName: "Franch", image: "France"), HomeModel(titleName: "Germany", image: "Germany"), HomeModel(titleName: "Portugal", image: "Portugal"),HomeModel(titleName: "Turki", image: "Turki"), HomeModel(titleName: "USA", image: "Usa")]
    }
}



