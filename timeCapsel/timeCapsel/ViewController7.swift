//
//  ViewController7.swift
//  timeCapsel
//
//  Created by 岡本航輝 on 2016/09/10.
//  Copyright © 2016年 mycompany. All rights reserved.
//

import Foundation
import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func >= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l >= r
  default:
    return !(lhs < rhs)
  }
}

class ViewController7: UIViewController {
    let userDefaults=UserDefaults.standard
    /*
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var ttext: UITextView!
    @IBOutlet weak var sousint: UIButton!
    @IBAction func tapscreen(sender: UITapGestureRecognizer) {
    }*/
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var ttext: UITextView!
    @IBOutlet weak var sousint: UIButton!
    @IBAction func taptap(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func sousin(_ sender: AnyObject) {
        let alert: UIAlertController = UIAlertController(title: "警告", message: "手紙を送ってもいいですか?", preferredStyle:  UIAlertControllerStyle.alert)
        
        // ② Actionの設定
        // Action初期化時にタイトル, スタイル, 押された時に実行されるハンドラを指定する
        // 第3引数のUIAlertActionStyleでボタンのスタイルを指定する
        // OKボタン
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            let date=Date()
        let calendar=Calendar.current
        let component=(calendar as NSCalendar).components([NSCalendar.Unit.year,NSCalendar.Unit.month,NSCalendar.Unit.day,NSCalendar.Unit.hour,NSCalendar.Unit.minute],from: date)
        self.userDefaults.set(component.year, forKey: "year20")
        self.userDefaults.set(component.month, forKey: "month20")
        self.userDefaults.set(component.day, forKey: "day20")
        self.userDefaults.set(self.ttext.text, forKey: "Text20")
        self.userDefaults.synchronize()
        var Y=Int(self.userDefaults.string(forKey: "year20")!)
        let M=Int(self.userDefaults.string(forKey: "month20")!)
        let D=Int(self.userDefaults.string(forKey: "day20")!)
        self.ttext.text=""
        self.label2.text=NSLocalizedString("20年後にメッセージを送りました。", comment: "")
        Y=Y!+20
        let str=(Y?.description)!+"/"+(M?.description)!+"/"
        self.label3.text=str+(D?.description)!+NSLocalizedString("/にメッセージが届きます",comment:"")
        self.label3.textColor=UIColor.white
        self.ttext.isHidden=true
        self.sousint.isHidden=true
        self.sousint.isEnabled=false
            //print("OK")
        })
        // キャンセルボタン
        let cancelAction: UIAlertAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.cancel, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            //print("Cancel")
        })
        
        // ③ UIAlertControllerにActionを追加
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        
        // ④ Alertを表示
        present(alert, animated: true, completion: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label2.text=NSLocalizedString("20年後に届けるメッセージです", comment: "")
        
        if let tt=userDefaults.string(forKey: "Text20"){
            ttext.isHidden=true
            sousint.isHidden=true
            var Y=Int(userDefaults.string(forKey: "year20")!)
            let M=Int(userDefaults.string(forKey: "month20")!)
            let D=Int(userDefaults.string(forKey: "day20")!)
            //var A=0
            Y=Y!+20
            let date1=Date()
            let calendar1=Calendar.current
            let component1=(calendar1 as NSCalendar).components([NSCalendar.Unit.year,NSCalendar.Unit.month,NSCalendar.Unit.day,NSCalendar.Unit.hour,NSCalendar.Unit.minute],from: date1)
            if(Y==component1.year && M==component1.month && component1.day>=D){
                label2.text=NSLocalizedString("過去からあなたにメッセージが届きました", comment: "")
                ttext.isHidden=false
                ttext.isEditable=false
                ttext.text=tt
            }else if(Y==component1.year && M<component1.month){
                label2.text=NSLocalizedString("過去からあなたにメッセージが届きました", comment: "")
                ttext.isHidden=false
                ttext.isEditable=false
                ttext.text=tt
            }else if(Y<component1.year){
                label2.text=NSLocalizedString("過去からあなたにメッセージが届きました", comment: "")
                ttext.isHidden=false
                ttext.isEditable=false
                ttext.text=tt
            }else{
                
                label2.text = NSLocalizedString("メッセージは届けられている途中です", comment: "")
                let str=(Y?.description)!+"/"+(M?.description)!+"/"
                label3.text=str+(D?.description)!+NSLocalizedString("/にメッセージが届きます",comment:"")
            }
            label3.textColor=UIColor.white
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //var tim2=""
    
}
