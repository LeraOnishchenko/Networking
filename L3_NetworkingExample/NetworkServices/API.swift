//
//  API.swift
//  L3_NetworkingExample
//
//  Created by Yaroslav Valentyi on 07.11.2022.
//

import Foundation

protocol NetworkRequestBodyConvertible {
    
    var data: Data? { get }
    var queryItems: [URLQueryItem]? { get }
    var parameters: [String : Any]? { get }
    
}

struct RecipeSearchInstruction: NetworkRequestBodyConvertible {
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    var data: Data? {
        "query=\(text)".data(using: .utf8)
    }
    
    var queryItems: [URLQueryItem]? {
        [URLQueryItem(name: "query",value: text)]
    }
    
    var parameters: [String : Any]? {
        ["query" : text]
    }
}

struct NutritionSearchInstruction: NetworkRequestBodyConvertible {
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    var data: Data? {
        "title=\(text)".data(using: .utf8)
    }
    
    var queryItems: [URLQueryItem]? {
        [URLQueryItem(name: "title", value: text)]
    }
    
    var parameters: [String : Any]? {
        ["title" : text]
    }
    
    
}

struct CuisineClassifyInstruction: NetworkRequestBodyConvertible {
    var title: String
    var ingredientList: String
    
    init(title: String, ingredientList: String) {
        self.title = title
        self.ingredientList = ingredientList
    }
    
    var data: Data? {
        "title=\(title), ingredientList=\(ingredientList)".data(using: .utf8)
    }
    
    var queryItems: [URLQueryItem]? {
        [URLQueryItem(name: "title", value: title), URLQueryItem(name: "ingredientList", value: ingredientList)]
    }
    
    var parameters: [String : Any]? {
        ["title": title, "ingredientList": ingredientList]
    }
}

protocol Endpoint {
    
    var pathComponent: String { get }
    
}

enum RecipesEndpoint: Endpoint {
    
    case searchRecipes
    case searchNutrition
    case classifyCuisine
    case recipeDetails(Int)
    
    var pathComponent: String {
        switch self {
        case .searchRecipes:
            return "recipes/complexSearch"
        case .searchNutrition:
            return "recipes/guessNutrition"
        case .classifyCuisine:
            return "recipes/cuisine"
        case .recipeDetails(let id):
            return "recipes/\(id)/information"
        }
    }
    
}

struct API {
    var headers: [String : String]
    var decoder = JSONDecoder()
    var networkService: Network<RecipesEndpoint>
    
    init() {
        self.headers = ["X-RapidAPI-Key": "aaad93cf7cmsh83e06d4766f7484p1d12b3jsn60d276eddd06",
                        "X-RapidAPI-Host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"]
        self.networkService = try! Network<RecipesEndpoint>("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com", headers: headers)
    }
    
    func searchRecipes(text: String) async throws -> RecipesQueryResponse? {
        do {
            let data = try await self.networkService.perform(.get, .searchRecipes, RecipeSearchInstruction(text: text))
            return try decoder.decode(RecipesQueryResponse.self, from: data)
        } catch {
            print(error)
        }
        return nil
    }
    
    func searchNutrition(title: String) async throws -> NutritionQueryResponse? {
        do {
            let data = try await self.networkService.perform(.get, .searchNutrition, NutritionSearchInstruction(text: title))
            return try decoder.decode(NutritionQueryResponse.self, from: data)
        } catch {
            print(error)
        }
        return nil
    }
    
    func classifyCuisine(ingredientList: String, title: String) async throws -> CuisineRequestResponse? {
        do {
            let data = try await self.networkService.perform(.post, .classifyCuisine, CuisineClassifyInstruction(title: title, ingredientList: ingredientList))
            return try decoder.decode(CuisineRequestResponse.self, from: data)
        } catch {
            print(error)
        }
        return nil
    }
    
    func getRecipeDetails(id: Int) async throws -> RecipeInformationResponse? {
        do {
            let data = try await self.networkService.perform(.get, .recipeDetails(id))
            return try decoder.decode(RecipeInformationResponse.self, from: data)
        } catch {
            print(error)
        }
        return nil
    }
}
