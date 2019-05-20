//
//  FoodTableViewCell.swift
//  mtechChallenge2
//
//  Created by Tyler Donohue on 5/16/19.
//  Copyright © 2019 Tyler Donohue. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    @IBOutlet var foodName: UILabel!
    @IBOutlet var foodCalorie: UILabel!
    @IBOutlet var foodDate: UILabel!
    @IBOutlet var foodRating: UIImageView!
    
    var food: Food? {
        didSet {
            guard let food = food else { return }
            updateCell(with: food)
        }
    }
    
    func updateCell(with food: Food) {
        foodName.text = food.name
        foodCalorie.text = String(food.calorie)
        foodDate.text = food.date
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
