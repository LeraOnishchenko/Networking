//
//  TableViewCell.swift
//  L3_NetworkingExample
//
//  Created by lera on 07.11.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet private weak var dishName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
