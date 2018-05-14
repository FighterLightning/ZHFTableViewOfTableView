//
//  ViewController.swift
//  ZHFTableViewOfTableView
//
//  Created by 张海峰 on 2017/10/16.
//  Copyright © 2017年 张海峰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let RightTableViewCellIdentifier:String = "RightTableViewCellIdentifier"
    let LeftTableViewCellIdentifier:String = "LeftTableViewCellIdentifier"
    lazy var foodDataMarr : NSMutableArray = NSMutableArray()
    lazy var leftTableView : UITableView = UITableView()
    lazy var rightTableView : UITableView = UITableView()
    var selectIndex : NSInteger = 0
    var isScrollDown : Bool = true
    var lastOffsetY : CGFloat = 0;
    var foodmodel:FoodModel!
    var foodSonModel:FoodSonModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    func setUI(){
        self.leftTableView.frame = CGRect.init(x: 0, y: 0, width: 75, height: self.view.bounds.height)
        self.leftTableView.delegate = self;
        self.leftTableView.dataSource = self;
        self.leftTableView.rowHeight = 150;
        self.leftTableView.tableFooterView = UIView();
        self.leftTableView.showsVerticalScrollIndicator = false;
        self.leftTableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        self.leftTableView.register(UINib.init(nibName: "LeftCell", bundle: nil), forCellReuseIdentifier: LeftTableViewCellIdentifier)
        view.addSubview(self.leftTableView)
        self.rightTableView.frame = CGRect.init(x: 75.5, y:50, width: ScreenWidth-75.5, height:self.view.bounds.height - 50)
        self.rightTableView.delegate = self;
        self.rightTableView.dataSource = self;
        self.rightTableView.rowHeight = 150;
        self.rightTableView.showsVerticalScrollIndicator = false;
        self.rightTableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        self.rightTableView.register(UINib.init(nibName: "RightCell", bundle: nil), forCellReuseIdentifier: RightTableViewCellIdentifier)
        view.addSubview(self.rightTableView)
        for i in 0 ..< 6{
            let foodDic : [NSString : Any] = ["child":[["child":[
                ["name":"三级\(i)","id":i,],
                ["name":"三级\(i)","id":i,],
                ["name":"三级\(i)","id":i,],
                ["name":"三级\(i)","id":i,],
                ["name":"三级\(i)","id":i,],
                ["name":"三级\(i)","id":i,],
                ["name":"三级\(i)","id":i,],
                ["name":"三级\(i)","id":i,],
                ["name":"三级\(i)","id":i,],
                ["name":"三级\(i)","id":i,],
                ["name":"三级\(i)","id":i,],
                ["name":"三级\(i)","id":i,],
                ["name":"三级\(i)","id":i,],
                ["name":"三级\(i)","id":i,],
                ["name":"三级\(i)","id":i,],
                ["name":"三级\(i)","id":i,],
                ["name":"三级\(i)","id":i,],
                ["name":"三级\(i)","id":i,],
                ["name":"三级\(i)","id":i,]
                ], "name":"二级\(i)","tag":i,
                ],["child":[["name":"三级\(i)","id":i,],
                            ["name":"三级\(i)","id":i,],
                            ["name":"三级\(i)","id":i,],
                            ["name":"三级\(i)","id":i,],
                            ["name":"三级\(i)","id":i,],
                            ["name":"三级\(i)","id":i,],
                            ["name":"三级\(i)","id":i,],
                            ["name":"三级\(i)","id":i,],
                            ["name":"三级\(i)","id":i,],
                            ["name":"三级\(i)","id":i,],
                            ["name":"三级\(i)","id":i,],
                            ["name":"三级\(i)","id":i,],
                            ["name":"三级\(i)","id":i,]],
                   "name":"二级\(i)","tag":i,
                   ],["child":[["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,],
                               ["name":"三级\(i)","id":i,]
                    ],
                    "name":"二级\(i)",
                    "tag":i,
                ]],
                "name":"一级\(i)",
                "image":"image\(i)",
                "name_highlighted":"name_highlighted\(i)",
                ] as [NSString : Any]
            //左边数据
            self.foodmodel = FoodModel.init(dict: foodDic)
            self.foodmodel.name = foodDic["name"] as? String
            self.foodmodel.image = foodDic["image"] as? String
            self.foodmodel.name_highlighted = foodDic["name_highlighted"] as? String
            let dataArr :NSArray = foodDic["child"] as! NSArray
            for j in 0 ..< dataArr.count {
                let foodSonDic : [NSString : Any] = dataArr[j] as![NSString : Any]
                ZHFLog(message: foodSonDic)
                self.foodSonModel = FoodSonModel.init()
                self.foodSonModel.name = foodSonDic["name"] as! String
                self.foodSonModel.tag = foodSonDic["tag"]! as! NSInteger
                let data1Arr :NSArray = foodSonDic["child"] as! NSArray
                for k in 0 ..< data1Arr.count {
                    let foodGrandchildDic : [NSString : Any] = data1Arr[k] as![NSString : Any]
                    let foodGrandchildModel:FoodGrandchildModel = FoodGrandchildModel.init()
                    foodGrandchildModel.name = foodGrandchildDic["name"] as! String
                    foodGrandchildModel.id = foodGrandchildDic["id"]! as! NSInteger
                    self.foodSonModel.nameMarr.add(foodGrandchildModel)
                }
                self.foodmodel.FoodSonModelMarr.add(self.foodSonModel)
            }
            self.foodDataMarr.add(self.foodmodel)
        }
        self.rightTableView.reloadData()
        self.leftTableView.reloadData()
    }
 }
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    public func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == self.leftTableView {
            return 1
        }
        else{
            return self.foodDataMarr.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.leftTableView == tableView
        {
            return self.foodDataMarr.count;
        }
        else
        {
            self.foodmodel = self.foodDataMarr[section] as! FoodModel;
            return self.foodmodel.FoodSonModelMarr.count ;
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (self.leftTableView == tableView)
        {
            let cell: LeftCell  = tableView.dequeueReusableCell(withIdentifier: LeftTableViewCellIdentifier, for: indexPath) as! LeftCell
            self.foodmodel = self.foodDataMarr[indexPath.row] as! FoodModel
            ZHFLog(message: self.foodDataMarr[indexPath.row])
            cell.foodName.text = self.foodmodel.name;
            if let iconStr: String = self.foodmodel.image{
                if iconStr.isEmpty {}
                else{
                    cell.foodIcon.image = UIImage.init(named: iconStr)
                    cell.foodIcon.highlightedImage = UIImage.init(named: self.foodmodel.name_highlighted!)
                }
            }
             //如果用SDWebImage
//            if let iconStr: String = foodmodel.image{
//                if iconStr.isEmpty {}
//                else{
//                    //为了加载第一张图片先加载后选择
//                    if indexPath.row == 0{
//                        let url : URL = URL.init(string:iconStr)!
//                        let data = NSData.init(contentsOf: url)
//                        cell.foodIcon.image = UIImage.init(data:data! as Data)
//                    }
//                    else{
//                        cell.foodIcon.sd_setImage(with:  URL.init(string:iconStr)!)
//                    }
//                }
//
//            }
//            if let iconActiveStr: String = foodmodel.icon_active_url{
//                if iconActiveStr.isEmpty {}
//                else{
//                    //为了加载第一张图片先加载后选择
//                    if indexPath.row == 0{
//                        let url : URL = URL.init(string:base_image_url+iconActiveStr)!
//                        let data = NSData.init(contentsOf: url)
//                        cell.foodIcon.highlightedImage = UIImage.init(data:data! as Data)
//                    }
//                    else{
//                        cell.foodIcon.sd_setHighlightedImage(with: URL.init(string:base_image_url+iconActiveStr)!)
//                    }
//                }
//            }
            cell.selectionStyle = UITableViewCellSelectionStyle.none;
            return cell;
        }
       
        else
        {
            ZHFLog(message: indexPath)
            let cell: RightCell  = tableView.dequeueReusableCell(withIdentifier: RightTableViewCellIdentifier, for: indexPath) as! RightCell
            cell.delegate = self
            self.foodmodel = self.foodDataMarr[indexPath.section] as! FoodModel
            self.foodSonModel = self.foodmodel.FoodSonModelMarr[indexPath.row] as! FoodSonModel
            cell.titleLabel.text = self.foodSonModel.name
            cell.arr = self.foodSonModel.nameMarr
            cell.selectionStyle = UITableViewCellSelectionStyle.none;
            return cell;
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if rightTableView  == tableView {
            let foodmodel1 = foodDataMarr[indexPath.section] as! FoodModel
            let foodSonModel1 = foodmodel1.FoodSonModelMarr[indexPath.row] as! FoodSonModel
            let count :CGFloat = CGFloat(foodSonModel1.nameMarr.count)
            return 70 + count/4 * 40
        }
        else{
            return 100
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view :UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: 0.5))
        view.backgroundColor = UIColor.white
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.5
    }
    // TableView分区标题即将展示
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //将要显示
        // 当前的tableView是RightTableView，RightTableView滚动的方向向上，RightTableView是用户拖拽而产生滚动的（（主要判断RightTableView用户拖拽而滚动的，还是点击LeftTableView而滚动的）
        if (rightTableView == tableView)
        {
            selectRowAtIndexPath(index: section)
        }
    }
    // TableView分区标题展示结束
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        //结束显示
        // 当前的tableView是RightTableView，RightTableView滚动的方向向下，RightTableView是用户拖拽而产生滚动的（（主要判断RightTableView用户拖拽而滚动的，还是点击LeftTableView而滚动的）
        if (rightTableView == tableView && isScrollDown == true && rightTableView.isDragging)
        {
            selectRowAtIndexPath(index: section + 1)
        }
        if (rightTableView == tableView && isScrollDown == false && rightTableView.isDragging)
        {
            selectRowAtIndexPath(index: section - 1)
        }
        
    }
    func selectRowAtIndexPath(index:Int){
        
        leftTableView.selectRow(at: NSIndexPath.init(row: index, section: 0) as IndexPath, animated: true, scrollPosition: UITableViewScrollPosition.top)
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if leftTableView == tableView
        {
            selectIndex = indexPath.row;
            rightTableView.scrollToRow(at: NSIndexPath.init(row: 0, section: selectIndex) as IndexPath, at: UITableViewScrollPosition.top, animated: true)
            leftTableView.scrollToRow(at: NSIndexPath.init(row: selectIndex, section: 0) as IndexPath, at: UITableViewScrollPosition.top, animated: true)
        }
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let tableView : UITableView = scrollView as! UITableView;
        if rightTableView == tableView
        {
            if lastOffsetY < scrollView.contentOffset.y
            {
                isScrollDown = true
            }
            else{
                isScrollDown = false
            }
            lastOffsetY = scrollView.contentOffset.y;
        }
    }
}
extension ViewController:RightCellDelegate{
    func btnClick(index: Int, name: String) {
        
      ZHFAlertControllerTool.showAlert(currentVC: self, cancelBtn: "确定", meg: "你点击了\(name)")
    }
}
