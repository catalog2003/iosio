import Foundation

struct MenuItem: Codable, Identifiable, Equatable {
    var id = UUID()
    let title: String
    let descriptionDish: String
    let price: String
    let image: String
    let category: String
    // Additional properties
    var isAvailable: Bool = true
    var dietaryInformation: [String] = []
    
    // Custom initializer
    init(title: String, descriptionDish: String, price: String, image: String, category: String, isAvailable: Bool = true, dietaryInformation: [String] = []) {
        self.title = title
        self.descriptionDish = descriptionDish
        self.price = price
        self.image = image
        self.category = category
        self.isAvailable = isAvailable
        self.dietaryInformation = dietaryInformation
    }
    
    // Equatable conformance
    static func == (lhs: MenuItem, rhs: MenuItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    // Coding keys
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case descriptionDish = "description"
        case price = "price"
        case image = "image"
        case category = "category"
    }
}
