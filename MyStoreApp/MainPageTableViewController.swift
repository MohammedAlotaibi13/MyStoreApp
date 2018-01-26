//
//  MainPageTableViewController.swift
//  MyStoreApp
//
//  Created by محمد عايض العتيبي on 5/10/1439 AH.
//  Copyright © 1439 code schoole. All rights reserved.
//

import UIKit
import CoreData

class MainPageTableViewController: UITableViewController {
    
    @IBOutlet weak var tableview: UITableView!
    var itemList = [Items]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItem()
    }

    func loadItem(){
        
        let fr : NSFetchRequest<Items> = Items.fetchRequest()
        do {
            itemList = try context.fetch(fr)
        } catch {
            print("failed to load items")
        }
    }
    
    
    // tableView
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let item = itemList[indexPath.row]
        cell.itemName.text = item.item_name
        cell.storeName.text = item.toStoreType?.store_name
        cell.imageItem.image = item.image as? UIImage
       
        // implement date
        let date = DateFormatter()
        date.dateFormat
        return cell
    }
    

   

}
