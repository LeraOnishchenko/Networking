//
//  TableViewController.swift
//  L3_NetworkingExample
//
//  Created by lera on 07.11.2022.
//

import UIKit

class TableViewController: UIViewController {

    @IBAction func GuessNutrition(_ sender: Any) {
    }
    @IBAction func SearchRecipes(_ sender: Any) {
        
    }
    
    @IBOutlet weak var SearchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "X-RapidAPI-Key": "986d6faf28msh99d69d453c92914p1200d0jsn52127695f66d",
            "X-RapidAPI-Host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]
        do {
            var networkService = try Network<RecipesEndpoint>(
                "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
                headers: headers
            )

            Task {
                let data = try? await networkService.perform(.post, .analyzer, RecipeAnalyzeInstruction("Fried potatoe with chicken, onions and cheese"))

                print(try! JSONSerialization.jsonObject(with: data!))
            }
        } catch {
            print(error)
        }

    }

}
