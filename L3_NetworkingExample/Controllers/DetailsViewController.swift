//
//  DetailsViewController.swift
//  L3_NetworkingExample
//
//  Created by lera on 07.11.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet private weak var cusine: UILabel!
    @IBOutlet private weak var ingredients: UILabel!
    @IBOutlet private weak var instruction: UILabel!
    @IBOutlet private weak var summary: UILabel!
    @IBOutlet private weak var serving: UILabel!
    @IBOutlet private weak var dishTitle: UILabel!
    @IBOutlet private weak var pricePerServing: UILabel!
    @IBOutlet private weak var cookingMinutes: UILabel!
    @IBOutlet private weak var preparationMinutes: UILabel!
    @IBOutlet private weak var vegan: UILabel!
    @IBOutlet private weak var vegetarian: UILabel!
    
    let apiAlamofire = ApiAlamofire()
    var dish: RecipeQuery!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var ingridientsString = ""
        Task {
            do {
                let data = try await apiAlamofire.getRecipeDetails(id: dish.id)
                self.vegetarian.text = String(data.vegetarian)
                self.vegan.text = String(data.vegan)
                self.preparationMinutes.text = String(data.preparationMinutes)
                self.cookingMinutes.text = String(data.cookingMinutes)
                self.pricePerServing.text = String(data.pricePerServing)
                self.dishTitle.text = data.title
                self.serving.text = String(data.servings)
                self.summary.text = data.summary
                self.instruction.text = data.instructions
                for i in data.extendedIngredients {
                    ingridientsString += i.name + " "
                }
                self.ingredients.text = ingridientsString
            } catch {
                print("\(error)")
            }
        }
        Task {
            do {
                let data = try await apiAlamofire.classifyCuisine(ingredientList: ingridientsString , title: dishTitle.text!)
                print(data)
                self.cusine.text = data.cuisine
            } catch {
                print("Error!")
            }
        }
        
    }

}
