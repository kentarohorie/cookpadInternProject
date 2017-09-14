//
//  Dish.swift
//  cookpad_demo
//
//  Created by 堀江健太朗 on 2017/09/14.
//  Copyright © 2017年 kentaro. All rights reserved.
//

import UIKit

class Dish: NSObject {
    //var level: Int?
    var name: String?
    var image: UIImage?
    //var category: String? 時間あればやりたい。なければ検索結果はランダム表示
    //var requireTime: Int?
    
    init(name: String, image: UIImage) {
        //self.level = level
        self.name = name
        self.image = image
    }
}
