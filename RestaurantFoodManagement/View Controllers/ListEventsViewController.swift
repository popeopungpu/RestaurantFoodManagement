//
//  ViewController.swift
//  RestaurantFoodManagement
//
//  Created by Nghiem Hoai Trung on 6/25/17.
//  Copyright © 2017 com.trunghiem. All rights reserved.
//

import UIKit

class ListEventsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var eventsList:[Event] = [
        Event(title: "acer", img: "item_1", cost: 10000000.0, detail: "Acer chính hãng octa core i7 2.7 Ghz, RAM DD3EX 16GB, SSD 1T"),
        Event(title: "dell", img: "item_2", cost: 5000000.0, detail: "Dell chính hãng quard core i7 2.7 Ghz, RAM DD3EX 16GB, SSD 1T"),
        Event(title: "gamex", img: "item_3", cost: 8000000.0, detail: "GameX chính hãng quard core i7 2.7 Ghz, RAM DD3EX 16GB, SSD 1T"),
        Event(title: "fujitsu", img: "item_4", cost: 7000000.0, detail: "Fujitsu chính hãng quard core i7 2.7 Ghz, RAM DD3EX 16GB, SSD 1T"),
        Event(title: "genova", img: "item_5", cost: 45000000.0, detail: "Genova chính hãng quard core i3 2.1 Ghz, RAM DD3 4GB, IDE ATA 250g"),
        Event(title: "xiaomi", img: "item_6", cost: 3000000.0, detail: "Xiaomi Hồ Cẩm Đào dual core pentium D 1.9 Ghz, RAM DD2 4GB, IDE ATA 40G"),
        Event(title: "lenovo", img: "item_7", cost: 6000000.0, detail: "Lenovo chính hãng quard core i7 2.7 Ghz, RAM DD3EX 16GB, SSD 1T")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "logo"))
        self.navigationController?.navigationBar.frame.size.height = 80
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 100
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ListEventsViewController : UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return eventsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier = ""
        
        if indexPath.section == 0 {
            cellIdentifier = PopularEventsTblCell.cellIdentifier
        } else {
            cellIdentifier = ProductEventsTblCell.cellIdentifier
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        if indexPath.section == 0 {
            let popularEvtCell = cell as! PopularEventsTblCell
            let dataForCell = [PopularEventItem(imgName: "evt-1"),
                               PopularEventItem(imgName: "evt-2"),
                               PopularEventItem(imgName: "evt-3"),
                               PopularEventItem(imgName: "evt-4")]
            popularEvtCell.updateUI(with: dataForCell)
        } else {
            let eventCell = cell as! ProductEventsTblCell
            eventCell.eventItem.backgroundColor = UIColor(red: 187/255, green: 190/255, blue: 193/255, alpha: 1.0)
            eventCell.layer.borderWidth = 1
            eventCell.layer.borderColor = UIColor.black.cgColor
            // thiet lap hinh cho cell
            let imgView = UIImageView(frame: CGRect(x: 5, y: 5, width: 120, height: 120))
            imgView.contentMode = .scaleAspectFit
            let image = UIImage(named: eventsList[indexPath.item].img)
            imgView.image = image
            eventCell.eventItem.addSubview(imgView)
            
            // thiet lap title cho cell
            let title = UILabel(frame: CGRect(x: 130, y: 0, width: 120, height: 20))
            title.text = eventsList[indexPath.item].title
            title.textColor = UIColor.blue
            title.font = UIFont(name: "HelveticaNeue", size: 17.0)
            title.numberOfLines = 0
            title.sizeToFit()
            eventCell.eventItem.addSubview(title)
            
            // thiet lap cost cho cell
            let cost = UILabel(frame: CGRect(x: 130, y: 25, width: 120, height: 15))
            let largeNumber = eventsList[indexPath.item].cost!
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = NumberFormatter.Style.decimal
            let formattedNumber = numberFormatter.string(from: NSNumber(value:largeNumber))
            cost.text = formattedNumber
            cost.textColor = UIColor.red
            cost.font = UIFont(name: "HelveticaNeue", size: 13.0)
            cost.numberOfLines = 0
            cost.sizeToFit()
            eventCell.eventItem.addSubview(cost)
            
            // thiet lap details cho cell
            let detail = UILabel(frame: CGRect(x: 130, y: 45, width: 200, height: 80))
            detail.text = eventsList[indexPath.item].detail
            detail.numberOfLines = 0
            detail.sizeToFit()
            
            detail.textColor = UIColor.black
            detail.font = UIFont(name: "HelveticaNeue", size: 13.0)
            eventCell.eventItem.addSubview(detail)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (section == 0) ? 0 : 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100.0
        }
        return 130.0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            return nil
        }
        
        let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 30))
        view.backgroundColor = UIColor.red
        let title = UILabel(frame: view.bounds)
        title.text = "SỰ KIỆN: 19/03/2017 - 22/04/2017"
        title.textAlignment = .center
        title.textColor = UIColor.white
        title.font = UIFont(name: "HelveticaNeue", size: 15.0)
        title.backgroundColor = UIColor.red
        view.addSubview(title)
        return view
    }
}
