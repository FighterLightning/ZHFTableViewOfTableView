//
//  RightCell.swift
//  ZHFTableViewOfTableView
//
//  Created by 张海峰 on 2017/10/16.
//  Copyright © 2017年 张海峰. All rights reserved.
//

import UIKit
protocol RightCellDelegate {
    func btnClick(index: NSInteger ,name: String)
}
class RightCell: UITableViewCell {
    var delegate: RightCellDelegate?
    @IBOutlet weak var titleLabel: UILabel!
    var arr:NSArray = NSArray(){
        didSet{
            for view in contentView.subviews {
                if view != titleLabel{
                    view.removeFromSuperview()
                }
            }
            for i in 0 ..< arr.count {
              //  let foodGrandchildModel:FoodGrandchildModel = arr[i] as! FoodGrandchildModel
                let btn:UIButton = UIButton.init(type: UIButtonType.custom)
                btn.frame = CGRect.init(x: CGFloat(i%4) * ((ScreenWidth-125)/4+10) + 10, y:50 + CGFloat(i/4*40), width: (ScreenWidth-125)/4, height: 30)
                btn.tag = i
                //foodGrandchildModel.id
                btn.layer.masksToBounds = true
                btn.layer.cornerRadius = 5
                btn.layer.borderWidth = 0.5
                btn.layer.borderColor = UIColor.initcolorWithAlpha(value: 0xcccccc).cgColor
                //foodGrandchildModel.name
                btn.setTitle("三级\(i)", for: UIControlState.normal)
                btn.setTitleColor(UIColor.initcolorWithAlpha(value: 0x666666), for: UIControlState.normal)
                btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
                btn.addTarget(self, action: #selector(btnClick), for: UIControlEvents.touchUpInside)
                contentView.addSubview(btn)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @objc func btnClick(Btn:UIButton){
        delegate?.btnClick(index:Btn.tag ,name:Btn.titleLabel!.text!)
    }
    
}
