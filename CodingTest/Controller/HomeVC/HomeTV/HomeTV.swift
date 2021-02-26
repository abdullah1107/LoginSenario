//
//  HomeTV.swift
//  CodingTest
//
//  Created by Muhammad Abdullah Al Mamun on 25/2/21.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    
    // MARK: - Number Of Rows In Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 1 }
    
    
    //--------------------------------------------------------------------------------------------
    
    // MARK: - Number Of Section
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if searching {
            return self.searchhomeobj.count
        } else {
            return self.allhomeobj.count
        }
        
        
        
    }
    
    //--------------------------------------------------------------------------------------------
    
    
    
    // MARK: - Height For Row At
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    //--------------------------------------------------------------------------------------------
    
    // MARK: - Height For Header In Section
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    
    //--------------------------------------------------------------------------------------------
    
    // MARK: - View For Header In Section
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = homeTV.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTVCell
        
        if searching {
            cell.Celllabel.text = searchhomeobj[indexPath.section].titleName ?? ""
            cell.CellImage.image = UIImage(named: searchhomeobj[indexPath.section].image ?? "Bangladesh")
            
            
        } else {
            cell.Celllabel.text = allhomeobj[indexPath.section].titleName ?? ""
            cell.CellImage.image = UIImage(named: allhomeobj[indexPath.section].image ?? "Bangladesh")
        }
        
        return self.setFolderCell(cell: cell)
    }
    
    func setFolderCell(cell: UITableViewCell) -> UITableViewCell {
        
        let view = UIView()
        view.backgroundColor = UIColor.white
        
        cell.multipleSelectionBackgroundView = view
        cell.backgroundColor = .white
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        cell.layer.shadowRadius = 25.0
        cell.layer.shadowOpacity = 0.9
        
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
        
        
        return cell
    }
    
    
    // did select Section
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // print(indexPath.section)
        if searching{
            if let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
                detailsVC.ctName = searchhomeobj[indexPath.section].titleName ?? ""
                detailsVC.ctImage = UIImage(named: searchhomeobj[indexPath.section].image ?? "Bangladesh")
                
                self.navigationController?.pushViewController(detailsVC, animated: true)
            }
            
        }
        else{
            if let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
                detailsVC.ctName =
                    allhomeobj[indexPath.section].titleName ?? ""
                detailsVC.ctImage = UIImage(named: allhomeobj[indexPath.section].image ?? "Bangladesh")
                self.navigationController?.pushViewController(detailsVC, animated: true)
            }
            
        }
        
        
    }
    
}



