//
//  TableViewController.swift
//  Uygulama
//
//  Created by Öğrenci on 27.02.2017.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var arama: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    let array=["elma","Armut","Ayva"]
    let reusable="TableViewCell"
    let dict:[String:Any]=["imageName":"foto1","name":"Burak","date":"3.25 Pm"]
    var filteredArray:[String]=[]
    override func viewDidLoad()
    {
        filteredArray=array
        let nib = UINib.init(nibName:reusable,bundle:nil)
        self.tableView.register(nib,forCellReuseIdentifier:reusable)
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = self.tableView.dequeueReusableCell(withIdentifier: reusable, for: indexPath) as! TableViewCell
        cell.label.text = filteredArray[indexPath.row]
        cell.imageview.image = UIImage.init(named: filteredArray[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "newshowpage", sender: filteredArray[indexPath.row])
        

    
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredArray = []
        for item in filteredArray{
            if item.contains(searchText){
                filteredArray.append(item)
                
                
            }
            if filteredArray.isEmpty&&searchText==""{
                filteredArray=array
            }
        }
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller=segue.destination as!MessageViewController
        controller.meyvee=sender as!String
    }
   

}
