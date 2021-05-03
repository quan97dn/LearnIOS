//
//  AvartView.swift
//  exercise
//
//  Created by MBP0037 on 4/29/21.
//

import UIKit

class AvartView: UIView {
    var boxName: UILabel?
    override init(frame: CGRect) {
        super.init(frame: frame)
        let box = UIView()
        box.frame = frame
        box.backgroundColor = .black

        let avatar = UIImageView(image: UIImage(named: "image2"))
        avatar.frame = CGRect(x: 0, y: 0, width: box.frame.width, height: box.frame.height)
        box.addSubview(avatar)

        boxName = UILabel()
        boxName!.frame = CGRect(x: 0, y: box.frame.height - 30, width: box.frame.width, height: 30)
        boxName!.text = "Quan Nguyen"
        boxName!.textColor = .white
        boxName!.textAlignment = .center
        boxName!.backgroundColor = .blue
        box.addSubview(boxName!)
        self.addSubview(box)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
