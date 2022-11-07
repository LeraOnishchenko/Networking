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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
