//
//  HomePageViewCell.swift
//  Country App
//
//  Created by Vasif Mehdi on 02.12.22.
//

import UIKit

protocol HomePageViewCellProtocol

class HomePageViewCell: UITableViewCell {

    @IBOutlet weak var countryFlag: UIView!
    @IBOutlet weak var countryName: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
