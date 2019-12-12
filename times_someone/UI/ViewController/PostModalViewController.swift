//
//  PostModalViewController.swift
//  times_someone
//
//  Created by 能美龍星 on 2019/11/26.
//  Copyright © 2019 Ryusei Nomi. All rights reserved.
//

import Foundation
import UIKit

class PostModalViewController: UIViewController
{
    let titleLabel = UILabel()
    let textArea = UITextField()
    let submitButton = SubmitButton()
    let postPresenter = ReportPostPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: containerViewのサイズを取得し、各コンポーネントのx軸y軸をモーダルのサイズに合わせる
        /* Title label Setting */
        titleLabel.text = "投稿する"
        titleLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        titleLabel.layer.position = CGPoint(x: view.frame.width/2, y: 50)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        
        /* Text Field Setting */
        textArea.placeholder = "今何をしていますか？"
        textArea.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
        textArea.layer.position = CGPoint(x: view.frame.width/2, y: 100)
        textArea.layer.borderWidth = 1.0
        textArea.delegate = self
        view.addSubview(textArea)
        
        /* Submit Button Setting */
        //TODO テキストを折り返して表示
        //TODO Enterでキーボードを閉じるのではなく、「完了」ボタンを押すとこキーボードが隠れるようにする
        submitButton.setTitle("投稿", for: UIControl.State.normal)
        submitButton.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        submitButton.layer.position = CGPoint(x: view.frame.width/2, y: 400)
        submitButton.backgroundColor = UIColor(red: 0.3, green: 0.7, blue: 0.6, alpha: 1)
        //TODO postReportをこのクラス内でwrapして投稿の結果を受け取る
        submitButton.addTarget(self, action: Selector(("postReport:")), for: .touchUpInside)
        view.addSubview(submitButton)
        
        view.backgroundColor = UIColor.white
    }
    
    @objc func postReport(_ sender: SubmitButton) {
        print(sender.postContent!)
        self.getReportPostPresenter().postReport(content: sender.postContent!) { isSuccess in
            self.displayAlert()
        }
    }
    
    private func getReportPostPresenter() -> ReportPostPresenter {
        let postReport = ReportPostPresenter()
        return postReport
    }
    
    private func displayAlert() {
        let alert: UIAlertController = UIAlertController(title: "アラート表示", message: "投稿しました", preferredStyle:  UIAlertController.Style.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            print("OK")
        })
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
}

/**
 * 投稿ボタンにStringパラメータを持たせるためにオーバーライド
 */
class SubmitButton: UIButton
{
    var postContent:String?
}

extension PostModalViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        submitButton.postContent = textArea.text!
        view.endEditing(true)
        return false
    }
}
