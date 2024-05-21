import Foundation
import CoreData


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "ProductModel")
    
    init() {
        container.loadPersistentStores{ desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved successfully!")
        } catch {
            print("Data was not saved")
        }
    }
    
    
    func addProduct(name: String, cost: Decimal, image: String, category: String, productDescription: String?, context: NSManagedObjectContext, isFav: Bool?, minAmount: Decimal = 1 ){
        let product = Product(context: context)
        product.id = UUID()
        product.name = name
        product.cost = (cost) as NSDecimalNumber
        product.image = image
        product.category = category
        product.productDescription = productDescription
        product.isFav = isFav ?? false
        product.minAmount = (minAmount) as NSDecimalNumber
        
        save(context: context)
    }
    
}


enum Category: String, CaseIterable {
    case drinks = "drinks"
    case fruits = "fruits"
    case vegetables = "vegetables"
    case breadAndPastries = "bread & pastries"
}
