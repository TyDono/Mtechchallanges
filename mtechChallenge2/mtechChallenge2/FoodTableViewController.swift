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
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        if let savedFoods = Food.loadFromFile() {
            foods = savedFoods
        } else {
            print("no food items listed")
        }
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
    

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return foods.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as? FoodTableViewCell else { return UITableViewCell() }
        tableView.rowHeight = 100

        cell.food = foods[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedFood = foods.remove(at: fromIndexPath.row)
        foods.insert(movedFood, at: to.row)
        tableView.reloadData()
        Food.saveToFiles(foods: foods)
    }
    
    @objc func refreshedControlActivated(sender: UIRefreshControl) {
        tableView.reloadData()
        sender.endRefreshing()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let entryFieldVC = segue.destination as? EntryFieldViewController else {return}
        
        if let indexPath = tableView.indexPathForSelectedRow,
            segue.identifier == "edit" {
            entryFieldVC.food = foods[indexPath.row]
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            foods.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        Food.saveToFiles(foods: foods)
    }
    
    @IBAction func addFoodButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "addFood", sender: nil)
    }
    
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        if let source = segue.source as? EntryFieldViewController, let food = source.food {
            print(food)
            foods.append(food)
            tableView.reloadData()
            Food.saveToFiles(foods: foods)
        } else {
            print("error")
        }
        
    }
    
}
