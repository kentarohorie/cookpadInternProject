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
    var targetDish: Dish?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        navigationItem.hidesBackButton = true
        
        //layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: collectionView.frame.width / 2 - 5, height: 200)
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
        
        let imageView = UIImageView(image: dishCollection.dishArray?[indexPath.item].image!)
        imageView.frame = CGRect(x: 0, y: 0, width: cell.frame.size.width, height: cell.frame.size.height / 3 * 2)
        //imageView.layer.cornerRadius = 4
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.borderWidth = 1
        
        let label = UILabel(frame: CGRect(x: 0, y: imageView.frame.size.height, width: cell.frame.size.width, height: cell.frame.size.height - imageView.frame.size.height))
        label.text = dishCollection.dishArray?[indexPath.item].name!
        label.textAlignment = NSTextAlignment.center
        
        cell.layer.cornerRadius = 4
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1
        cell.clipsToBounds = true
        
        cell.addSubview(imageView)
        cell.addSubview(label)
        
        return cell
    }
    
    // collection view delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.targetDish = dishCollection.dishArray?[indexPath.item]
        self.performSegue(withIdentifier: "segueToChoiceDish", sender: targetDish)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToChoiceDish" {
            let targetController = segue.destination as! SellectingDishViewController
            targetController.targetDish = sender as! Dish
        }
    }
}
