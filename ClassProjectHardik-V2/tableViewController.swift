//
//  tableViewController.swift
//  ClassProjectHardik-V2
//
//  Created by Hardik Gupta on 4/21/20.
//  Copyright © 2020 Hardik Gupta. All rights reserved.
//

import UIKit

class tableViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate {
    
    var obj:PlacesModel = PlacesModel()
    
    
    @IBOutlet weak var tableViewObj: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return obj.numberofrecords()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "savedCell", for: indexPath) as! savedTableViewCell
               //cell.layer.borderWidth = 1.0
        cell.placeLabel.text = obj.fetchResults[indexPath.row].namePlace
               
               return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
       {
           return true
       }
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell.EditingStyle { return UITableViewCell.EditingStyle.delete }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        
        if editingStyle == .delete
        {
            
           
            obj.delete(x: indexPath.row)
            
            tableViewObj.reloadData()
        }
        
    }

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let destination = segue.destination as? detailViewController {
           
        let selectedIndex: IndexPath = self.tableViewObj.indexPath(for: sender as! savedTableViewCell)!
                   
            let cityDetail = obj.fetchResults[selectedIndex.row].namePlace
                   
            destination.placeString = cityDetail
               }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
