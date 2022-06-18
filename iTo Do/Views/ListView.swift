//
//  ListView.swift
//  iDo
//
//  Created by Emmnauel K. Nketia on 1/19/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                Text("No items")
            } else {
                List{
                    ForEach(listViewModel.items) { item  in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                
                .listStyle(PlainListStyle())
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("iDo List")
            }
            ToolbarItem(placement: .navigation) {
                EditButton()
            }
            ToolbarItem(placement: .automatic) {
                NavigationLink("Add", destination: AddView())
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
