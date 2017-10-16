//
//  LeftCell.swift
//  ZHFTableViewOfTableView
//
//  Created by 张海峰 on 2017/10/16.
//  Copyright © 2017年 张海峰. All rights reserved.
//

import UIKit

class LeftCell: UITableViewCell {
    @IBOutlet weak var foodIcon: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    let defaultColor :UIColor = UIColor.initcolorWithAlpha(value: 0x333333)
    let selectedColor : UIColor =  UIColor.initcolorWithAlpha(value: 0xEB6C42)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.isHighlighted = selected
        foodIcon.isHighlighted = selected
        if selected==true {
            foodName.textColor = selectedColor
        }
        else{
            foodName.textColor = defaultColor
        }
    }
    
}
