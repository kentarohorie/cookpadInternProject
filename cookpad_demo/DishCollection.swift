//
//  DishCollection.swift
//  cookpad_demo
//
//  Created by 堀江健太朗 on 2017/09/14.
//  Copyright © 2017年 kentaro. All rights reserved.
//

import UIKit

class DishCollection: NSObject {
    var dishArray: [Dish]?
    
    override init() {
        super.init()
        let dishDicArray = [
            ["name": "海鮮丼",
             "image": "curry.jpg"
             ],
            ["name": "親子丼",
             "image": "curry.jpg"
            ],
            ["name": "牛丼",
             "image": "curry.jpg"
            ],
            ["name": "そば",
             "image": "curry.jpg"
            ],
            ["name": "うどん",
             "image": "curry.jpg"
            ],
            ["name": "焼きそば",
             "image": "curry.jpg"
            ],
            ["name": "冷麺",
             "image": "curry.jpg"
            ],
            ["name": "チャーハン",
             "image": "curry.jpg"
            ],
            ["name": "ハヤシライス",
             "image": "curry.jpg"
            ],
            ["name": "オムライス",
             "image": "curry.jpg"
            ],
            ["name": "シチュー",
             "image": "curry.jpg"
            ],
            ["name": "ハンバーグ",
             "image": "curry.jpg"
            ],
            ["name": "カレー",
             "image": "curry.jpg"
            ],
            ["name": "ステーキ",
             "image": "curry.jpg"
            ],
            ["name": "焼肉",
             "image": "curry.jpg"
            ],
            ["name": "たこ焼き",
             "image": "curry.jpg"
            ],
            ["name": "鍋",
             "image": "curry.jpg"
            ],
            ["name": "餃子",
             "image": "curry.jpg"
            ],
            ["name": "肉じゃが",
             "image": "curry.jpg"
            ],
            ["name": "生姜焼き",
             "image": "curry.jpg"
            ],
            ["name": "肉野菜炒め",
             "image": "curry.jpg"
            ],
            ["name": "マー坊豆腐",
             "image": "curry.jpg"
            ],
            ["name": "青椒肉絲",
             "image": "curry.jpg"
            ],
            ["name": "さばの味噌煮",
             "image": "curry.jpg"
            ],
            ["name": "そうめん",
             "image": "curry.jpg"
            ],
            ["name": "ロールキャベツ",
             "image": "curry.jpg"
            ],
            ["name": "ナポリタン",
             "image": "curry.jpg"
            ],
            ["name": "カルボナーラ",
             "image": "curry.jpg"
            ],
            ["name": "ペペロンチーノ",
             "image": "curry.jpg"
            ]
                                 ]
        for dishDic in dishDicArray {
            let dish = Dish(name: dishDic["name"]!, image: UIImage(named: dishDic["image"]!)!)
            dishArray?.append(dish)
        }
        
        print(dishArray)
    }
}
