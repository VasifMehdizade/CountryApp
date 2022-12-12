//
//  HomePageViewCell.swift
//  Country App
//
//  Created by Vasif Mehdi on 02.12.22.
//

import UIKit

protocol HomePageViewCellProtocol {
//    var image : String {get}
    var countryLabel : String {get}
}

class HomePageViewCell: UITableViewCell {

  
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(item: HomePageViewCellProtocol) {
        countryName.text = item.countryLabel
    }
    
}
