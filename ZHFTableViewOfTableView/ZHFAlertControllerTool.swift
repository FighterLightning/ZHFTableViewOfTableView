//
//  ZHFAlertControllerTool.swift
//  Fattykitchen
//
//  Created by 张海峰 on 2017/8/30.
//  Copyright © 2017年 张海峰. All rights reserved.
//

import Foundation
import UIKit
class ZHFAlertControllerTool {
    /**
     alterController 两个按钮 处理otherBtn事件
     
     - parameter currentVC: 当前控制器
     - parameter meg:       提示消息
     - parameter cancelBtn: 取消按钮
     - parameter otherBtn:  其他按钮
     - parameter handler:   其他按钮处理事件
     */
    static func showAlert(currentVC:UIViewController, meg:String, okBtn:String, handler:((UIAlertAction) -> Void)?){
            let alertController = UIAlertController(title:"温馨提示",message:meg , preferredStyle: .alert)
            if okBtn != nil{
                let settingsAction = UIAlertAction(title: okBtn, style: .default, handler: { (action) -> Void in
                    handler?(action)
                })
                alertController.addAction(settingsAction)
            }
            currentVC.present(alertController, animated: true, completion: nil)
    }
    
    
    /**
     alterController 一个按钮 不处理事件，简单实用
     
     - parameter currentVC: 当前控制器
     - parameter meg:       提示消息
     */
    static func showAlert(currentVC:UIViewController, cancelBtn:String, meg:String){
        let alertController = UIAlertController(title:"温馨提示",message:meg , preferredStyle: .alert)
        let cancelAction = UIAlertAction(title:cancelBtn, style: .cancel, handler:nil)
        alertController.addAction(cancelAction)
        currentVC.present(alertController, animated: true, completion: nil)
    }
    
    
    /**
     两个按钮 都处理事件
     
     - parameter currentVC:     当前控制器
     - parameter meg:           提示消息
     - parameter cancelBtn:     取消按钮
     - parameter otherBtn:      其他按钮
     - parameter cencelHandler: 取消按钮事件回调 （不处理可不写，考虑到有些场合需要使用）
     - parameter handler:       其他按钮事件回调
     */
    static func showAlert(currentVC:UIViewController, meg:String, oneBtn:String, otherBtn:String?,oneHandler:((UIAlertAction) -> Void)?, otherHandler:((UIAlertAction) -> Void)?){
       
            let alertController = UIAlertController(title:"温馨提示",
                                                    message:meg ,
                                                    preferredStyle: .alert)
            let cancelAction = UIAlertAction(title:oneBtn, style: .cancel, handler:{ (action) -> Void in
                oneHandler?(action)
            })
            alertController.addAction(cancelAction)
            if otherBtn != nil{
                let settingsAction = UIAlertAction(title: otherBtn, style: .default, handler: { (action) -> Void in
                    otherHandler?(action)
                })
                alertController.addAction(settingsAction)
            }
            currentVC.present(alertController, animated: true, completion: nil)
}
}
