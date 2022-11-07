//
//  CuisineRequest.swift
//  L3_NetworkingExample
//
//  Created by Yaroslav Valentyi on 07.11.2022.
//

import Foundation

struct CuisineRequestBody: Encodable {
    var ingredientList: String
    var title: String
    
    init(ingredientList: String, title: String) {
        self.ingredientList = ingredientList
        self.title = title
    }
}

struct CuisineRequestResponse: Codable {
    var cuisine: String
    var cuisines: [String]
    var confidence: Int
}
