//
//  CryptoTableViewCell.swift
//  CryptoApp
//
//  Created by Sezer on 6.01.2023.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
