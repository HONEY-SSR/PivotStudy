//
//  UserBaseInfo.swift
//  PivotStudy
//
//  Created by SSR on 2023/3/12.
//

import Foundation

struct UserBaseInfo: Codable {
    var name: String
    var head: String
    var unread: Int
    var ontop: Bool
}

extension UserBaseInfo {
    static func fack() -> [UserBaseInfo] {
        [UserBaseInfo(name: "a", head: "head.system", unread: 0, ontop: true),
         UserBaseInfo(name: "b", head: "head.system", unread: 12, ontop: true),
         UserBaseInfo(name: "c", head: "head.system", unread: 98, ontop: false),
         UserBaseInfo(name: "d", head: "head.system", unread: 122, ontop: true),
         UserBaseInfo(name: "e", head: "head.system", unread: 32, ontop: false),
         UserBaseInfo(name: "t", head: "head.system", unread: 43, ontop: true),
        ]
    }
}
