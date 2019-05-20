//
//  Food.swift
//  mtechChallenge2
//
//  Created by Tyler Donohue on 5/16/19.
//  Copyright © 2019 Tyler Donohue. All rights reserved.
//

import Foundation
import UIKit

class Food: NSObject, NSCoding {
    
    struct FoodKeys {
        static let name = "name"
        static let calorie = "calorie"
        static let date = "date"
        static let rating = "rating"
    }
    
    let name: String
    let calorie: Int
    let date: String
    let rating: Int
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("foods")
    
    init?(name: String, calorie: Int, date: String, rating: Int) {
        self.name = name
        self.calorie = calorie
        self.date = date
        self.rating = rating
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: FoodKeys.name)
        aCoder.encode(calorie, forKey: FoodKeys.calorie)
        aCoder.encode(date, forKey: FoodKeys.date)
        aCoder.encode(rating, forKey: FoodKeys.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: FoodKeys.name) as? String,
            let calorie = aDecoder.decodeObject(forKey: FoodKeys.calorie) as? Int,
            let date = aDecoder.decodeObject(forKey: FoodKeys.date) as? String else {return nil}
        
        let rating = aDecoder.decodeInteger(forKey: FoodKeys.rating)
        self.init(name: name, calorie: calorie, date: date, rating: rating)
    }

}
