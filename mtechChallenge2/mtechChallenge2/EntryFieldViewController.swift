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
    @IBOutlet var dateLabel: UILabel!
    
    var food: Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        //dateMaker()
    }
    
 
    
    func updateView() {
        guard let food = food else {return}
        FoodNameTF.text = food.name
        calorieTF.text = String(food.calorie)
        dateLabel.text = food.date
        // add rating in
    }
    

    
    func asString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyy"
        return formatter.string(from: Date())
    }
    
    @IBAction func saveFoodButtonTapped(_ sender: Any) {
        
        guard let addedFoods = FoodNameTF.text,
            let calories = calorieTF.text,
            let chosenDate = dateLabel.text else {return}
        
        food = Food(name: addedFoods, calorie: Int(calories) ?? 0, date: chosenDate, rating: 0)
        performSegue(withIdentifier: "unwindFoodSegue", sender: self)
        
    }
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let date = sender.date
        dateLabel.text = date.dateMaker()
    }
    
}

extension Date {
    
    func dateMaker() -> String{
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MM/dd/yyyy"
        let dateEaten = dateformatter.string(from: self)
        return dateEaten
    }
}
