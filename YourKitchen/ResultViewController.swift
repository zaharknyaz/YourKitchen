//
//  ResultViewController.swift
//  YourKitchen
//
//  Created by MAcbook on 04.12.2022.
//

import UIKit

class ResultViewController: UITableViewController {
    
    var answers: [Answer]!
    var mostFrequencyDishes: [Dish]!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mostFrequencyDishes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellDish = tableView.dequeueReusableCell(withIdentifier: "cellDish", for: indexPath)
        let dishToChoose = mostFrequencyDishes[indexPath]
        var content = cellDish.defaultContentConfiguration()
        content.text = "\(dishToChoose)"
        cellDish.contentConfiguration = content
        return cellDish
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
}

// MARK: - Private Methods
extension ResultViewController {
    private func updateResult() {
        
        var frequencyOfDishes: [Dish: Int] = [:]
        let dishes = answers.map { $0.dish }
        
        for dish in dishes {
            if let dishTypeCount = frequencyOfDishes[dish] {
                frequencyOfDishes.updateValue(dishTypeCount + 1, forKey: dish)
            } else {
                frequencyOfDishes[dish] = 1
            }
        }

        let sortedFrequencyOfDishes = frequencyOfDishes.sorted { $0.value > $1.value }
        
        guard let mostFrequencyDish = sortedFrequencyOfDishes.first?.key else { return }
        guard let mostFrequencyDishesValue = sortedFrequencyOfDishes.first?.value else { return }
    
        mostFrequencyDishes = [mostFrequencyDish]

        for sortedFrequencyOfDish in sortedFrequencyOfDishes {
            if sortedFrequencyOfDish.value == mostFrequencyDishesValue && sortedFrequencyOfDish.key != mostFrequencyDish {
                mostFrequencyDishes.append(sortedFrequencyOfDish.key)
            }
        }
    }
}
