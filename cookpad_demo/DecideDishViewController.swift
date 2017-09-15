//
//  DecideDishViewController.swift
//  cookpad_demo
//
//  Created by 堀江健太朗 on 2017/09/15.
//  Copyright © 2017年 kentaro. All rights reserved.
//

import UIKit

class DecideDishViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cookpadButton: UIButton!
    @IBAction func tapCookpadButton(_ sender: UIButton) {
        let urlString = "https://cookpad.com/search/\((targetDish?.name!)!)"
        let encodeURL = urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        let url = URL(string: encodeURL!)
        UIApplication.shared.open(url!)
    }
    
    var targetDish: Dish?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "\((targetDish?.name!)!)に決まり！"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
