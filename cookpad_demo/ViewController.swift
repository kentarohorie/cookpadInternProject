//
//  ViewController.swift
//  cookpad_demo
//
//  Created by 堀江健太朗 on 2017/09/13.
//  Copyright © 2017年 kentaro. All rights reserved.
//

extension ViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        print("Out of stock!!")
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        print("index \(index) has tapped")
    }
}



import UIKit
import Koloda

class ViewController: UIViewController {
    
    let images = [UIImage(named: "dish1.jpg"), UIImage(named: "dish2.jpg"), UIImage(named: "dish3.jpg"), UIImage(named: "dish2.jpg"), UIImage(named: "dish3.jpg")]
    let kolodaView = KolodaView()
    
    var dataSource = [UIView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let dishCollection = DishCollection()
        
        kolodaView.frame.size = CGSize(width: self.view.frame.width / 2, height: self.view.frame.width / 2)
        kolodaView.center = self.view.center
    
        
        for image in images {
            let imageView = UIImageView(image: image)
            imageView.frame.size = CGSize(width: self.view.frame.width / 2, height: self.view.frame.width / 2)
            dataSource.append(imageView)
        }
        
        kolodaView.delegate = self
        self.view.addSubview(kolodaView)
        kolodaView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: KolodaViewDataSource {
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return DragSpeed(rawValue: 1)!
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return dataSource.count
    }
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return dataSource[index]
    }
}

