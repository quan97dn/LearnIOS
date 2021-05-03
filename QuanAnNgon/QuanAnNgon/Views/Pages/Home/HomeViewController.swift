//
//  HomeViewController.swift
//  QuanAnNgon
//
//  Created by MBP0037 on 4/30/21.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var restaurants: [Restaurants] = []
    
    @IBOutlet weak var cltRestaurants: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Những Quán Ăn Ngon"
        cltRestaurants.delegate = self
        cltRestaurants.dataSource = self
        let nib = UINib(nibName: "RestaurantsCell", bundle: .main)
        cltRestaurants.register(nib, forCellWithReuseIdentifier: "cell")
        let username = UserDefaultsService.getAccountLogin()["username"] ?? ""
        let user = UserRepository.shared().getUserByUsername(username: username, error: nil)
        restaurants = user.restaurants?.allObjects as! [Restaurants]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RestaurantRepository.shared().getAllRestaurants(error: nil).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RestaurantsCell
                
        let item = restaurants[indexPath.row]
        cell.lblName.text = item.name
        cell.imgCell.image = UIImage(named: "img-re-1")
        return cell
    }
}
