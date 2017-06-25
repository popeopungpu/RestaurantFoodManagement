//
//  PopularEventsTCell.swift
//  RestaurantFoodManagement
//
//  Created by Nghiem Hoai Trung on 6/25/17.
//  Copyright © 2017 com.trunghiem. All rights reserved.
//

import UIKit

struct PopularEventItem{
    var imgName: String
}

class PopularEventsTblCell: UITableViewCell {
    
    @IBOutlet weak fileprivate var collectionView: UICollectionView!

    static let cellIdentifier = "popularEventsCell"

    var dataList : [PopularEventItem] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(with data: [PopularEventItem]){
        self.dataList = data
        collectionView.reloadData()
    }

}

extension PopularEventsTblCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath)
        let eventItem = dataList[indexPath.item]
        let imgView = cell.viewWithTag(100) as! UIImageView
        imgView.image = UIImage(named: eventItem.imgName)
        return cell
    }
}
