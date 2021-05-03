//
//  HomeViewController.swift
//  exercise
//
//  Created by MBP0037 on 4/28/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let avartView = AvartView(frame: CGRect(x: 50, y: 100, width: 150, height: 200))
        avartView.boxName?.text = "Quan Nguyen"
        view.addSubview(avartView)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
