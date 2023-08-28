//
//  Tab.swift
//  MacPawTestVersion1
//
//  Created by vuvuzelich on 27.08.2023.
//

import Foundation

struct Tab {
    static let home = Info(name: "Моделі", imageSystemName: "airplane")
    static let lastday = Info(name: "Сьогодні", imageSystemName: "info.circle")
}

extension Tab {
    struct Info {
        var name: String
        var imageSystemName: String
    }
}
