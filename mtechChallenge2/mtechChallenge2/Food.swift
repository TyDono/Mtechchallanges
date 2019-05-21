//
//  Food.swift
//  mtechChallenge2
//
//  Created by Tyler Donohue on 5/16/19.
//  Copyright © 2019 Tyler Donohue. All rights reserved.
//

import Foundation
import UIKit

class Food: Codable {
    
    struct FoodKeys {
        static let name = "name"
        static let calorie = "calorie"
        static let date = "date"
        static let rating = "rating"
       // static let foodImage = "foodImage"
    }
    
    let name: String
    let calorie: Int
    let date: String
    let rating: Int
  //  let foodImage: UIImage
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = DocumentsDirectory.appendingPathComponent("foods")
    
    init?(name: String, calorie: Int, date: String, rating: Int) {
        self.name = name
        self.calorie = calorie
        self.date = date
        self.rating = rating
        //self.foodImage = foodImage
    }
    
}

extension Food {
    
    //archive urls
    static func saveToFiles(foods: [Food]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodeData = try? propertyListEncoder.encode(foods)
        try? encodeData?.write(to: archiveURL, options: .noFileProtection)
        //encode
    }
    
    static func loadFromFile() -> [Food]?  {
        guard let loadedFood = try? Data(contentsOf: archiveURL) else {return nil}
        let decoder = PropertyListDecoder()
        return try? decoder.decode([Food].self, from: loadedFood)
    }
    
}
