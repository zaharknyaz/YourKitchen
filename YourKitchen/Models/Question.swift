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
            return "Тут должен быть Рецепт супа борщ..."
        case .vegetablesoup:
            return "Тут должен быть Рецепт супа овощной..."
        case .tomyamsoup:
            return "Тут должен быть Рецепт супа том ям..."
        case .mushroomsoup:
            return "Тут должен быть Рецепт супа грибной..."
        case .uhasoup:
            return "Тут должен быть Рецепт супа уха..."
        case .okroshkasoup:
            return "Тут должен быть Рецепт окрошки..."
        case .pastapoflotski:
            return "Тут должен быть Рецепт макарон по-флотски..."
        case .chickenpilaf:
            return "Тут должен быть Рецепт плов из курицы..."
        case .buckwheatporridge:
            return "Тут должен быть Рецепт гречневой каши с грибами..."
        case .semolinaporridge:
            return "Тут должен быть Рецепт манной каши..."
        case .speltporridge:
            return "Тут должен быть Рецепт каши из Полбы..."
        case .friedegg:
            return "Тут должен быть Рецепт яичницы..."
        case .omelet:
            return "Тут должен быть Рецепт омлета..."
        case .pashotegg:
            return "Тут должен быть Рецепт яйца пашот..."
        case .cheesecakes:
            return "Тут должен быть Рецепт сырников..."
        case .mashedpotatoes:
            return "Тут должен быть Рецепт картофельного пюре..."
        case .meatball:
            return "Тут должен быть Рецепт котлет..."
        case .caesarsalad:
            return "Тут должен быть Рецепт салата цезарь..."
        case .oliviersalad:
            return "Тут должен быть Рецепт салата оливье..."
        case .herringunderafurcoatsalad:
            return "Тут должен быть Рецепт салата селедка под шубой..."
        case .capercaillienestsalad:
            return "Тут должен быть Рецепт салата гнездо глухаря..."
        case .crabsalad:
            return "Тут должен быть Рецепт крабового салата..."
        case .greeksalad:
            return "Тут должен быть Рецепт греческого салата..."
        case .mimosasalad:
            return "Тут должен быть Рецепт салата мимоза..."
        case .applecompote:
            return "Тут должен быть Рецепт яблочного компота..."
        case .charlottepie:
            return "Тут должен быть Рецепт пирога шарлотка..."
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

