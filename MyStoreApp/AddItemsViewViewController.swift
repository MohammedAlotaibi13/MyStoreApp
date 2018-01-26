//
//  AddItemsViewViewController.swift
//  MyStoreApp
//
//  Created by محمد عايض العتيبي on 5/9/1439 AH.
//  Copyright © 1439 code schoole. All rights reserved.
//

import UIKit
import CoreData
// MARK: - AddItemsViewController
class AddItemsViewViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    // MARK: Outlets
    @IBOutlet weak var storePickerView: UIPickerView!
    @IBOutlet weak var itemNameTextfiled: UITextField!
    @IBOutlet weak var itemImage: UIImageView!
    
    // MARK: Properties :
    var storeList = [StoryType]()

    override func viewDidLoad() {
        super.viewDidLoad()
        storePickerView.delegate = self
        storePickerView.dataSource = self
        
        loadStore()
      
    }
    
    
    // MARK: FUNCTIONS :
    
    func loadStore() {
        let fr : NSFetchRequest<StoryType> = StoryType.fetchRequest()
        do {
            storeList = try context.fetch(fr)
        } catch {
            print("ERROR load store")
        }
    }
    @IBAction func uploadImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
         imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            itemImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        let newItem = Items(context: context)
        newItem.item_name = self.itemNameTextfiled.text
        newItem.image = self.itemImage.image
        newItem.date_create = NSDate() as Date
        newItem.toStoreType = storeList[storePickerView.selectedRow(inComponent: 0)]
        do {
            try add.saveContext()
            itemNameTextfiled.text = ""
            self.itemImage.image = UIImage(named: "icons8-add-image-50")
        } catch {
            print("failed to save")
        }
    }
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return storeList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let storeName = storeList[row]
        return storeName.store_name
    }
 

}
