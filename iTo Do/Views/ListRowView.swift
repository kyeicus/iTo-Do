//
//  ListRowView.swift
//  iDo
//
//  Created by Emmnauel K. Nketia on 1/19/22.
//

import SwiftUI

struct ListRowView: View {
    
    let item: Items
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red )
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = Items(title: "First", isCompleted: false)
    static var item2 = Items(title: "Secomnd ", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
