//
//  NutritionViewController.swift
//  L3_NetworkingExample
//
//  Created by lera on 24.11.2022.
//

import UIKit

class NutritionViewController: UIViewController {
    var dishTitle = ""
    let apiAlamofire = ApiAlamofire()
    @IBOutlet private weak var carbs: UILabel!
    @IBOutlet private weak var protein: UILabel!
    @IBOutlet private weak var fat: UILabel!
    @IBOutlet private weak var calories: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dishTitle)
        print("hello")
        Task {
            do {
                let data = try await apiAlamofire.searchNutrition(title: dishTitle)
                print(data)
                self.calories.text = String(data.calories.value)
                self.carbs.text = String(data.carbs.value)
                self.protein.text = String(data.protein.value)
                self.fat.text = String(data.fat.value)
            }
            catch {
                print("\(error.localizedDescription)")
            }
        }
    }
}
