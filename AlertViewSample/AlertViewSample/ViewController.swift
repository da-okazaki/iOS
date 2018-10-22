//
//  ViewController.swift
//  AlertViewSample
//
//  Created by 岡崎大地 on 2018/10/22.
//  Copyright © 2018年 daichi okazaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self

    }
    // 画面タップ キーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    // Return キーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }

    // SecondView へ遷移する
    @IBAction func SecondAction(_ sender: Any) {
        // 次の画面へ遷移する Alert を表示
        if (textField.text == "1234") {
            // Alert 文言
            let alertController = UIAlertController(title: "IDが一致しました", message: "画面遷移しますか？", preferredStyle: UIAlertController.Style.alert)
            
            // OKボタン
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{(action: UIAlertAction!) in
                
                // 画面遷移コード
                let storyboard: UIStoryboard = self.storyboard!
                let nextView = storyboard.instantiateViewController(withIdentifier: "second")
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
        
        // ID が空だった場合の Alert を表示
        } else if (textField.text == "") {
            // Alert 文言
            let alertController = UIAlertController(title: "IDが入力されていません", message: "もう一度入力してください", preferredStyle: UIAlertController.Style.alert)
            
            // はいボタン
            let okAction = UIAlertAction(title: "はい", style: UIAlertAction.Style.default, handler:{
                
                (action: UIAlertAction!) -> Void in
                
            })
            
            // ③ UIAlertControllerにActionを追加
            alertController.addAction(okAction)
            
            // ④ Alertを表示
            present(alertController, animated: true, completion: nil)

        // ID が間違っている通知の Alert を表示
        } else {
            // Alert 文言
            let alertController = UIAlertController(title: "IDが一致しません", message: "もう一度入力してください", preferredStyle: UIAlertController.Style.alert)
            
            // はいボタン
            let okAction = UIAlertAction(title: "はい", style: UIAlertAction.Style.default, handler:{
                
                (action: UIAlertAction!) -> Void in
                
            })
            
            // ③ UIAlertControllerにActionを追加
            alertController.addAction(okAction)
            
            // ④ Alertを表示
            present(alertController, animated: true, completion: nil)
            
        }
    }
}

