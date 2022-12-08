//
//  QuestionsViewController.swift
//  YourKitchen
//
//  Created by Kate on 03.12.2022.
//

import UIKit

class FirstQuestionViewController: UIViewController {
    
    //MARK: - IBOtlets
    
    @IBOutlet var questionProgressView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var groceryStackView: UIStackView!
    @IBOutlet var groceryList: UITableView!
    
    @IBOutlet var backgroundImage: UIImageView!
    
    // MARK: - Private Properties
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answersChosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? SecondQuestionViewController else { return }
        resultVC.answers = answersChosen
    }
    
    //MARK: - IBActions
    
    @IBAction func multipleButtonAnswerPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showSecondQuestion", sender: nil)
    }
}

// MARK: - Methods

// TableView Settings

extension FirstQuestionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentAnswers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = groceryList.dequeueReusableCell(withIdentifier: "food")
        var content = cell?.defaultContentConfiguration()
        let grocery = currentAnswers[indexPath.row]
        content?.text = grocery.title
        cell?.contentConfiguration = content
        cell?.selectionStyle = .none
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        groceryList.cellForRow(at: indexPath)?.accessoryType = .checkmark
        answersChosen.append(currentAnswers[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        groceryList.cellForRow(at: indexPath)?.accessoryType = .none
        let cell = groceryList.cellForRow(at: indexPath)
        if cell?.isSelected == false {
            answersChosen.remove(at: indexPath.row)
        }
    }
}

extension FirstQuestionViewController {
    private func updateUI() {
        
        let currentQuestion = questions[questionIndex]
        
        questionLabel.text = currentQuestion.title
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        questionProgressView.setProgress(totalProgress, animated: true)
        
        title = "Шаг \(questionIndex + 1)"
    }
}

