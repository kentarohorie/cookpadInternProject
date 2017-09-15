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
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBAction func tapRight(_ sender: UIButton) {
        kolodaView.swipe(SwipeResultDirection.right, force: true)
    }
    
    @IBAction func tapLeft(_ sender: UIButton) {
        kolodaView.swipe(SwipeResultDirection.left, force: true)
    }
    
    let images = [
        UIImage(named: "kare"),
        UIImage(named: "dish2.jpg"),
        UIImage(named: "dish3.jpg")
    ]
    
    let titles = [
        "カレーライス",
        "カツ丼",
        "お好み焼き"
    ]
    
    var dataSource = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        kolodaView.backgroundColor = UIColor.white
        
        for index in 0...2 {
            let card = createCard(image: images[index]!, coverViewFrame: kolodaView.frame, title: titles[index])
            dataSource.append(card)
        }
        
        setLayerToButton(button: leftButton)
        setLayerToButton(button: rightButton)
        
        kolodaView.delegate = self
        kolodaView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createCard(image: UIImage, coverViewFrame: CGRect, title :String) -> UIView {
        let coverView = UIView(frame: coverViewFrame)
        coverView.backgroundColor = UIColor.white
        
        let imageView = UIImageView(image: image)
        imageView.frame.size = CGSize(width: coverView.frame.width, height: coverView.frame.height - 80)
        imageView.frame.origin = CGPoint(x: 0, y: 80)
        
        let womanImageView = UIImageView(image: UIImage(named: "woman"))
        womanImageView.frame = CGRect(x: 8, y: 8, width: 70, height: 70)
        
        let fukidashiCoverView = UIView()
        fukidashiCoverView.frame = CGRect(x: 8 + 70 + 8, y: 8, width: coverView.frame.width - (8 + womanImageView.frame.width + 8 + 8), height: 70)
        
        let fukidashiImageView = UIImageView(image: UIImage(named: "hukihuki"))
        fukidashiImageView.frame.size = fukidashiCoverView.frame.size
        fukidashiImageView.frame.origin = CGPoint(x: 0, y: 0)
        fukidashiCoverView.addSubview(fukidashiImageView)
        
        let label = UILabel()
        label.frame.size = fukidashiCoverView.frame.size
        label.frame.origin = CGPoint(x: 0, y: 0)
        label.text = title
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = UIColor.clear
        fukidashiCoverView.addSubview(label)
        
        kolodaView.layer.borderWidth = 1
        kolodaView.layer.borderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1).cgColor
        kolodaView.layer.cornerRadius = 10
        kolodaView.clipsToBounds = true
        
        coverView.addSubview(womanImageView)
        coverView.addSubview(imageView)
        coverView.addSubview(fukidashiCoverView)
        return coverView
    }
    
    func setLayerToButton(button: UIButton) {
        //button.layer.borderColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1).cgColor
        //button.layer.borderWidth = 5
        //button.layer.cornerRadius = button.frame.width / 2
        //button.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
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
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        let oView = SellectingOverlayView()
        oView.frame.size = CGSize(width: 100, height: 100)
        
        return oView
    }
}

extension SellectingViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        print("kolodadidrunoutofcard")
        performSegue(withIdentifier: "segueToSearched", sender: self)
    } // カードをスワイプし終えた時
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        print("swipecard\(index) and direction\(direction)")
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        print("didselectcart\(index)")
    }
}
