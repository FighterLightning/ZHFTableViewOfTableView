//
//  FoodModel.swift
//  小胖厨
//
//  Created by 张海峰 on 2017/8/15.
//  Copyright © 2017年 张海峰. All rights reserved.
//

import UIKit

class FoodModel: NSObject {
    //名字
    var name:String?
    //图片
    var image:String?
    var name_highlighted:String?
    var FoodSonModelMarr:NSMutableArray = NSMutableArray()
    override init()
    {
        //在构造函数中，如果没有明确super.init()系统会默认生成
        super.init()
    }
    init(dict : [NSString :Any]) {
        super.init()
        setValuesForKeys(dict as [String : Any])
    }
    //kvc记得重写方法 防止没有声明的的属性（weight）解析错误
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
class FoodSonModel: NSObject {
    //标题
    var name:String = String()
    var tag:NSInteger = 0
    //内容
    var nameMarr:NSMutableArray = NSMutableArray()
    override init()
    {
        //在构造函数中，如果没有明确super.init()系统会默认生成
        super.init()
    }
    init(dict : [NSString :Any]) {
        super.init()
        setValuesForKeys(dict as [String : Any])
    }
    //kvc记得重写方法 防止没有声明的的属性（weight）解析错误
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
class FoodGrandchildModel: NSObject {
    //标题
    var name:String = String()
    var id:NSInteger = 0
    //内容
    var nameMarr:NSMutableArray = NSMutableArray()
    override init()
    {
        //在构造函数中，如果没有明确super.init()系统会默认生成
        super.init()
    }
    init(dict : [NSString :Any]) {
        super.init()
        setValuesForKeys(dict as [String : Any])
    }
    //kvc记得重写方法 防止没有声明的的属性（weight）解析错误
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
