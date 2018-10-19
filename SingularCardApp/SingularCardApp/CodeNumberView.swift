//
//  CodeNumberView.swift
//  SingularCardApp
//
//  Created by 岡崎大地 on 2018/10/01.
//  Copyright © 2018年 daichi okazaki. All rights reserved.
//

import UIKit

class CodeNumberView: UIViewController {

    @IBOutlet weak var hantei_number: UITextField! // テキストフィールド
    
    @IBOutlet var ok_button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* ボタンの装飾 */
        ok_button.layer.borderWidth = 1.5                      // 枠線の幅
        ok_button.layer.borderColor = UIColor.black.cgColor    // 枠線の色
        ok_button.layer.cornerRadius = 15.0                    // 角丸のサイズ
        //ok_button.isEnabled = false                            // ボタンの非活性
        //ok_button.layer.backgroundColor = UIColor.gray.cgColor // ボタンの背景色
        
    }
    
    /* OKボタンを押下した際の処理 */
    @IBAction func hantei_tap(_ sender: Any) {
        
        // 空白だった場合
        if let text = hantei_number.text, text.isEmpty {
            
            
            
            // エラータイトル
            let alertController:UIAlertController =
            UIAlertController(title:"ERROR",
                              //message: "yes or no",
                message: "一致する会員がいません",
                preferredStyle: .alert)
        
        
            // エラーボタン
            let defaultAction:UIAlertAction =
                UIAlertAction(title: "はい",
                              style: .default,
                              handler:{
                                (action:UIAlertAction!) -> Void in
                                // 処理
                })
        
            // actionを追加
            alertController.addAction(defaultAction)
        
            // UIAlertControllerの起動
            present(alertController, animated: true, completion: nil)
            
        }
    }
}
