//
//  UserListView.swift
//  PivotStudy
//
//  Created by SSR on 2023/3/12.
//

import UIKit

class UserListView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var users: [UserBaseInfo] {
        get {
            return topGroup + baseGroup
        }
        set {
            topGroup = newValue.filter { $0.ontop }
            baseGroup = newValue.filter { !($0.ontop) }
        }
    }
    private var topGroup, baseGroup: [UserBaseInfo]!
    
    override func draw(_ rect: CGRect) {
        tableView.frame.size = rect.size
        tableView.reloadData()
    }
    
    // MARK: lazy
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = .zero
        tableView.register(UserListTableViewCell.self, forCellReuseIdentifier: UserListTableViewCell.DrawType.small.rawValue)
        tableView.register(UserListTableViewCell.self, forCellReuseIdentifier: UserListTableViewCell.DrawType.medium.rawValue)
        return tableView
    }()
    
    // MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? topGroup.count : baseGroup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserListTableViewCell.DrawType.small.rawValue, for: indexPath) as! UserListTableViewCell
        
        if indexPath.section == 0 {
            cell.setHeadImg(system: topGroup[indexPath.row].head)
            cell.onTop = true
        } else {
            cell.setHeadImg(system: baseGroup[indexPath.row].head)
            cell.onTop = false
        }
        
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0
    }
}
