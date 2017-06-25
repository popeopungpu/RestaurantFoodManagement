//
//  ProductEventsTblCell.swift
//  RestaurantFoodManagement
//
//  Created by Nghiem Hoai Trung on 6/25/17.
//  Copyright © 2017 com.trunghiem. All rights reserved.
//

import UIKit

class ProductEventsTblCell: UITableViewCell {
    @IBOutlet weak var eventItem: UIView!
    static let cellIdentifier = "productEventsCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
