//
//  CookSkillViewController.swift
//  cookpad_demo
//
//  Created by 堀江健太朗 on 2017/09/15.
//  Copyright © 2017年 kentaro. All rights reserved.
//

import UIKit
import Koloda

class CookSkillViewController: UIViewController {

    @IBOutlet weak var kolodaView: KolodaView!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    
    @IBAction func tapRight(_ sender: UIButton) {
        kolodaView.swipe(SwipeResultDirection.right, force: true)
    }
    
    @IBAction func tapLeft(_ sender: UIButton) {
        kolodaView.swipe(SwipeResultDirection.left, force: true)
    }
    
    let images = [
        UIImage(named: "karubo"),
        UIImage(named: "okonomiyakijpg"),
        UIImage(named: "yasaiitame")
    ]
    
    let titles = [
        "カルボナーラ",
        "お好み焼き",
        "野菜炒め"
    ]
    
    var dataSource = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayerToButton(button: leftButton)
        setLayerToButton(button: rightButton)
        
        for index in 0...2 {
            let card = createCard(image: images[index]!, coverViewFrame: kolodaView.frame, title: titles[index])
            dataSource.append(card)
        }
        
        kolodaView.delegate = self
        kolodaView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createCard(image: UIImage, coverViewFrame: CGRect, title :String) -> UIView {
        let coverView = UIView(frame: coverViewFrame)
        
        let imageView = UIImageView(image: image)
        imageView.frame.size = CGSize(width: coverView.frame.width, height: coverView.frame.height - 100)
        imageView.frame.origin = CGPoint(x: 0, y: 0)
        
        let label = UILabel()
        label.frame.size = CGSize(width: coverView.frame.width, height: 100)
        label.frame.origin = CGPoint(x: 0, y: coverView.frame.height - 100)
        label.text = title
        label.backgroundColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        
        kolodaView.layer.borderWidth = 1
        kolodaView.layer.borderColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1).cgColor
        kolodaView.layer.cornerRadius = 10
        kolodaView.clipsToBounds = true
        
        coverView.addSubview(imageView)
        coverView.addSubview(label)
        return coverView
    }
    
    func setLayerToButton(button: UIButton) {
        button.layer.borderColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1).cgColor
        button.layer.borderWidth = 5
        button.layer.cornerRadius = button.frame.width / 2
    }
}

extension CookSkillViewController: KolodaViewDataSource {
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
        let oView = SkillOverlayView()
        oView.frame.size = CGSize(width: 100, height: 100)
        
        return oView
    }
}

extension CookSkillViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        print("kolodadidrunoutofcard")
        performSegue(withIdentifier: "segueToSkillResult", sender: self)
    } // カードをスワイプし終えた時
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        print("swipecard\(index) and direction\(direction)")
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        print("didselectcart\(index)")
    }
}
