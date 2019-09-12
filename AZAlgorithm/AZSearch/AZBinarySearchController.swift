//
//  AZBinarySearchController.swift
//  AZAlgorithm
//
//  Created by wanghaohao on 2019/9/11.
//  Copyright © 2019 whao. All rights reserved.
//

import UIKit

class AZBinarySearchController: UIViewController {
    private var dataSource:[Int] = [Int]()
    private lazy var textField:UITextField = {
        let text = UITextField()
        text.clearButtonMode = .whileEditing
        text.text = "1,3,8,11,33,45,121,222,888"
        return text
    } ()
    
    private lazy var targetField:UITextField = {
        let text = UITextField()
        text.clearButtonMode = .whileEditing
        text.text = "33"
        text.leftViewMode = .always
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        label.textColor = .black
        label.text = "查找:"
        text.leftView = label
        return text
    } ()
    private lazy var search:UIButton = {
        let button = UIButton()
        button.setTitle("查找", for: .normal)
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
        self.navigationItem.title = "二分查找"
        
        self.view.addSubview(textField)
        self.view.addSubview(targetField)
        self.view.addSubview(search)
        self.view.addSubview(result)
        textField.frame = CGRect(x: 10, y: 100, width: 300, height: 30)
        targetField.frame = CGRect(x: 10, y: 140, width: 300, height: 30)
        search.frame = CGRect(x: 10, y: 180, width: 80, height: 30)
        result.frame = CGRect(x: 10, y: 220, width: 300, height: 100)
    }
    
    @objc private func searchTap() {
        let list:[Int] = textField.text?.components(separatedBy: ",").map({ (item) -> Int in
            return Int(item) ?? 0
        }) ?? [Int]()
        let result = self.binary_search(list: list, target: Int(targetField.text ?? "0") ?? 0)
        self.result.text = "从\(String(describing: textField.text))\n查找\(String(describing: targetField.text))\n位置结果：\(String(describing: result))"
        self.result.sizeToFit()
    }
    
    private func binary_search(list:Array<Int>, target:Int) -> Int? {
        if list.count == 0 {return nil}
        var startIndex:Int = 0
        var endIndex:Int = list.count - 1
        var index:Int = 0
        print("开始二分查找……………………")
        while endIndex >= startIndex {
            //取中间索引值
            index = startIndex + (endIndex - startIndex) >> 1
            print("startIndex = \(startIndex) endIndex = \(endIndex) index = \(index)")
            if target > list[index] {
                startIndex = index + 1
            } else if target < list[index] {
                endIndex = index - 1
            } else if target == list[index] {
                return index
            }
        }
        return nil
    }
}

/*
 O(log n)，也叫对数时间，这样的算法包括二分查找。
 O(n)，也叫线性时间，这样的算法包括简单查找。
 O(n  * log n)，这样的算法包括第4章将介绍的快速排序——一种速度较快的排序算法。
 O(n 2 )，这样的算法包括第2章将介绍的选择排序——一种速度较慢的排序算法。
 
 O(n!)，这样的算法包括接下来将介绍的旅行商问题的解决方案——一种非常慢的算法。
 
 PS：算法的速度指的并非时间，而是操作数的增速。
 谈论算法的速度时，我们说的是随着输入的增加，其运行时间将以什么样的速度增加。
 */
