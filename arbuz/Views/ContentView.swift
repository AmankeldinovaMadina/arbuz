//
//  ContentView.swift
//  arbuz
//
//  Created by Madina Amankeldinova on 17.05.2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment (\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var product: FetchedResults<Product>

    
    var body: some View {
        NavigationView {
            List {
                ForEach(product) { product in
                    VStack(alignment: .leading) {
                        // Display the image
                        Image(product.image ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        
                        Text(product.name ?? "Unknown Product")
                            .font(.headline)
                        Text(product.productDescription ?? "No Description")
                            .font(.subheadline)
                        Text("Cost: \(String(describing: product.cost))")
                            .font(.subheadline)
                        Text("Category: \(product.category ?? "No Category")")
                            .font(.subheadline)
                    }
                    .padding()
                }
            }
            .navigationTitle("Products")
            .onAppear {
                addInitialProducts(context: managedObjectContext)
            }
        }
    }
    
    
    func addInitialProducts(context: NSManagedObjectContext) {
            // Drinks
            DataController().addProduct(name: "Cola", cost: 200, image: "cola", category: "drinks", productDescription: "Освежающий газированный напиток с классическим вкусом. Отличный выбор для утоления жажды в жаркий день.", context: managedObjectContext)
            DataController().addProduct(name: "Orange Juice", cost: 350, image: "orange_juice", category: "drinks", productDescription: "Натуральный апельсиновый сок, богатый витаминами и антиоксидантами. Прекрасно подходит для завтрака или в качестве освежающего напитка в течение дня.", context: managedObjectContext)
            DataController().addProduct(name: "Mineral Water", cost: 150, image: "mineral_water", category: "drinks", productDescription: "Чистая минеральная вода для поддержания вашего здоровья. Помогает восстановить водный баланс и освежает.", context: managedObjectContext)
            DataController().addProduct(name: "Green Tea", cost: 250, image: "green_tea", category: "drinks", productDescription: "Зелёный чай в бутылке с нежным ароматом и освежающим вкусом. Полезен для здоровья и способствует улучшению настроения.", context: managedObjectContext)
            DataController().addProduct(name: "Lemonade", cost: 220, image: "lemonade", category: "drinks", productDescription: "Лимонный напиток с ярким и освежающим вкусом. Идеален для утоления жажды и поднятия настроения.", context: managedObjectContext)
            DataController().addProduct(name: "Coffee", cost: 300, image: "coffee", category: "drinks", productDescription: "Холодный кофе с насыщенным вкусом и бодрящим эффектом. Отлично подходит для утреннего пробуждения или в качестве перекуса.", context: managedObjectContext)
            DataController().addProduct(name: "Apple Juice", cost: 320, image: "apple_juice", category: "drinks", productDescription: "Свежевыжатый яблочный сок, богатый витаминами и минералами. Вкусный и полезный напиток для всей семьи.", context: managedObjectContext)
            DataController().addProduct(name: "Milkshake", cost: 400, image: "milkshake", category: "drinks", productDescription: "Клубничный молочный коктейль с кремовой текстурой и ярким вкусом. Идеален для сладкого перекуса или десерта.", context: managedObjectContext)
            DataController().addProduct(name: "Energy Drink", cost: 270, image: "energy_drink", category: "drinks", productDescription: "Энергетический напиток для бодрости и повышения производительности. Поможет справиться с усталостью и сохранить концентрацию.", context: managedObjectContext)
            
            // Fruits
            DataController().addProduct(name: "Apple", cost: 100, image: "apple", category: "fruits", productDescription: "Свежие красные яблоки, сочные и сладкие. Идеальны для перекуса или приготовления десертов.", context: managedObjectContext)
            DataController().addProduct(name: "Banana", cost: 180, image: "banana", category: "fruits", productDescription: "Спелые бананы, богатые калием и витаминами. Прекрасный выбор для быстрого перекуса или добавления в смузи.", context: managedObjectContext)
            DataController().addProduct(name: "Orange", cost: 200, image: "orange", category: "fruits", productDescription: "Сочные апельсины с ярким вкусом и ароматом. Отличный источник витамина С для поддержания иммунитета.", context: managedObjectContext)
            DataController().addProduct(name: "Grapes", cost: 250, image: "grapes", category: "fruits", productDescription: "Виноград без косточек, сладкий и сочный. Подходит для перекуса, добавления в салаты и десерты.", context: managedObjectContext)
            DataController().addProduct(name: "Kiwi", cost: 300, image: "kiwi", category: "fruits", productDescription: "Свежие киви с нежной мякотью и ярким вкусом. Богат витамином С и антиоксидантами, полезен для здоровья.", context: managedObjectContext)
            DataController().addProduct(name: "Pineapple", cost: 400, image: "pineapple", category: "fruits", productDescription: "Свежий ананас, сочный и сладкий. Отличный выбор для перекуса или приготовления экзотических блюд.", context: managedObjectContext)
            DataController().addProduct(name: "Mango", cost: 350, image: "mango", category: "fruits", productDescription: "Сладкий манго с нежной мякотью и ярким ароматом. Прекрасный источник витаминов и минералов для вашего здоровья.", context: managedObjectContext)
            DataController().addProduct(name: "Strawberry", cost: 220, image: "strawberry", category: "fruits", productDescription: "Свежая клубника с насыщенным вкусом и ароматом. Идеальна для десертов, смузи и здоровых перекусов.", context: managedObjectContext)
            DataController().addProduct(name: "Watermelon", cost: 500, image: "watermelon", category: "fruits", productDescription: "Спелый арбуз, сочный и сладкий. Прекрасный выбор для летнего перекуса и утоления жажды.", context: managedObjectContext)
            DataController().addProduct(name: "Peach", cost: 270, image: "peach", category: "fruits", productDescription: "Сочные персики с нежной мякотью и сладким вкусом. Идеальны для перекуса или добавления в десерты и выпечку.", context: managedObjectContext)
            
            // Vegetables
            DataController().addProduct(name: "Carrot", cost: 120, image: "carrot", category: "vegetables", productDescription: "Свежая морковь, хрустящая и сладкая. Богата витаминами и минералами, полезна для зрения и иммунитета.", context: managedObjectContext)
            DataController().addProduct(name: "Tomato", cost: 150, image: "tomato", category: "vegetables", productDescription: "Спелые помидоры с насыщенным вкусом и ароматом. Прекрасный выбор для салатов, соусов и закусок.", context: managedObjectContext)
            DataController().addProduct(name: "Cucumber", cost: 140, image: "cucumber", category: "vegetables", productDescription: "Хрустящие огурцы, освежающие и полезные. Идеальны для салатов и здорового перекуса.", context: managedObjectContext)
            DataController().addProduct(name: "Bell Pepper", cost: 200, image: "bell_pepper", category: "vegetables", productDescription: "Сладкий болгарский перец с ярким цветом и вкусом. Богат витаминами и антиоксидантами, полезен для здоровья.", context: managedObjectContext)
            DataController().addProduct(name: "Broccoli", cost: 300, image: "broccoli", category: "vegetables", productDescription: "Свежий брокколи, богатый витаминами и минералами. Прекрасный выбор для здорового питания и поддержания иммунитета.", context: managedObjectContext)
            DataController().addProduct(name: "Spinach", cost: 180, image: "spinach", category: "vegetables", productDescription: "Листья шпината, нежные и полезные. Богаты железом и витаминами, идеальны для салатов и смузи.", context: managedObjectContext)
            DataController().addProduct(name: "Lettuce", cost: 150, image: "lettuce", category: "vegetables", productDescription: "Салатный лист, свежий и хрустящий. Отличный выбор для салатов, сэндвичей и здоровых блюд.", context: managedObjectContext)
            DataController().addProduct(name: "Potato", cost: 90, image: "potato", category: "vegetables", productDescription: "Картофель, универсальный и вкусный. Идеален для различных блюд, от пюре до запеканок.", context: managedObjectContext)
            DataController().addProduct(name: "Onion", cost: 80, image: "onion", category: "vegetables", productDescription: "Лук репчатый, с насыщенным вкусом и ароматом. Используется в кулинарии для придания блюдам глубины вкуса.", context: managedObjectContext)
            DataController().addProduct(name: "Garlic", cost: 70, image: "garlic", category: "vegetables", productDescription: "Чеснок, ароматный и острый. Широко используется в кулинарии и обладает многочисленными полезными свойствами.", context: managedObjectContext)
            
            // Bread & Pastries
            DataController().addProduct(name: "Baguette", cost: 180, image: "baguette", category: "bread & pastries", productDescription: "Французский багет с хрустящей корочкой и нежной мякотью. Идеален для бутербродов и закусок.", context: managedObjectContext)
            DataController().addProduct(name: "Croissant", cost: 220, image: "croissant", category: "bread & pastries", productDescription: "Масляный круассан с нежной текстурой и богатым вкусом. Прекрасный выбор для завтрака или кофейной паузы.", context: managedObjectContext)
            DataController().addProduct(name: "Muffin", cost: 150, image: "muffin", category: "bread & pastries", productDescription: "Шоколадный маффин с насыщенным вкусом и ароматом. Идеален для сладкого перекуса или десерта.", context: managedObjectContext)
            DataController().addProduct(name: "Donut", cost: 100, image: "donut", category: "bread & pastries", productDescription: "Сладкий пончик с глазурью, мягкий и воздушный. Прекрасный выбор для утреннего кофе или десерта.", context: managedObjectContext)
            DataController().addProduct(name: "Rye Bread", cost: 200, image: "rye_bread", category: "bread & pastries", productDescription: "Ржаной хлеб с насыщенным вкусом и ароматом. Полезен для здоровья и отлично сочетается с различными блюдами.", context: managedObjectContext)
            DataController().addProduct(name: "Biscuit", cost: 80, image: "biscuit", category: "bread & pastries", productDescription: "Ванильное печенье с нежным вкусом и ароматом. Идеально подходит для чая или кофе.", context: managedObjectContext)
            DataController().addProduct(name: "Bagel", cost: 130, image: "bagel", category: "bread & pastries", productDescription: "Классический бублик с плотной текстурой и насыщенным вкусом. Прекрасный выбор для завтрака или перекуса.", context: managedObjectContext)
            DataController().addProduct(name: "Pretzel", cost: 110, image: "pretzel", category: "bread & pastries", productDescription: "Соленый крендель с хрустящей корочкой и мягкой сердцевиной. Идеален для перекуса или закуски.", context: managedObjectContext)
            DataController().addProduct(name: "Cake", cost: 500, image: "cake", category: "bread & pastries", productDescription: "Шоколадный торт с нежной текстурой и насыщенным вкусом. Прекрасный выбор для праздников и особых случаев.", context: managedObjectContext)
        }
}

#Preview {
    ContentView()
}
