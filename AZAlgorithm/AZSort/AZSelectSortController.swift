//
//  AZSelectSortController.swift
//  AZAlgorithm
//
//  Created by wanghaohao on 2019/9/12.
//  Copyright © 2019 whao. All rights reserved.
//

import UIKit

class AZSelectSortController: UIViewController {
    private var dataSource:[Int] = [Int]()
    private lazy var textField:UITextField = {
        let text = UITextField()
        text.clearButtonMode = .whileEditing
        text.text = "3,888,8,33,1,222,11,121,45"
        return text
    } ()
    private lazy var search:UIButton = {
        let button = UIButton()
        button.setTitle("升序排序", for: .normal)
        button.addTarget(self, action: #selector(searchTap), for: .touchUpInside)
        button.backgroundColor = .black
        return button
    } ()
    
    private lazy var result:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.navigationItem.title = "选择排序O(n*n)"
        
        self.view.addSubview(textField)
        self.view.addSubview(search)
        self.view.addSubview(result)
        textField.frame = CGRect(x: 10, y: 100, width: 300, height: 30)
        search.frame = CGRect(x: 10, y: 140, width: 80, height: 30)
        result.frame = CGRect(x: 10, y: 180, width: 300, height: 100)
    }
    
    @objc private func searchTap() {
        let list:[Int] = textField.text?.components(separatedBy: ",").map({ (item) -> Int in
            return Int(item) ?? 0
        }) ?? [Int]()
        
        result.text = "排序结果：\n\(self.selectSortASC(list: list))"
        result.sizeToFit()
        print(result.text as Any)
    }
    
    private func selectSortASC(list:Array<Int>) -> [Int] {
        guard var smallest = list.first else {
            return []
        }
        var result = list
        print("开始排序：\(list)")
        for smallest_index in 1...(list.count - 1) {
            for index in smallest_index...(list.count - 1) {
                if smallest > result[index] {
                    // 交换最小值和index当前值位置
                    result[smallest_index - 1] = result[index]
                    result[index] = smallest
                    smallest = result[smallest_index - 1]
                }
            }
            //更新要对比的最小值
            smallest = result[smallest_index]
            print("排序\(smallest_index)：\(result)")
        }
        return result
    }
}
