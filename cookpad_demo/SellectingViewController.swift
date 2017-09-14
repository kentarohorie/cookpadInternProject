//
//  SellectingViewController.swift
//  cookpad_demo
//
//  Created by 堀江健太朗 on 2017/09/14.
//  Copyright © 2017年 kentaro. All rights reserved.
//

import UIKit
import Koloda

class SellectingViewController: UIViewController {

    @IBOutlet weak var kolodaView: KolodaView!
    let images = [
        UIImage(named: "dish1.jpg"),
        UIImage(named: "dish2.jpg"),
        UIImage(named: "dish3.jpg"),
        UIImage(named: "dish2.jpg"),
        UIImage(named: "dish3.jpg")
    ]
    
    var dataSource = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for image in images {
            let imageView = UIImageView(image: image)
            imageView.frame.size = CGSize(width: self.view.frame.width / 2, height: self.view.frame.width / 2)
            dataSource.append(imageView)
        }
        kolodaView.delegate = self
        kolodaView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SellectingViewController: KolodaViewDataSource {
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

extension SellectingViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        print("kolodadidrunoutofcard")
    } // カードをスワイプし終えた時
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        print("swipecard\(index) and direction\(direction)")
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        print("didselectcart\(index)")
    }
}
