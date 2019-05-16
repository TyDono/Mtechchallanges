//
//  EntryFieldViewController.swift
//  mtechChallenge2
//
//  Created by Tyler Donohue on 5/16/19.
//  Copyright © 2019 Tyler Donohue. All rights reserved.
//

import UIKit

class EntryFieldViewController: UIViewController {
    @IBOutlet var FoodNameTF: UITextField!
    @IBOutlet var calorieTF: UITextField!
    @IBOutlet var dateMade: UIDatePicker!
    @IBOutlet var foodRating: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveFoodButtonTapped(_ sender: Any) {
    }
    
    
}
