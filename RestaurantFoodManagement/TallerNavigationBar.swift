//
//  TallerNavigationBar.swift
//  RestaurantFoodManagement
//
//  Created by Nghiem Hoai Trung on 6/25/17.
//  Copyright © 2017 com.trunghiem. All rights reserved.
//

import UIKit

class TallerNavigationBar: UINavigationBar {

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let newSize: CGSize = CGSize(width: screenWidth, height: 80)
        return newSize
    }
}
