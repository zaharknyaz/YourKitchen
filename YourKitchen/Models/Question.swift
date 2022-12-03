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
                title: "Какую пищу предпочитаете?",
                responseType: .single,
                answers: [
                    Answer(title: "Стейк", dish: .borsch),
                    Answer(title: "Рыба", dish: .friedegg),
                    Answer(title: "Морковь", dish: .cheesecakes),
                    Answer(title: "Кукуруза", dish: .mashedpotatoes)
                ]
            ),
            Question(
                title: "Что вам нравиться больше?",
                responseType: .multiple,
                answers: [
                    Answer(title: "Плавать", dish: .borsch),
                    Answer(title: "Спать", dish: .friedegg),
                    Answer(title: "Обниматься", dish: .cheesecakes),
                    Answer(title: "Есть", dish: .mashedpotatoes)
                ]
            ),
            Question(
                title: "Любите ли вы поездки на машине?",
                responseType: .ranged,
                answers: [
                    Answer(title: "Ненавижу", dish: .friedegg),
                    Answer(title: "Нервничаю", dish: .cheesecakes),
                    Answer(title: "Не замечаю", dish: .mashedpotatoes),
                    Answer(title: "Обожаю", dish: .borsch)
                ]
            )
        ]
    }
}

