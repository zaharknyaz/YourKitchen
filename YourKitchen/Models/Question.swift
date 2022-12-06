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
    let dish: [Dish]
}

enum Dish: String {
    case borschsoup = "Суп борщ"
    case vegetablesoup = "Суп овощной"
    case tomyamsoup = "Суп том ям"
    case mushroomsoup = "Суп грибной"
    case uhasoup = "Суп уха"
    case okroshkasoup = "Окрошка"
    case pastapoflotski = "Макароны по-флотски"
    case chickenpilaf = "Плов из курицы"
    case buckwheatporridge = "Гречневая каша с грибами"
    case semolinaporridge = "Манная каша"
    case speltporridge = "Каша из Полбы"
    case friedegg = "Яичница"
    case omelet = "Омлет"
    case pashotegg = "Яйца пашот"
    case cheesecakes = "Сырники"
    case mashedpotatoes = "Картофельное пюре"
    case meatball = "Котлеты"
    case caesarsalad = "Салат цезарь"
    case oliviersalad = "Салат оливье"
    case herringunderafurcoatsalad = "Салат селедка под шубой"
    case capercaillienestsalad = "Салат гнездо глухаря"
    case crabsalad = "Салат крабовый"
    case greeksalad = "Салат греческий"
    case mimosasalad = "Салат мимоза"
    case applecompote = "Яблочный компот"
    case charlottepie = "Пирог шарлотка"
    
    var definition: String {
        switch self {
        case .borschsoup:
            return "Рецепт супа борщ"
        case .vegetablesoup:
            return "Рецепт супа овощной"
        case .tomyamsoup:
            return "Рецепт супа том ям"
        case .mushroomsoup:
            return "Рецепт супа грибной"
        case .uhasoup:
            return "Рецепт супа уха"
        case .okroshkasoup:
            return "Рецепт окрошки"
        case .pastapoflotski:
            return "Рецепт макарон по-флотски"
        case .chickenpilaf:
            return "Рецепт плов из курицы"
        case .buckwheatporridge:
            return "Рецепт гречневой каши с грибами"
        case .semolinaporridge:
            return "Рецепт манной каши"
        case .speltporridge:
            return "Рецепт каши из Полбы"
        case .friedegg:
            return "Рецепт яичницы"
        case .omelet:
            return "Рецепт омлета"
        case .pashotegg:
            return "Рецепт яйца пашот"
        case .cheesecakes:
            return "Рецепт сырников"
        case .mashedpotatoes:
            return "Рецепт картофельного пюре"
        case .meatball:
            return "Рецепт котлет"
        case .caesarsalad:
            return "Рецепт салата цезарь"
        case .oliviersalad:
            return "Рецепт салата оливье"
        case .herringunderafurcoatsalad:
            return "Рецепт салата селедка под шубой"
        case .capercaillienestsalad:
            return "Рецепт салата гнездо глухаря"
        case .crabsalad:
            return "Рецепт крабового салата"
        case .greeksalad:
            return "Рецепт греческого салата"
        case .mimosasalad:
            return "Рецепт салата мимоза"
        case .applecompote:
            return "Рецепт яблочного компота"
        case .charlottepie:
            return "Рецепт пирога шарлотка"
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
                    Answer(title: "Мясо", dish: [.borschsoup, .chickenpilaf, .capercaillienestsalad, .caesarsalad]),
                    Answer(title: "Куриные яйца", dish: [.friedegg, .pashotegg, .capercaillienestsalad, .omelet]),
                    Answer(title: "Творог", dish: [.cheesecakes]),
                    Answer(title: "Картофель", dish: [.mashedpotatoes, .borschsoup, .mushroomsoup]),
                    Answer(title: "Грибы", dish: [.mushroomsoup]),
                    Answer(title: "Гречневая крупа", dish: [.buckwheatporridge]),
                    Answer(title: "Манная крупа", dish: [.semolinaporridge]),
                    Answer(title: "Мясной фарш", dish: [.meatball, .pastapoflotski]),
                    Answer(title: "Зеленый горошек", dish: [.oliviersalad]),
                    Answer(title: "Крупа полба", dish: [.speltporridge]),
                    Answer(title: "Оливки", dish: [.greeksalad]),
                    Answer(title: "Рыба", dish: [.herringunderafurcoatsalad, .uhasoup]),
                    Answer(title: "Рис", dish: [.chickenpilaf]),
                    Answer(title: "Макароны", dish: [.pastapoflotski]),
                    Answer(title: "Свекла", dish: [.borschsoup, .herringunderafurcoatsalad, .vegetablesoup]),
                    Answer(title: "Морковь", dish: [.borschsoup, .mimosasalad, .vegetablesoup]),
                    Answer(title: "Квас", dish: [.okroshkasoup]),
                    Answer(title: "Лук", dish: [.okroshkasoup, .greeksalad, .oliviersalad, .borschsoup, .meatball, .vegetablesoup]),
                    Answer(title: "Огурцы", dish: [.okroshkasoup, .greeksalad, .oliviersalad, .vegetablesoup]),
                    Answer(title: "Помидоры", dish: [.okroshkasoup, .greeksalad, .oliviersalad, .vegetablesoup]),
                    Answer(title: "Майонез", dish: [.oliviersalad]),
                    Answer(title: "Сметана", dish: [.oliviersalad, .borschsoup]),
                    Answer(title: "Подсолнечное масло", dish: [.greeksalad, .friedegg, .pashotegg, .capercaillienestsalad, .omelet]),
                    Answer(title: "Сыр", dish: [.greeksalad]),
                    Answer(title: "Крабовые палочки", dish: [.crabsalad]),
                    Answer(title: "Яблоки", dish: [.applecompote, .charlottepie])
                ]
            ),
            Question(
                title: "На чем Вы будете готовить?",
                responseType: .single,
                answers: [
                    Answer(title: "Газовая плита", dish: [.borschsoup, .mushroomsoup, .buckwheatporridge, .uhasoup, .semolinaporridge, .speltporridge, .friedegg, .omelet, .pashotegg, .vegetablesoup, .pastapoflotski, .tomyamsoup, .chickenpilaf, .meatball]),
                    Answer(title: "Духовка", dish: [.charlottepie, .chickenpilaf, .meatball]),
                    Answer(title: "Микроволновка", dish: [.cheesecakes]),
                    Answer(title: "Миксер", dish: [.mashedpotatoes]),
                    Answer(title: "Без термической обработки", dish: [.greeksalad, .oliviersalad, .crabsalad, .mimosasalad, .okroshkasoup])
                ]
            ),
            Question(
                title: "Выберите время готовки",
                responseType: .ranged,
                answers: [
                    Answer(title: "5 минут", dish: [.friedegg, .pashotegg, .omelet]),
                    Answer(title: "10 минут", dish: [.cheesecakes]),
                    Answer(title: "30 минут", dish: [.mashedpotatoes, .pastapoflotski, .greeksalad, .oliviersalad, .crabsalad, .caesarsalad, .capercaillienestsalad, .mimosasalad, .herringunderafurcoatsalad, .buckwheatporridge, .semolinaporridge, .speltporridge, .meatball, .applecompote, .meatball]),
                    Answer(title: "1 час", dish: [.borschsoup, .mushroomsoup, .uhasoup, .charlottepie, .vegetablesoup, .tomyamsoup, .chickenpilaf])
                ]
            )
        ]
    }
}

