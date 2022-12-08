//
//  ThirdQuestionViewController.swift
//  YourKitchen
//
//  Created by Kate on 07.12.2022.
//

import UIKit

class ThirdQuestionViewController: UIViewController {

    @IBOutlet var questionProgressView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var cookingTimePickerView: UIPickerView!
    
    // MARK: - Pablic Properties
       var answers: [Answer]!
    
    // MARK: - Private Properties
      private let questions = Question.getQuestions()
      private var questionIndex = 2
      private var currentAnswers: [Answer] {
          questions[questionIndex].answers
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        navigationItem.hidesBackButton = true
        
        cookingTimePickerView.dataSource = self
        cookingTimePickerView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultViewController else { return }
        resultVC.answers = answers
    }
    
    
    @IBAction func showResultButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}

// MARK: - Private Methods
extension ThirdQuestionViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        currentAnswers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currentAnswers[row].title
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        answers.append(currentAnswers[row])
    }
}

extension ThirdQuestionViewController {
    private func setUI() {
        backgroundImageView.image = UIImage(named: "2")
        let currentQuestion = questions[questionIndex]
        
        questionLabel.text = currentQuestion.title
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        questionProgressView.setProgress(totalProgress, animated: true)
        
        title = "Шаг \(questionIndex + 1)"
    }
}


