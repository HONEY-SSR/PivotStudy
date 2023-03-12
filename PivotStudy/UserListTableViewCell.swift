//
//  UserListTableViewCell.swift
//  PivotStudy
//
//  Created by SSR on 2023/3/10.
//

import UIKit

class UserListTableViewCell: UITableViewCell {
    
    enum DrawType: String {
        case small = "UserListTableViewCellSmall"
        case medium = "UserListTableViewCellMedium"
    }
    
    // MARK: init
    
    private init() {
        fatalError("init() has not been implemented")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        onTop = false
        unread = 0
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(headImgView)
    }
    
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        if let reuseIdentifier = reuseIdentifier {
            if reuseIdentifier == DrawType.small.rawValue {
                let width = contentView.frame.height - 20
                headImgView.frame.size = .init(width: width, height: width)
                headImgView.center = contentView.center
                headImgView.layer.cornerRadius = headImgView.frame.height / 2
                headImgView.clipsToBounds = true
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        UIView.animate(withDuration: animated ? 0.2 : 0) {
            if selected {
                self.contentView.backgroundColor = .darkGray
            } else {
                self.onTop = self.onTop
            }
        }
    }
    
    // MARK: lazy
    
    lazy var headImgView: UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
    
    lazy var unreadLab: UILabel = {
        let lab = UILabel()
        lab.font = .systemFont(ofSize: 12)
        lab.textColor = .gray
        lab.text = " "
        lab.sizeToFit()
        lab.layer.cornerRadius = lab.frame.height / 2
        return lab
    }()
    
    // MARK: coculate
    
    var onTop: Bool {
        willSet {
            if newValue {
                contentView.backgroundColor = .lightGray
            } else {
                contentView.backgroundColor = .white
            }
        }
    }
    
    var unread: Int {
        willSet {
            if newValue <= 0 {
                unreadLab.isHidden = true
            } else {
                unreadLab.isHidden = false
                if newValue <= 99 {
                    unreadLab.text = " \(newValue) "
                    unreadLab.sizeToFit()
                } else {
                    unreadLab.text = " 99+ "
                    unreadLab.sizeToFit()
                }
            }
        }
    }
}

extension UserListTableViewCell {
    func setHeadImg(system name: String) {
        headImgView.image = UIImage(named: name)
    }
    func setHeadImg(url: String) {
        
    }
}
