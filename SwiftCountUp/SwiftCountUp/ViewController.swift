//
//  ViewController.swift
//  SwiftCountUp
//
//  Created by 岡崎大地 on 2018/10/13.
//  Copyright © 2018年 daichi okazaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /* variable define */
    @IBOutlet var ChangeLabel: UILabel!
    @IBOutlet var CountMinusButton: UIButton!
    @IBOutlet var CountUpButton: UIButton!
    
    var count:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func CountMinusAction(_ sender: Any) {
        if (count > 0) {
            count = count - 1
            ChangeLabel.text = String(count)
        }
    }
    

    @IBAction func CountUpButton(_ sender: Any) {
        count = count + 1
        ChangeLabel.text = String(count)
    }
    
}

