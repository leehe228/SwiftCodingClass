class Car {
    var make: String
    var model: String
    var year: Int
    
    init(make: String, model: String, year: Int) {
        self.make = make
        self.model = model
        self.year = year
    }
    
    func info() -> String {
        return "\(self.make) \(self.model), Year: \(self.year)"
    }
}

var car1 = Car(make: "Toyota", model: "Corolla", year: 2020)
print("Car 1: \(car1.info())")
