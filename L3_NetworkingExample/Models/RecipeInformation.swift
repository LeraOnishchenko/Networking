//
//  RecipeInformation.swift
//  L3_NetworkingExample
//
//  Created by Yaroslav Valentyi on 07.11.2022.
//

import Foundation

struct Ingredient: Codable {
    var id: Int
    var image: String
    var name: String
    var original: String
    var amount: Double
    var unit: String
}

struct RecipeInformation: Codable {
    var vegetarian: Bool
    var vegan: Bool
    var preparationMinutes: Int
    var cookingMinutes: Int
    var pricePerServing: Double
    var id: Int
    var title: String
    var servings: Int
    var sourceUrl: String
    var image: String
    var imageType: String
    var summary: String
    var instructions: String
    var extendedIngredients: [Ingredient]
}
