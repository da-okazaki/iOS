//
//  NextViewController.swift
//  SwiftImageView1
//
//  Created by 岡崎大地 on 2018/10/13.
//  Copyright © 2018年 daichi okazaki. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    /* variable define */
    @IBOutlet var changeButton3: UIButton!
    @IBOutlet var ImageView2: UIImageView!

    var count:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Button decoration */
        changeButton3.layer.borderWidth = 2.0                        // 枠線の幅:Border width
        changeButton3.layer.cornerRadius = 15.0                      // 角丸のサイズ:Round corner size
        changeButton3.layer.borderColor = UIColor.black.cgColor      // 枠線の色:Border color
        changeButton3.layer.backgroundColor = UIColor.orange.cgColor // バックグラウンドの色:Background clolor
        
    }
    
    @IBAction func changeButton(_ sender: Any) {
        if (count == 1) {
            ImageView2.image = UIImage(named: "back1.jpg")
            count = 0
        }
        else if (count == 0) {
            ImageView2.image = UIImage(named: "back2.jpg")
            count = 1
        }
    }
    
    
}
