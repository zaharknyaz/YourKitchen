//
//  QuestionsViewController.swift
//  YourKitchen
//
//  Created by Kate on 03.12.2022.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    //MARK: - IBOtlets
    
    @IBOutlet var questionProgressView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var groceryStackView: UIStackView!
    @IBOutlet var groceryList: UITableView!
    
    @IBOutlet var cookingTimePicker: UIPickerView!
    @IBOutlet var cookingTimeStackView: UIStackView!
    
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
        guard let resultVC = segue.destination as? ResultViewController else { return }
        resultVC.answers = answersChosen
    }
    
    //MARK: - IBActions
    
    @IBAction func multipleButtonAnswerPressed(_ sender: UIButton) {
        goToNextQuestion()
    }
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[buttonIndex]
        answersChosen.append(currentAnswer)
        
        goToNextQuestion()
    }
    
    @IBAction func cookingTimeButtonPressed(_ sender: UIButton) {
        goToNextQuestion()
    }
}

//MARK: - Navigation

extension QuestionsViewController {
    private func goToNextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}

// MARK: - Methods

// TableView Settings

extension QuestionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentAnswers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = groceryList.dequeueReusableCell(withIdentifier: "food")
        var content = cell?.defaultContentConfiguration()
        let grocery = currentAnswers[indexPath.row]
        
        content?.text = grocery.title
        cell?.contentConfiguration = content
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        answersChosen.append(currentAnswers[indexPath.row])
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = groceryList.cellForRow(at: indexPath)
        if cell?.isSelected == false {
            answersChosen.remove(at: indexPath.row)
        }
    }
}

// PickerView Settings

extension QuestionsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
        answersChosen.append(currentAnswers[row])
    }
}

extension QuestionsViewController {
    private func updateUI() {
        for stackView in [groceryStackView, singleStackView, cookingTimeStackView] {
            stackView?.isHidden = true
        }
        let currentQuestion = questions[questionIndex]
        
        questionLabel.text = currentQuestion.title
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        questionProgressView.setProgress(totalProgress, animated: true)
        
        title = "Шаг \(questionIndex + 1)"
        
        showCurrentAnswers(for: currentQuestion.responseType)
        
        cookingTimePicker.dataSource = self
        cookingTimePicker.delegate = self
    }
    
    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single: showSingleStack(with: currentAnswers)
        case .multiple: showGroceryStack(with: currentAnswers)
        case .ranged: showCookingTimeStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStack(with answers: [Answer]) {
        singleStackView.isHidden = false
        backgroundImage.image = UIImage(named: "2")
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }
    
    private func showGroceryStack(with answers: [Answer]) {
        groceryStackView.isHidden = false
        groceryList.backgroundView = UIImageView(image: UIImage.init(named: "kitchen"))
    }
    
    private func showCookingTimeStackView(with answers: [Answer]) {
        cookingTimeStackView.isHidden = false
        backgroundImage.image = UIImage(named: "1")
    }
}

