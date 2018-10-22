//
//  ViewController.swift
//  InActiveButton
//
//  Created by 岡崎大地 on 2018/10/22.
//  Copyright © 2018年 daichi okazaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var MemberIdField: UITextField!
    @IBOutlet var authButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Button 装飾 */
        authButton.layer.borderWidth = 1.5
        authButton.layer.borderColor = UIColor.black.cgColor
        authButton.layer.cornerRadius = 15.0
        authButton.layer.backgroundColor = UIColor.gray.cgColor
        authButton.isEnabled = false

        /* keyboard delegate */
        MemberIdField.delegate = self
        
    }
    
    @IBAction func InActiveField(_ sender: Any) {
        // InActive Button
        if let text = MemberIdField.text, text.isEmpty {
            authButton.layer.backgroundColor = UIColor.gray.cgColor
            authButton.isEnabled = false
        }
            // Active Button
        else
        {
            authButton.layer.backgroundColor = UIColor.orange.cgColor
            authButton.isEnabled = true
            
        }
    }
    
    /* キーボード閉じる 画面タップ */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /* キーボード閉じる Return key */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        MemberIdField.resignFirstResponder()
        return true
    }
    
    @IBAction func secondViewAction(_ sender: Any) {
        
        var memberInfoFlg:Int = 0
        
        if MemberIdField.text == "1234" {
            memberInfoFlg = 1
        }
        else
        {
            memberInfoFlg = 0
        }
        
        /* 一致していた場合 */
        if memberInfoFlg == 1 {
            let alertController = UIAlertController(title: "会員情報が見つかりました", message: "画面遷移しますか？", preferredStyle: UIAlertController.Style.alert)
            
            // OKボタン
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{(action: UIAlertAction!) in
                // 画面遷移コード
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "MemberInfo")
                self.present(nextView, animated: true, completion: nil)
                
            })
            // キャンセルボタン
            let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
                (action: UIAlertAction!) -> Void in
            })
            // ③ UIAlertControllerにActionを追加
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            // ④ Alertを表示
            present(alertController, animated: true, completion: nil)
        }
            
        /* 一致してない場合 */
        else
        {
            // Alert 文言
            let alertController = UIAlertController(title: "ERROR", message: "一致する会員がいません", preferredStyle: UIAlertController.Style.alert)
            // キャンセルボタン
            let cancelAction: UIAlertAction = UIAlertAction(title: "はい", style: UIAlertAction.Style.cancel, handler:{
                (action: UIAlertAction!) -> Void in
            })
            
            // ③ UIAlertControllerにActionを追加
            alertController.addAction(cancelAction)
            // ④ Alertを表示
            present(alertController, animated: true, completion: nil)
        }
    }
}

