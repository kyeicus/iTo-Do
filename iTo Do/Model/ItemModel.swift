//
//  ItemModel.swift
//  iDo
//
//  Created by Emmanuel K. Nketia on 15/06/2022.
//

import Foundation

struct Items: Identifiable, Codable{
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    func updateCOmpletion() -> Items {
        return Items(id: id, title: title, isCompleted: !isCompleted)
    }
}
