//
//  ListViewModel.swift
//  iDo
//
//  Created by Emmanuel K. Nketia on 16/06/2022.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [Items] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    init() {
        getItems()
    }
    func getItems() {
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItem = try? JSONDecoder().decode([Items].self, from: data)
                
        else { return }
        self.items = saveItem
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func addItem(title: String) {
        let newItem = Items(title:  title, isCompleted: false)
        items.append(newItem)
    }
    func moveItem(from: IndexSet, to: Int ){
        items.move(fromOffsets: from, toOffset: to )
    }
    func updateItem(item: Items) {
        
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items [index] = item.updateCOmpletion()
        }
    }
    
    func saveItems() {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
        }
    }
}
