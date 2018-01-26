//
//  ViewController.swift
//  MyStoreApp
//
//  Created by محمد عايض العتيبي on 5/9/1439 AH.
//  Copyright © 1439 code schoole. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameOfStoreTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveButton(_ sender: Any) {
        //TODO : Add store
        let newStore = StoryType(context: context)
        newStore.store_name = self.nameOfStoreTextField.text
        do {
            add.saveContext()
            self.nameOfStoreTextField.text = ""
        } catch {
            print("Error saving")
            return
        }
    }
   
    @IBAction func backButton(_ sender: Any) {
        // dismiss view
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

