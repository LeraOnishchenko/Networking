//
//  TableViewController.swift
//  L3_NetworkingExample
//
//  Created by lera on 07.11.2022.
//

import UIKit

class TableViewController: UIViewController {
    let api = API()
    
    @IBAction func GuessNutrition(_ sender: Any) {
        Task {
            let data = try? await api.searchNutrition(title: "Spaghetti Aglio et Olio")
            if let data = data {
                print(data)
            } else {
                print("Error!")
            }
        }
    }
    @IBAction func SearchRecipes(_ sender: Any) {
            Task {
                let data = try? await api.searchRecipes(text: "pasta")
                if let data = data {
                    print(data)
                } else {
                    print("Error!")
                }
            }
            
    }
    
    @IBOutlet weak var SearchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            let data = try? await api.classifyCuisine(ingredientList: "3 oz pork shoulder", title: "Pork roast with green beans")
            if let data = data {
                print(data)
            } else {
                print("Error!")
            }
        }
        
        Task {
            let data = try? await api.getRecipeDetails(id: 479101)
            if let data = data {
                print(data)
            } else {
                print("Error!")
            }
        }
    }

}
