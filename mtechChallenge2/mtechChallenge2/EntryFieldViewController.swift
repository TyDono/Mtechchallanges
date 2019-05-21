//
//  EntryFieldViewController.swift
//  mtechChallenge2
//
//  Created by Tyler Donohue on 5/16/19.
//  Copyright © 2019 Tyler Donohue. All rights reserved.
//

import UIKit

class EntryFieldViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var FoodNameTF: UITextField!
    @IBOutlet var calorieTF: UITextField!
    @IBOutlet var dateMade: UIDatePicker!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var ratingStepper: UISlider!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var foodImage: UIImageView!
    
    var food: Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
        changeBackground()
    }
    
    func changeBackground() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "GP")
        backgroundImage.contentMode = UIView.ContentMode.scaleToFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    func updateView() {
        guard let food = food else {return}
        FoodNameTF.text = food.name
        calorieTF.text = String(food.calorie)
        dateLabel.text = food.date
        ratingLabel.text = String(food.rating)
        // add rating in
    }
    
    func asString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyy"
        return formatter.string(from: Date())
    }
    
    @IBAction func saveFoodButtonTapped(_ sender: Any) {
        
        if FoodNameTF.text == "" || calorieTF.text == "" || dateLabel.text == "" || ratingLabel.text == "" {
            let alert = UIAlertController(title: "Please fill in all fields", message: nil, preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            return
        } else {
            guard let addedFoods = FoodNameTF.text,
                let calories = calorieTF.text,
                let rating = ratingLabel.text,
                let chosenDate = dateLabel.text else {return}
            
            food = Food(name: addedFoods, calorie: Int(calories) ?? 0, date: chosenDate, rating: Int(rating) ?? 0)
            performSegue(withIdentifier: "unwindFoodSegue", sender: self)
        }
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        
        let date = sender.date
        dateLabel.text = date.dateMaker()
    }
    
    @IBAction func ratingStepperTapped(_ sender: UISlider) {

        let currentValue = Int(sender.value)
        ratingLabel.text = "\(currentValue)"
    }
    
    @IBAction func imageButtonTapped(_ sender: UIButton) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        present(imagePickerController, animated: true, completion: nil)
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
