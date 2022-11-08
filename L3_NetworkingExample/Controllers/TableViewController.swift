//
//  TableViewController.swift
//  L3_NetworkingExample
//
//  Created by lera on 07.11.2022.
//

import UIKit

class TableViewController: UIViewController {
    let apiAlamofire = ApiAlamofire()
    let apiSession = ApiSesson()
    
    @IBAction func GuessNutrition(_ sender: Any) {
        Task {
            let data = try? await apiAlamofire.searchNutrition(title: "Spaghetti Aglio et Olio")
            if let data = data {
                print(data)
            } else {
                print("Error!")
            }
        }
    }
    @IBAction func SearchRecipes(_ sender: Any) {
            Task {
                let data = try? await apiAlamofire.searchRecipes(text: "pasta")
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
            let data = try? await apiAlamofire.classifyCuisine(ingredientList: "3 oz pork shoulder", title: "Pork roast with green beans")
            if let data = data {
                print(data)
            } else {
                print("Error!")
            }
        }
        
        Task {
            let data = try? await apiAlamofire.getRecipeDetails(id: 479101)
            if let data = data {
                print(data)
            } else {
                print("Error!")
            }
        }
    }

}
