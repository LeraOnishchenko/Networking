//
//  TableViewCell.swift
//  L3_NetworkingExample
//
//  Created by lera on 07.11.2022.
//

import UIKit
import SDWebImage

class TableViewCell: UITableViewCell{
    let apiAlamofire = ApiAlamofire()
    let apiSession = ApiSesson()
    @IBOutlet private weak var dishImage: UIImageView!
    @IBOutlet private weak var guessNutrition: UIButton!
    @IBOutlet private weak var dishName: UILabel!
    
    weak var delegate: SearchCellDelegate?
    
    @IBAction func guessNutritionByDishName(_ sender: Any) {
        delegate?.guessNutrition(sender, of: dishName.text ?? "")
    }

    func config(from dish: RecipeQuery){
        self.dishImage.sd_setImage(with: URL(string: dish.image), completed: nil)
        self.dishName.text = dish.title
    }


}
protocol SearchCellDelegate: AnyObject {
    func guessNutrition(_ sender: Any, of title: String)
}
