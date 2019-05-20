//
//  FoodTableViewController.swift
//  mtechChallenge2
//
//  Created by Tyler Donohue on 5/16/19.
//  Copyright © 2019 Tyler Donohue. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var foods = [Food]()

    override func viewDidLoad() {
        super.viewDidLoad()
        changeBackground()
        
    }
    
    func changeBackground() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "GP")
        backgroundImage.contentMode = UIView.ContentMode.scaleToFill
        self.tableView.backgroundView = backgroundImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foods.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as? FoodTableViewCell else { return UITableViewCell() }
        tableView.rowHeight = 100

        cell.food = foods[indexPath.row]
        
        return cell
    }
    
    @IBAction func addFoodButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "addFood", sender: nil)
    }
    
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        if let source = segue.source as? EntryFieldViewController, let food = source.food {
            print(food)
            foods.append(food)
            tableView.reloadData()
        } else {
            print("error")
        }
        
    }
    
}
