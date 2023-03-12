//
//  ViewController.swift
//  PivotStudy
//
//  Created by SSR on 2023/3/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        view.addSubview(userListView)
    }
    
    lazy var userListView: UserListView = {
        let view = UserListView(frame: CGRect(x: 0, y: 0, width: 200, height: view.frame.height))
        view.users = UserBaseInfo.fack()
        return view
    }()
}
