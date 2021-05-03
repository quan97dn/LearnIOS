//
//  HomeViewController.swift
//  UIView
//
//  Created by MBP0037 on 4/28/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var boxRed: UIView!
    @IBOutlet var lables: [UILabel]!
    override func viewDidLoad() {
        super.viewDidLoad()
//        for item in lables {
//            item.bounds = CGRect(x: 50, y: 100, width: 100, height: 100)
//        }
//        lables[0].bounds = CGRect(x: 50, y: 500, width: 100, height: 20)
        boxRed.bounds = CGRect(x: 100, y: 100, width: 400, height: 400)
        boxRed.frame.size = CGSize(width: 200, height: 200)
        print(boxRed.bounds.size)
    }
}
