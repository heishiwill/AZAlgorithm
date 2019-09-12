//
//  ViewController.swift
//  AZAlgorithm
//
//  Created by wanghaohao on 2019/9/11.
//  Copyright © 2019 whao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private lazy var tableview:UITableView = {
        let tb = UITableView(frame: .zero, style: .grouped)
        tb.dataSource = self
        tb.delegate = self
        
        tb.register(ControllerCell.self, forCellReuseIdentifier: ControllerCell.description())
        return tb
    }()
    private let dataSource:[(String,[String])] = [("排序", ["选择排序"]), ("查找", ["二分查找"]), ("其他", ["递归"])]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(tableview)
        tableview.frame = self.view.bounds
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headview = UIView()
        var rect = tableView.bounds
        rect.origin.y = 0
        rect.size.height = 50
        headview.frame = rect
        
        let label = UILabel()
        label.text = dataSource[section].0
        rect.origin.x = 10
        label.frame = rect
        headview.addSubview(label)
        return headview
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource[section].1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ControllerCell.description())
        cell?.textLabel?.text = self.dataSource[indexPath.section].1[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                self.navigationController?.pushViewController(AZSelectSortController(), animated: true)
            }
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                self.navigationController?.pushViewController(AZBinarySearchController(), animated: true)
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                self.navigationController?.pushViewController(AZRecursiveController(), animated: true)
            }
        }
    }
}

class ControllerCell: UITableViewCell {
    
}

/*
 算法运行时间并不以秒为单位。
 算法运行时间是从其增速的角度度量的。
 算法运行时间用大O表示法表示。
 */
