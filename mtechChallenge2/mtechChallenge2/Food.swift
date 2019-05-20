//
//  Food.swift
//  mtechChallenge2
//
//  Created by Tyler Donohue on 5/16/19.
//  Copyright © 2019 Tyler Donohue. All rights reserved.
//

import Foundation
import UIKit

struct Food {
    
    
//    struct FoodKeys {
//        static let name = "name"
//        static let calorie = "calorie"
//        static let date = "date"
//        static let rating = "rating"
//    }
    
    let name: String
    let calorie: Int
    let date: String
    let rating: Int
    
//    init(name: String, calorie: Int, date: String, rating: Int) {
//        self.name = name
//        self.calorie = calorie
//        self.date = date
//        self.rating = rating
//    }
//
//    required convenience init?(coder aDecoder: NSCoder) {
//        guard let name = aDecoder.decodeObject(forKey: FoodKeys.name) as? String,
//            let calorie = aDecoder.decodeObject(forKey: FoodKeys.calorie) as? Int,
//            let date = aDecoder.decodeObject(forKey: FoodKeys.date) as? String,
//            let rating = aDecoder.decodeObject(forKey: FoodKeys.rating) as? Int else {return nil}
//
//        self.init(name: name, calorie: calorie, date: date, rating: rating)
//    }
//
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(name, forKey: FoodKeys.name)
//        aCoder.encode(calorie, forKey: FoodKeys.calorie)
//        aCoder.encode(date, forKey: FoodKeys.date)
//        aCoder.encode(rating, forKey: FoodKeys.rating)
//    }
//
}
