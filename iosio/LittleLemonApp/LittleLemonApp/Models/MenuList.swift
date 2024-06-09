import Foundation
import CoreData

struct MenuList: Codable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
    
    static func getMenuData(viewContext: NSManagedObjectContext) async {
        PersistenceController.shared.clear()
        
        guard let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let fullMenu = try decoder.decode(MenuList.self, from: data)
            
            // Perform Core Data operations on a background context
            let backgroundContext = PersistenceController.shared.container.newBackgroundContext()
            backgroundContext.perform {
                for dish in fullMenu.menu {
                    let newDish = Dish(context: backgroundContext)
                    newDish.title = dish.title
                    newDish.price = dish.price
                    newDish.descriptionDish = dish.descriptionDish
                    newDish.image = dish.image
                    newDish.category = dish.category
                }
                
                do {
                    try backgroundContext.save()
                    print("Menu data saved successfully.")
                } catch {
                    print("Failed to save menu data: \(error.localizedDescription)")
                }
            }
        } catch {
            print("Failed to fetch menu data: \(error.localizedDescription)")
        }
    }
}
