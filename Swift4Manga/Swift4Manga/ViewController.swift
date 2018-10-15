//
//  ViewController.swift
//  Swift4Manga
//
//  Created by 岡崎大地 on 2018/10/15.
//  Copyright © 2018年 daichi okazaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /* variable define */
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var runnerImageView: UIImageView!
    
    var imageArray = [UIImage]()
    var timer = Timer()
    var timer2 = Timer()
    var countUp = 0
    var updateCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countLabel.text = "0"
        
        let image0 = UIImage(named: "dash0.png")
        let image1 = UIImage(named: "dash1.png")
        let image2 = UIImage(named: "dash2.png")
        let image3 = UIImage(named: "dash3.png")
        let image4 = UIImage(named: "dash4.png")
        let image5 = UIImage(named: "dash5.png")
        
        imageArray = [image0!, image1!, image2!, image3!, image4!, image5!]
        
    }
    
    @IBAction func run(_ sender: Any) {
        // タイマーをスタート
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            // ブロック「{}」の枠内で変数を扱うときは「self」が必要
            // カウントアップ
            self.countUp = self.countUp + 1
            
            // ラベルに反映する
            self.countLabel.text = String(self.countUp)
        })
        
        // runnerImageViewに画像を1秒ごとに反映していく
        timer2 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (Timer) in
            
            // 配列の中から画像を取り出して、UIImageViewに反映
            if (self.updateCount > 5)
            {
                self.updateCount = 0
                self.runnerImageView.image = UIImage(named: "dash0.png")
            }
            else
            {
                self.runnerImageView.image = self.imageArray[self.updateCount]
            }
            self.updateCount = self.updateCount + 1
        })
    }
    
    @IBAction func stop(_ sender: Any) {
        // タイマーをストップ
        timer.invalidate()
        timer2.invalidate()
    }
    
}

