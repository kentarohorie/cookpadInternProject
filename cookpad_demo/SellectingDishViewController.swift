//
//  SellectingDishViewController.swift
//  cookpad_demo
//
//  Created by 堀江健太朗 on 2017/09/15.
//  Copyright © 2017年 kentaro. All rights reserved.
//

import UIKit

import UIKit
import Koloda

class SellectingDishViewController: UIViewController {
    
    @IBOutlet weak var kolodaView: KolodaView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    var targetDish: Dish!
    
    @IBAction func tapRight(_ sender: UIButton) {
        kolodaView.swipe(SwipeResultDirection.right, force: true)
    }
    
    @IBAction func tapLeft(_ sender: UIButton) {
        kolodaView.swipe(SwipeResultDirection.left, force: true)
    }
    
    let image = UIImage(named: "dish1.jpg")
    let titleString = "カレーライス"
    
    var dataSource = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        kolodaView.backgroundColor = UIColor.white
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        //for index in 0...2 {
            let card = createCard(image: targetDish.image!, coverViewFrame: kolodaView.frame, title: targetDish.name!)
            dataSource.append(card)
        //}
        
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
        label.text = "\(title)？"
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize: 24)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDecide" {
            let targetController = segue.destination as! DecideDishViewController
            targetController.targetDish = sender as! Dish
        }
    }
}

extension SellectingDishViewController: KolodaViewDataSource {
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

extension SellectingDishViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        print("kolodadidrunoutofcard")
        //performSegue(withIdentifier: "segueToDecide", sender: self)
    } // カードをスワイプし終えた時
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        if (direction == .right) {
            performSegue(withIdentifier: "segueToDecide", sender: targetDish)
        } else {
            print("oghoehgogeohg")
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        print("didselectcart\(index)")
    }
}

