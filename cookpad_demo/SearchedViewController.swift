//
//  SearchedViewController.swift
//  cookpad_demo
//
//  Created by 堀江健太朗 on 2017/09/14.
//  Copyright © 2017年 kentaro. All rights reserved.
//

import UIKit

class SearchedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let dishCollection = DishCollection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: collectionView.frame.width / 2 - 5, height: 150)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        collectionView.collectionViewLayout = layout
        self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    } //segueToChoiceDish
    
    // collection view datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (dishCollection.dishArray?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath)
        cell.backgroundColor = UIColor.gray
        
        let imageView = UIImageView(image: dishCollection.dishArray?[indexPath.item].image!)
        
        return cell
    }
    
    // collection view delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueToChoiceDish", sender: self)
    }
}
