//
//  ResultViewController.swift
//  YourKitchen
//
//  Created by MAcbook on 04.12.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        updateResult()
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
    
        // результативный массив
        // его передать в функцию для вывода таблицы на экран
        var mostFrequencyDishes = [mostFrequencyDish]
        
        for sortedFrequencyOfDish in sortedFrequencyOfDishes {
            if sortedFrequencyOfDish.value == mostFrequencyDishesValue && sortedFrequencyOfDish.key != mostFrequencyDish {
                mostFrequencyDishes.append(sortedFrequencyOfDish.key)
            }
        }
//        проверка результативного массива/вывод в консоль
//        for dish in mostFrequencyDishes {
//            print(dish)
//        }
        
        updateUI(with: mostFrequencyDish)
    }
    
    private func updateUI(with dish: Dish?) {
        animalTypeLabel.text = "Вы - \(dish?.rawValue ?? "")!"
        descriptionLabel.text = dish?.definition ?? ""
    }
    


}
