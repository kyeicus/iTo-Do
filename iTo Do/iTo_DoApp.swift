//
//  iTo_DoApp.swift
//  iTo Do
//
//  Created by Emmanuel K. Nketia on 16/06/2022.
//

import SwiftUI

@main
struct iTo_DoApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
