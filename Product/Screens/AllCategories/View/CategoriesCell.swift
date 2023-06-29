//
//  CategoriesCell.swift
//  Product
//
//  Created by Vaibhav Gawde on 15/06/23.
//

import UIKit

class CategoriesCell: UITableViewCell {

    @IBOutlet weak var categoryPrice: UILabel!
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var categoryID: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
