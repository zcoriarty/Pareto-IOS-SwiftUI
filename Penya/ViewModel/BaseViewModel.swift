//
//  BaseViewModel.swift
//  Penya
//
//  Created by Zachary Coriarty on 1/21/22.
//

import SwiftUI

class BaseViewModel: ObservableObject {
    
    @Published var currentTab: BottomTab = .HomeT
}

enum BottomTab: String,CaseIterable {
    case HomeT = "house.fill"
    case ExploreT = "magnifyingglass"
    case ChatT = "bubble.left.and.bubble.right.fill"
}
