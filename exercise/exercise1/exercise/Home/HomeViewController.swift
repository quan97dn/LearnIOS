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

        let box = UIView()
        box.frame = CGRect(x: 50, y: 100, width: 150, height: 200)
        box.backgroundColor = .black
        
        let avatar = UIImageView(image: UIImage(named: "image2"))
        avatar.frame = CGRect(x: 0, y: 0, width: box.frame.width, height: box.frame.height)
        box.addSubview(avatar)
        
        let boxName = UILabel()
        boxName.frame = CGRect(x: 0, y: box.frame.height - 30, width: box.frame.width, height: 30)
        boxName.text = "Quan Nguyen"
        boxName.textColor = .white
        boxName.textAlignment = .center
        boxName.backgroundColor = .blue
        box.addSubview(boxName)
        
        view.addSubview(box)
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
