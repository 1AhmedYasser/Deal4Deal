//
//  CountryTableViewController.swift
//  Deal4Deal
//
//  Created by IMac on 9/25/19.
//  Copyright © 2019 IMac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class CountryTableViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var countryTableView: UITableView!
    @IBOutlet weak var searchBare: UISearchBar!
    let loader = Loader()
    var filterArr = [Country](){
        didSet{
            self.countryTableView.reloadData()
        }
    }
    var countryArr : [Country] = [Country](){
        didSet{
            self.countryTableView.reloadData()
        }
    }
//    var countryCallback  = {(() -> (Country)).self}
    var countryCallback:((_ country :Country) ->())?
    var isFiltering: Bool  = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBare.delegate = self
        loader.LoaderStartAnimation(self)
        NetWorkManger.share.getAllCountries { (allCountries) in
           self.loader.stopAnimation()
            guard let countries =  allCountries else {return}
            self.countryArr = countries
            
        }
        
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
 
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isFiltering {
            return filterArr.count
        }
        return countryArr.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var countrySelected : Country
      
        if isFiltering {
            countrySelected = filterArr[indexPath.row]
            guard let country = countryCallback else {return}
            country(countrySelected)
            self.navigationController?.popViewController(animated: true)
        }else {
            countrySelected = countryArr[indexPath.row]
            guard let country = countryCallback else {return}
            country(countrySelected)
            
            self.navigationController?.popViewController(animated: true)
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CountryTableViewCell
        if isFiltering {
            cell.ConfigCell(country: filterArr[indexPath.row])
            return cell
        }
        cell.ConfigCell(country: countryArr[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
   
    
}
extension CountryTableViewController : UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar){
        
    }
    
    func  searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.isFiltering = false
        countryTableView.reloadData()
        
    }
    
    func searchBarSearchButtonClicked( _ searchBar: UISearchBar)
    {
        
        self.isFiltering = true
        filterArr = countryArr.filter({ (country) -> Bool in
            return country.nameEn.contains(searchBar.text as! String)
        })
        countryTableView.reloadData()
        
    }

}
