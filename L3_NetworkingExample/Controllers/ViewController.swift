//
//  ViewController.swift
//  L3_NetworkingExample
//
//  Created by Ihor Malovanyi on 28.10.2022.
//

import UIKit

class ViewController: UIViewController {

    
//    #if DEBUG
//    let host = "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/test"
//    #else
//    let host = "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/prod"
//    #endif
//    
//    
//    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "X-RapidAPI-Key": "",
            "X-RapidAPI-Host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]
        
//        var networkService = AlamoNetworking<RecipesEndpoint>("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com", headers: headers)
//
//        Task {
//            let data = try await networkService.perform(.post, .analyzer, RecipeAnalyzeInstruction("Fried potatoe with chicken, onions and cheese"))
//            print(try! JSONSerialization.jsonObject(with: data!))
//        }
        
        
        
//        networkService.perform(.post, .analyzer, RecipeAnalyzeInstruction("Fried potatoe with chicken, onions and cheese")) { result in
//            switch result {
//            case .data(let data):
//                print(try! JSONSerialization.jsonObject(with: data!))
//            case .error(let error): break
//            }
//        }
        
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

