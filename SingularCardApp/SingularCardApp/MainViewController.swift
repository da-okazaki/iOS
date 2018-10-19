//
//  MainViewController.swift
//  SingularCardApp
//
//  Created by 岡崎大地 on 2018/10/01.
//  Copyright © 2018年 daichi okazaki. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    /* variable define */
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* ボタンの装飾 */
        // Read a bar code
        button1.layer.borderWidth = 1.5                      // 枠線の幅
        button1.layer.borderColor = UIColor.black.cgColor    // 枠線の色
        button1.layer.cornerRadius = 15.0                    // 角丸のサイズ
        
        // Input bar code number
        button2.layer.borderWidth = 1.5                      // 枠線の幅
        button2.layer.borderColor = UIColor.black.cgColor    // 枠線の色
        button2.layer.cornerRadius = 15.0                    // 角丸のサイズ
        
        // Sample bar code
        button3.layer.borderWidth = 1.5                      // 枠線の幅
        button3.layer.borderColor = UIColor.black.cgColor    // 枠線の色
        button3.layer.cornerRadius = 15.0                    // 角丸のサイズ
    }
}

