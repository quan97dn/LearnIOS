//
//  HomeViewController.swift
//  exercise
//
//  Created by MBP0037 on 4/28/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    let users: [[String:String]] = [
        ["image": "image2", "text": "Quan 1"],
        ["image": "image2", "text": "Quan 2"],
        ["image": "image2", "text": "Quan 3"],
        ["image": "image2", "text": "Quan 4"],
        ["image": "image2", "text": "Quan 5"],
        ["image": "image2", "text": "Quan 6"]
    ]
    
    var width: CGFloat = 0
    var height: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        let screenBounds = UIScreen.main.bounds
        width = screenBounds.width
        height = screenBounds.height
        let box = UIView()
        box.frame = CGRect(
            x: 0,
            y: 0,
            width: width - 40,
            height: height - 40
        )
        box.center = CGPoint(
            x: width  / 2,
            y: height / 2
        )
        box.backgroundColor = .brown
        self.listView(users) { (item) in
            box.addSubview(item)
        }
        view.addSubview(box)
    }
    
    func listView(_ list: [[String:String]], callback: (UIView) -> ()) -> Void {
        var sumX = 10
        var sumY = 10
        var index = 1
        for item in users {
            if index > (Int(width) - 40) / 165 {
                sumY = sumY + 210
                index = 1
                sumX = 10
            }
            let itemAvart = ItemAvart(
                image: item["image"]!,
                text: item["text"]!,
                xItem: sumX,
                yItem: sumY
            )
            callback(itemAvart)
            sumX = sumX + 160
            index += 1
        }
    }

    func ItemAvart(image: String, text: String, xItem: Int, yItem: Int) -> UIView {
        let box = UIView()
        box.frame = CGRect(x: xItem, y: yItem, width: 150, height: 200)
        box.backgroundColor = .black
        
        let avatar = UIImageView(image: UIImage(named: image))
        avatar.frame = CGRect(x: 0, y: 0, width: box.frame.width, height: box.frame.height)
        box.addSubview(avatar)
        
        let boxName = UILabel()
        boxName.frame = CGRect(x: 0, y: box.frame.height - 30, width: box.frame.width, height: 30)
        boxName.text = text
        boxName.textColor = .white
        boxName.textAlignment = .center
        boxName.backgroundColor = .blue
        box.addSubview(boxName)
        return box
    }
}
