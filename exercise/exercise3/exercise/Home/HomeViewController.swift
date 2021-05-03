//
//  HomeViewController.swift
//  exercise
//
//  Created by MBP0037 on 4/28/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var readView: UIView!
    var path = UIBezierPath()
    var firstLocation = CGPoint.zero
    var shapeLayer = CAShapeLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//            let currentPoint = touch.location(in: view)
//            // do something with your currentPoint
//            print("touch point(\(currentPoint.x), \(currentPoint.y))")
//
//            let currentPointOfRedView = touch.location(in: readView)
//                        print("RedView point(\(currentPointOfRedView.x), \(currentPointOfRedView.y))")
//        }
//    }
    
    func setupView(){
            view.layer.addSublayer(shapeLayer)
            self.shapeLayer.lineWidth = 2
            self.shapeLayer.strokeColor = UIColor.blue.cgColor
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            if let location = touches.first?.location(in: view){
                firstLocation = location
            }
        }
        
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            if let location = touches.first?.location(in: view) {
                
                path.removeAllPoints()
                path.move(to: firstLocation)
                if touches.first?.view == readView {
                    self.shapeLayer.strokeColor = UIColor.blue.cgColor
                } else {
                    self.shapeLayer.strokeColor = UIColor.yellow.cgColor
                }
                path.addLine(to: location)
                shapeLayer.path = path.cgPath
            }
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
