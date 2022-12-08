//
//  SecondQuestionViewController.swift
//  YourKitchen
//
//  Created by Kate on 07.12.2022.
//

import UIKit

class SecondQuestionViewController: UIViewController {
    
    //MARK: - IBOtlets
    @IBOutlet var questionProgressView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var singleButtons: [UIButton]!
    
    // MARK: - Public Properties
    var answers: [Answer]!
    
    // MARK: - Private Properties
    private let questions = Question.getQuestions()
    private var questionIndex = 1
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        setUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ThirdQuestionViewController else { return }
        resultVC.answers = answers
    }
    
    //MARK: - IBActions
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[buttonIndex]
         answers.append(currentAnswer)
        performSegue(withIdentifier: "showThirdQuestion", sender: nil)
    }
}

// MARK: - Private Methods
extension SecondQuestionViewController {
    private func setUI() {
        backgroundImageView.image = UIImage(named: "1")
        let currentQuestion = questions[questionIndex]
        
        questionLabel.text = currentQuestion.title
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        questionProgressView.setProgress(totalProgress, animated: true)
        
        title = "Шаг \(questionIndex + 1)"
        
        setButtons(with: currentAnswers)
        
    }
}

extension SecondQuestionViewController {
    private func setButtons(with answers: [Answer]) {
        for (button, answer) in zip(singleButtons, answers) {
                button.setTitle(answer.title, for: .normal)
            }
    }
    
}
