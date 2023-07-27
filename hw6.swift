protocol MenuProtocol {
    var cost: Double { get }
    var name: String { get }
}

struct Tea: MenuProtocol{   
    enum TeaType {
        case black
        case green
        case purple
    }  

    private var type: TeaType
    private var name: String {TeaType.rawValue + " tea"}
    private var cost: Double
     
    init(cost: Double, type: TeaType) {
         self.cost = cost
         self.type = type
    }
     
    func getCost(sale: Int) -> Double {
        guard sale <= 50 else {
            print("Невозможно применить скидку")
            return cost
        }

        return cost - cost * Double(sale) / 100
    }
}



// 1. Создать структуру работника пиццерии. В ней должны быть такие свойства, как имя, зарплата и должность.
// Должностей пока может быть две: или кассир, или повар.
// Добавить в класс пиццерии массив с работниками.
struct Worker {
    enum Position {
        case kassier
        case kitchener
    }

    var name: String
    var salary: Double
    var position: Position
}

class Cafe {
    private var menu: [MenuProtocol]
    private var worker: [Worker]
    
    init(menu: [MenuProtocol], worker: [Worker]) {
        self.menu = menu
        self.worker = worker
    }
}

// 2. Создать класс столика. В нём должны быть свойство, в котором содержится количество мест, и функция, 
// которая на вход принимает количество гостей, которое хотят посадить, возвращает true, если места хватает,
//  и false, если места не хватает. Изначальное количество мест задаётся в инициализаторе.
class Table {
    private var places: Int

    init (places: Int) {
        self.places = places
    }

    func guestsCountCheck (place: Int) -> Bool {
        let result = self.places > place ? true : false
        return result
    }
}

var table1 = Table (places: 10)
print(table1.guestsCountCheck(place: 11)) // false
var table12 = Table (places: 10)
print(table1.guestsCountCheck(place: 7)) // true

// 3. Добавить в класс пиццерии свойство, в котором хранится массив столиков. У класса столика добавить свойство,
// в котором хранится кафе, в котором стоит столик. Столики создаются сразу в инициализаторе, не передаются туда в качестве параметра.