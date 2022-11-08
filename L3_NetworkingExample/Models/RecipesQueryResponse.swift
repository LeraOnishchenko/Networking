//
//  RecipesQuery.swift
//  L3_NetworkingExample
//
//  Created by Yaroslav Valentyi on 07.11.2022.
//

import Foundation

struct Nutrient: Codable {
    var name: String
    var amount: Int
    var unit: String
}

struct NutritionContainer: Codable {
    var nutrients: [Nutrient]
}

struct RecipeQuery: Codable {
    var id: Int
    var title: String
    var image: String
    var imageType: String
    var nutrition: NutritionContainer
}

struct RecipesQueryResponse: Codable {
    var results: [RecipeQuery]
}

struct NutrientsMeasure: Codable {
    var value: Int
    var unit: String
    var standardDeviation: Double
}

struct NutritionQueryResponse: Codable {
    var recipesUsed: Int
    var calories: NutrientsMeasure
    var fat: NutrientsMeasure
    var protein: NutrientsMeasure
    var carbs: NutrientsMeasure
}
