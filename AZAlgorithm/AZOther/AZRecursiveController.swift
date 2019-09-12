//
//  AZRecursiveController.swift
//  AZAlgorithm
//
//  Created by wanghaohao on 2019/9/12.
//  Copyright © 2019 whao. All rights reserved.
//

import UIKit

class AZRecursiveController: UIViewController {
    private var dataSource:[Int] = [Int]()
    private lazy var textField:UITextField = {
        let text = UITextField()
        text.isUserInteractionEnabled = false
        text.clearButtonMode = .whileEditing
        text.text = "1...7 相加"
        return text
    } ()
    private lazy var search:UIButton = {
        let button = UIButton()
        button.setTitle("递归计算", for: .normal)
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
        self.navigationItem.title = "(尾)递归O(n)"
        
        self.view.addSubview(textField)
        self.view.addSubview(search)
        self.view.addSubview(result)
        textField.frame = CGRect(x: 10, y: 100, width: 300, height: 30)
        search.frame = CGRect(x: 10, y: 140, width: 80, height: 30)
        result.frame = CGRect(x: 10, y: 180, width: 300, height: 100)
    }
    
    @objc private func searchTap() {
        result.text = "递归相加结果：\(self.sum(x: 7))\n尾递归相加结果：\(self.sum(x: 7, result: 7))"
        result.sizeToFit()
        print(result.text as Any)
    }
    //MARK:1……x相加 递归
    private func sum(x:Int) -> Int {
        print("\(x)")
        //基线条件
        if x == 1 {
            return 1
        }
        //递归条件
        return x + sum(x: x - 1)
    }
    
    //MARK:1……x相加 尾递归
    private func sum(x:Int, result:Int) -> Int {
        print("\(x)")
        //基线条件
        if x == 1 {
            return result
        }
        //递归条件
        return sum(x: x - 1, result:result + (x - 1))
    }
}

/*
 x*f(x-1)
 每个递归函数都有两部分：基线条件（base case）和递归条件（recursive case）。
 递归条件指的是函数调用自己，而基线条件则指的是函数不再调用自己，从而避免形成无限循环。
 尾递归就是把当前的运算结果（或路径）放在参数里传给下层函数
 */
