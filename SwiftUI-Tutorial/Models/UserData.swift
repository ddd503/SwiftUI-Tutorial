//
//  UserData.swift
//  SwiftUI-Tutorial
//
//  Created by kawaharadai on 2020/07/24.
//  Copyright © 2020 kawaharadai. All rights reserved.
//

import Combine

final class UserData: ObservableObject  {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
