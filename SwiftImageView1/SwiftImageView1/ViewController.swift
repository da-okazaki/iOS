//
//  ViewController.swift
//  SwiftImageView1
//
//  Created by 岡崎大地 on 2018/10/13.
//  Copyright © 2018年 daichi okazaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /* variable define */
    @IBOutlet var changeButton: UIButton!
    @IBOutlet var changeButton2: UIButton!
    @IBOutlet var backgroundImage: UIImageView!
    
    var count:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = 0
        
        /* ボタンの装飾:Button decoration */
        changeButton.layer.borderWidth = 2.0                        // 枠線の幅:Border width
        changeButton.layer.cornerRadius = 15.0                      // 角丸のサイズ:Round corner size
        changeButton.layer.borderColor = UIColor.black.cgColor      // 枠線の色:Border color
        changeButton.layer.backgroundColor = UIColor.orange.cgColor // バックグラウンドの色:Background clolor
        
        changeButton2.layer.borderWidth = 2.0                        // 枠線の幅:Border width
        changeButton2.layer.cornerRadius = 15.0                      // 角丸のサイズ:Round corner size
        changeButton2.layer.borderColor = UIColor.black.cgColor      // 枠線の色:Border color
        changeButton2.layer.backgroundColor = UIColor.orange.cgColor // バックグラウンドの色:Background clolor
        
    }

    
    
    @IBAction func changeAction(_ sender: Any) {
        /*
         * 日本語:backgroundImageと名前のついたパーツの画像を変更
         * 英語　:Change background image and image of named part.
         */
        
        backgroundImage.image = UIImage(named: "back1.jpg")
        
    }
    
    @IBAction func changeAction2(_ sender: Any) {
        
        backgroundImage.image = UIImage(named: "back2.jpg")
        
    }
    
}

