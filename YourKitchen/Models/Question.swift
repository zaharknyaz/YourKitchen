//
//  Question.swift
//  YourKitchen
//
//  Created by Захар Князев on 03.12.2022.
//

struct Question {
    let title: String
    let responseType: ResponseType
    let answers: [Answer]
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Answer {
    let title: String
    let dish: Dish
}

enum Dish: String {
    case borsch = "Борщ"
    case friedegg = "Яичница"
    case cheesecakes = "Сырники"
    case mashedpotatoes = "Картофельное пюре"
    
    var definition: String {
        switch self {
        case .borsch:
            return "Рецепт борща"
        case .friedegg:
            return "Рецепт яичницы"
        case .cheesecakes:
            return "Рецепт сырников"
        case .mashedpotatoes:
            return "Рецепт картофельного пюре"
        }
    }
}

extension Question {
    static func getQuestions() -> [Question] {
        [
            Question(
                title: "Какие продукты у Вас есть?",
                responseType: .multiple,
                answers: [
                    Answer(title: "Мясо", dish: .borsch),
                    Answer(title: "Куриные яйца", dish: .friedegg),
                    Answer(title: "Творог", dish: .cheesecakes),
                    Answer(title: "Картофель", dish: .mashedpotatoes)
                ]
            ),
            Question(
                title: "На чем Вы будете готовить?",
                responseType: .single,
                answers: [
                    Answer(title: "Газовая плита", dish: .borsch),
                    Answer(title: "Духовка", dish: .friedegg),
                    Answer(title: "Микроволновка", dish: .cheesecakes),
                    Answer(title: "Миксер", dish: .mashedpotatoes)
                ]
            ),
            Question(
                title: "Выберите время готовки",
                responseType: .ranged,
                answers: [
                    Answer(title: "5 минут", dish: .friedegg),
                    Answer(title: "10 минут", dish: .cheesecakes),
                    Answer(title: "30 минут", dish: .mashedpotatoes),
                    Answer(title: "1 час", dish: .borsch)
                ]
            )
        ]
    }
}

