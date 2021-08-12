//
//  SwiftViewController.swift
//  DiskSpaceDemo
//
//  Created by Anmo on 2021/8/12.
//

import UIKit

class SwiftViewController: UIViewController {

    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = self.diskSpace
        self.view.addSubview(label);
    }
    
    fileprivate var diskSpace: String {
        let space = "总内存：\(UIDevice.current.totalDiskSpaceInGB) \n已使用内存：\(UIDevice.current.usedDiskSpaceInGB) \n可用内存：\(UIDevice.current.freeDiskSpaceInGB)"
        return space
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
    }
}
