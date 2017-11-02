//
//  ViewController.swift
//  GJTimeButton
//
//  Created by gaojun on 2017/11/2.
//  Copyright © 2017年 GJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let btn = TimerButton.init(frame:CGRect(x:view.frame.size.width / 2 - 50 , y: 100, width: 100, height: 30))
        btn.setup("发送", timeTitlePrefix: "剩余")
        btn.clickBtnEvent = {
            () -> Void in
            
                if !btn.isWorking{
                    
                    //访问接口，获取验证码
                    
                    btn.isWorking = true
                }
            
        }
        view.addSubview(btn)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

